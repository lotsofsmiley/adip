<?php
session_start();

require('../../../assets/scripts/db/connect.php');
require '../../../PHPMailer/src/Exception.php';
require '../../../PHPMailer/src/PHPMailer.php';
require '../../../PHPMailer/src/SMTP.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

$tour = $_GET['tour'];
$start = $_GET['start'];
$people = $_GET['number_people'];
$appointment = $_GET['appointment'];
var_dump($appointment);


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
$verification_code = substr(number_format(time() * rand(), 0, '', ''), 0, 6);
var_dump($verification_code);

$mail->Subject = 'Cancelamento da sua marcação!';
$mail->Body = '<p>Aqui está o código de 6 dígitos.</p><br><p><h3>' . $verification_code . ' </h3></p>';

try {
    $mail->send();
} catch (Exception $e) {
    echo '<p>O email não pode ser enviado. Error: ' . $mail->ErrorInfo . '</p>';
}


?>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Profile</title>
    <link href="./styles.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer">
</head>

<style>
    .email-form {
        width: 30rem;
        margin: auto;
        margin-block: 2rem;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    input[type="text"] {
        padding: 0.75rem 1rem;
        width: 60%;
        border-radius: 0.315rem;
        font-size: 16px;
        border: 1px solid var(--light-text-reverse-color);
    }

    input[type="text"]:focus {
        outline: none;
    }

    input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button {
        -webkit-appearance: none;
        margin: 0;
    }

    input[type="submit"] {
        width: 40%;
        text-align: center;
        padding: 1rem 2rem;
        background: var(--alt-contrast-color);
        box-shadow: 0 0 0 1px var(--light-text-reverse-color);
        border-radius: 15px;
        margin-block: 1rem;
        color: white;
        cursor: pointer;
        border: none;
        font-size: 15px;
        font-weight: 400;
    }

    input[type="submit"] .disabled {
        opacity: 0.5;
        pointer-events: none;
    }

    .error-message {
        color: red;
        font-size: 12px;
        margin-top: 4px;
        padding-block: 0.5rem;
    }
</style>

<body class="profile">
    <div class="content">
        <h2>
            <label for="return">
                <a href="./send-email.php"><i class="fas fa-chevron-left"></i></a>
            </label>
            Código de confirmação
        </h2>

        <div>
            <p>Foi enviado um código de 6 dígitos para o seu email. Introduza esse mesmo código.</p>
            <form method="POST" action="./cancel.php" onsubmit="return validateForm(event)">
                <div class="email-form">
                    <span id="error" class="error-message"></span>
                    <input type="text" placeholder="código" name="code" id="code-input" oninput="validateCodeInput(this.value)" maxlength="6">
                    <input type="hidden" name="tour" value="<?= $tour ?>">
                    <input type="hidden" name="people" value="<?= $people ?>">
                    <input type="hidden" name="start" value="<?= $start ?>">
                    <input type="hidden" name="appointment" value="<?= $appointment ?>">
                    <input type="submit" value="Enviar código" class="disabled" id="submit-button">
                </div>
            </form>
        </div>
    </div>

    <script>
        function validateCodeInput(code) {
            var inputElement = document.getElementById('code-input');
            var errorElement = document.getElementById('error');
            var submitButton = document.getElementById('submit-button');
            var actualCode = '<?php echo $verication_code; ?>';

            if (code.length === 6) {
                if (code === actualCode) {
                    inputElement.style.border = '1px solid #40bf64';
                    errorElement.textContent = '';
                    submitButton.classList.remove('disabled');
                    submitButton.disabled = false;
                } else {
                    inputElement.style.border = '1px solid #e51b15';
                    errorElement.textContent = 'Código incorreto.';
                    submitButton.classList.add('disabled');
                    submitButton.disabled = true;
                }
            } else {
                inputElement.style.border = '';
                errorElement.textContent = '';
                submitButton.classList.add('disabled');
                submitButton.disabled = true;
            }
        }

        function validateForm(event) {
            var submitButton = document.getElementById('submit-button');

            if (submitButton.disabled) {
                event.preventDefault(); // Prevent form submission if the code is incorrect
            }
        }
    </script>
</body>

</html>