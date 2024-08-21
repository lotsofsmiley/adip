<?php
session_start();

require('../../../assets/scripts/db/connect.php');
require '../../../PHPMailer/src/Exception.php';
require '../../../PHPMailer/src/PHPMailer.php';
require '../../../PHPMailer/src/SMTP.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

$tour = $_POST['tour'];
$start = $_POST['start'];
$people = $_POST['people'];
$appointment = $_POST['appointment'];
$reason = $_POST['reason'];


$gettour = "SELECT * FROM tour WHERE id = '$tour'";
$resulttour = mysqli_query($conn, $gettour);
$rowtour = mysqli_fetch_assoc($resulttour);

$mail = new PHPMailer(true);
$mail->isSMTP();
$mail->Host = 'smtp.gmail.com';
$mail->SMTPAuth = true;
$mail->Username = 'manolipas69@gmail.com';
$mail->Password = 'annnsvlatxmqcqbb';
$mail->SMTPSecure = 'tls';
$mail->Port = 587;
$mail->setFrom('adayinporto@gmail.com', 'aDayinPorto');
$mail->addAddress($_SESSION['email']);
$mail->isHTML(true);
$mail->CharSet = 'UTF-8';

$mail->Subject = 'A sua marcação!';
$mail->Body    = '<p>A sua marcação para o dia ' . date('d/m/Y', strtotime($start)) . ' foi cancelada com sucesso.</p><hr><h2>' . $rowtour['name'] . '</h2><br><p>Esperamos não ter desiludido de alguma forma.</p><br><p>Cumprimentos,</p><br><p>Equipa aDayinPorto</p>';

if ($_SERVER["REQUEST_METHOD"] === "POST" && isset($reason)) {
    
    if (empty($reason)) {
        echo "Erro, pedido inválido";
        exit();
    }

    $id = $_POST['appointment'];
    $sql = "SELECT * FROM appointment WHERE id = '$id'";
    $resultado = mysqli_query($conn, $sql);
    
    if (!$resultado) {
        echo 'Falha na consulta: ' . mysqli_error($conn);
    } else {
        $cancelDateTime = date('Y-m-d H:i:s');
        $sql = "UPDATE appointment SET cancel_date = '$cancelDateTime' and reason = '$reason' WHERE id = '$id'";
        if (!mysqli_query($conn, $sql)) {
            echo "ERRO - Falha ao executar o comando: \"$sql\" <br>" . mysqli_error($conn);
        } else {
            echo "A marcação foi cancelada. Redirecionando...";
            try {
                $mail->send();
            } catch (Exception $e) {
                echo '<p>O email não pode ser enviado. Error: ' . $mail->ErrorInfo . '</p>';
            }
            echo "<script>setTimeout(function() { window.location.href = './index.php'; }, 2000);</script>";
            exit();
        }
    }
}
?>


<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Profile</title>
    <link href="./styles.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer">
</head>
<style>
    input[type="submit"] {
        width: 35%;
        text-align: center;
        padding: 0.75rem 1.25rem;
        margin-bottom: 1rem;
        background: var(--alt-contrast-color);
        box-shadow: 0 0 0 1px var(--light-text-reverse-color);
        border-radius: 15px;
        color: white;
        cursor: pointer;
        border: none;
        font-size: 15px;
        font-weight: 400;
    }

    textarea:focus {
        outline: none;
    }

    textarea:hover {
        outline: none;
    }
</style>

<body class="profile">
    <div class="content">




        <div>
            <h2>
                <label for="return">
                    <a href="../index.php"><i class="fas fa-chevron-left"></i></a>
                </label>
                Cancelamento da marcação
            </h2>
        </div>

        <div>
            <p>Detalhes do tour: </p>

            <table>
                <tr>
                    <td>Tour:</td>
                    <td><?= $rowtour['name'] ?></td>
                </tr>
                <tr>
                    <td>Data do tour:</td>
                    <td><?= $start ?></td>
                </tr>
                <tr>
                    <td>Nº de pessoas:</td>
                    <td><?= $people ?></td>
                </tr>
            </table>
            <br>
            <hr>
            <br>
            <form action="./cancel.php" method="POST">
                <p>Motivo</p>
                <div>
                    <p><textarea style="padding:1.5rem;" name="reason" cols="50" rows="10" minlength="1" maxlength="500" required></textarea></p>
                    <input type="hidden" name="tour" value="<?= $tour ?>">
                    <input type="hidden" name="people" value="<?= $people ?>">
                    <input type="hidden" name="start" value="<?= $start ?>">
                    <input type="hidden" name="appointment" value="<?= $appointment ?>">
                    <input type="submit" value="Cancelar marcação">
                </div>
            </form>


        </div>
    </div>
</body>

</html>