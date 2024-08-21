<?php
require '.\PHPMailer\src\Exception.php';
require '.\PHPMailer\src\PHPMailer.php';
require '.\PHPMailer\src\SMTP.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

$mail = new PHPMailer(true);
$mail->isSMTP();
$mail->Host = 'smtp.gmail.com';
$mail->SMTPAuth = true;
$mail->Username = 'manolipas69@gmail.com';
$mail->Password = 'annnsvlatxmqcqbb';
$mail->SMTPSecure = 'tls';
$mail->Port = 587;
$mail->setFrom('adayinporto@gmail.com', 'aDayinPorto');
$mail->addAddress($_SESSION['email'], $_SESSION['name']);
$mail->isHTML(true);
$mail->CharSet = 'UTF-8';



require('./assets/scripts/db/connect.php');

if (isset($_POST['name'])) {
    $id_tour = $_POST['id'];
    $start = $_POST['day'];
    $id_user = $_SESSION['id'];
    $number_people = $_POST['adults'] + $_POST['children'];


    $start = mysqli_real_escape_string($conn, $start);

    $currentid = "SELECT max(id) AS maxid FROM appointment";
    $currentidd = mysqli_query($conn, $currentid);
    $currentiddd = mysqli_fetch_assoc($currentidd);

    $nextid = $currentiddd['maxid'] + 1;

    $gettour = "SELECT * FROM tour WHERE id = '$id_tour'";
    $resulttour = mysqli_query($conn, $gettour);
    $rowtour = mysqli_fetch_assoc($resulttour);

    $checkdb = "SELECT SUM(number_people) AS total_people FROM appointment WHERE id_tour = '$id_tour' AND start = '$start'";
    $result = mysqli_query($conn, $checkdb);

    if (!$result) {
        echo 'Error in query: ' . mysqli_error($conn);
        exit();
    }

    $rowcheck = mysqli_fetch_assoc($result);
    $sum_people = $rowcheck['total_people'];

    $total_people_with_current = $sum_people + $number_people;



    $verifyappointment = "SELECT * FROM appointment WHERE id_tour = '$id_tour' AND id_user = '$id_user' AND start = '$start'";
    $result = mysqli_query($conn, $verifyappointment);
}
?>
<section class="tour-header">
    <div class="tour-text-box">
        <h1> <?= $rowtour['name'] ?></h1>
    </div>
</section>
<section>
    <div class="insert-info">
        <?php
        if ($result && mysqli_num_rows($result) == 0) {
            if ($rowcheck['total_people'] > $rowtour['tour_limit']) {
                echo "<p> Erro ao inserir registo.</p> <br> <p>Não existem bilhetes suficientes.</p>";
            } else {

                $sql = "INSERT INTO appointment(id, id_user, id_tour, start, number_people) VALUES('$nextid', '$id_user', '$id_tour', '$start', '$number_people')";
                $regist = mysqli_query($conn, $sql);
                if (!$regist) {
                    echo "<p> Erro realizar marcação. <br>" . mysqli_error($conn);
                } else {
                    echo "<p> A sua marcação foi feita</p>";
                    $mail->Subject = 'A sua marcação!';
                    $mail->Body    = '<p>A sua marcação para o dia ' . date('d/m/Y', strtotime($start)) . ' foi realizada com sucesso.</p><hr><h2>' . $rowtour['name'] . '</h2><br><p>Apreciamos a sua escolha e esperamos que a experiência seja do seu melhor agrado.</p><br><p>Cumprimentos,</p><br><p>Equipa aDayinPorto</p>';
                    $mail->send();
                }
            }
        } else
            echo "<p> Essa exata marcação já existe. </p>"; ?>

        <a href="./?p=0">
            <div class="insert-return-button">
                Retornar ao menu principal
            </div>
        </a>
    </div>


</section>