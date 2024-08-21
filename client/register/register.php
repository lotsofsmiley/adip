<?php
session_start();

require('../../assets/scripts/db/connect.php');

require '../../PHPMailer/src/Exception.php';
require '../../PHPMailer/src/PHPMailer.php';
require '../../PHPMailer/src/SMTP.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;



if (!isset($_POST['email'], $_POST['password'], $_POST['confpassword'])) {
    exit('Preencha os campos necessários!');
}

$email = $_POST['email'];
$password = $_POST['password'];
$confPassword = $_POST['confpassword'];


if ($password !== $confPassword) {
    exit('As passwords não são iguais!');
}
$hashedPassword = sha1($password);

    $stmt = $conn->prepare('INSERT INTO user (email, password, role, verified, gender) VALUES (?, ?, ?, ?, ?)');
    $stmt->bind_param("ssiii", $email, $hashedPassword, $role, $verified, $gender);
    $role = 1;
    $verified = 0;
    $gender = 1;
    $result = $stmt->execute();


if ($stmt = $conn->prepare('SELECT id, name, email, phone_number, nacionality, birthdate, verified, gender, role, password FROM user AS u WHERE email = ?')) {
    $stmt->bind_param('s', $_POST['email']);
    $stmt->execute();
    $stmt->store_result();
    if ($stmt->num_rows > 0) {
        $stmt->bind_result($id, $name, $email, $phone, $nacionality, $birth, $verified, $gender, $role, $password);
        $stmt->fetch();


        $mail = new PHPMailer(true);
        $mail->isSMTP();
        $mail->Host = 'smtp.gmail.com';
        $mail->SMTPAuth = true;
        $mail->Username = 'manolipas69@gmail.com';
        $mail->Password = 'annnsvlatxmqcqbb';
        $mail->SMTPSecure = 'tls';
        $mail->Port = 587;
        $mail->setFrom('adayinporto@gmail.com', 'aDayinPorto');
        $mail->addAddress($email);
        $mail->isHTML(true);
        $mail->CharSet = 'UTF-8';

        $verification = 'localhost/adip/client/account/verify.php';

        $mail->Subject = 'Verificar a sua conta!';
        $mail->Body = '<p>Aqui está o link de verificação.</p><br><a href=' . $verification . '>Link de verificação</a>';

        try {
            $mail->send();
        } catch (Exception $e) {
            echo '<p>O email não pode ser enviado. Error: ' . $mail->ErrorInfo . '</p>';
        }

        session_regenerate_id();
        $_SESSION['logged'] = TRUE;
        $_SESSION['email'] = $_POST['email'];
        $_SESSION['role'] = $role;
        $_SESSION['name'] = $name;
        $_SESSION['id'] = $id;
        $_SESSION['phone'] = $phone;
        $_SESSION['nacionality'] = $phone;
        $_SESSION['birth'] = $birth;
        $_SESSION['gender'] = $gender;
        if ($verified == 1)
            $_SESSION['verified'] = TRUE;

        if (isset($_SESSION['phone_number']) && isset($_SESSION['name']) && isset($_SESSION['nacionality']) && isset($_SESSION['birthdate']) && isset($_SESSION['verified']))
            $_SESSION['complete_account'] = TRUE;

        $permissions = array();
        if ($stmt = $conn->prepare('SELECT p.tag FROM role_permission AS rp JOIN permission AS p ON rp.permission = p.id WHERE rp.role = ?')) {
            $stmt->bind_param('s', $role);
            $stmt->execute();
            $stmt->store_result();
            if ($stmt->num_rows > 0) {
                $stmt->bind_result($tag);
                while ($stmt->fetch()) {
                    $permissions[] = $tag;
                }
            }
            $stmt->close();
        }
        $_SESSION['permissions'] = $permissions;

        header("location: ../account/index.php");
    }
    $stmt->close();
}
?>
