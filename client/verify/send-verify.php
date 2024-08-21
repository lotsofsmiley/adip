<?php 
session_start();

require('../../assets/scripts/db/connect.php');

require '../../PHPMailer/src/Exception.php';
require '../../PHPMailer/src/PHPMailer.php';
require '../../PHPMailer/src/SMTP.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

$email = $_SESSION['email'];


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

$verification = 'localhost/adip/client/verify/verify.php';

$mail->Subject = 'Verificar a sua conta!';
$mail->Body = '<p>Aqui está o link de verificação.</p><br><a href=' . $verification . '>Link de verificação</a>';

try {
    $mail->send();
    header("location: ../account/index.php");
    
} catch (Exception $e) {
    echo '<p>O email não pode ser enviado. Error: ' . $mail->ErrorInfo . '</p>';
}

?>