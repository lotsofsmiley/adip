<?php
session_start();

require('../../assets/scripts/db/connect.php');

$email = $_POST['email'];

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['pass1'])) {
    $pass1 = $_POST['pass1'];
    $pass2 = $_POST['pass2'];

    $email = mysqli_real_escape_string($conn, $email);
    $pass1 = mysqli_real_escape_string($conn, $pass1);
    $pass2 = mysqli_real_escape_string($conn, $pass2);

    if ($pass1 === $pass2) {
        $encryptedPass = sha1($pass1);

        $sql = "UPDATE user SET password = '$encryptedPass' WHERE email = '$email'";

        $result = mysqli_query($conn, $sql);
        if (!$result) {
            die("Error updating password: " . mysqli_error($conn));
        } else {
            echo "A palavra-passe foi atualizada. Redirecionando...";
            echo "<script>setTimeout(function() { window.location.href = './index.php'; }, 2000);</script>";
            exit();
        }
    }
}





?>

<style>
    .email-form {
        width: 30rem;
        margin: auto;
        margin-block: 2rem;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    input[type="password"] {
        padding: 0.75rem 1rem;
        width: 60%;
        border-radius: 0.315rem;
        font-size: 16px;
        border: 1px solid var(--light-text-reverse-color);
    }

    input[type="password"]:focus {
        outline: none;
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
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Profile</title>
    <link href="./styles.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer">
</head>

<body class="profile">
    <div class="content">
        <h2>
            <label for="return">
                <a href="./receive-code.php"><i class="fas fa-chevron-left"></i></a>
            </label>
            Alterar palavra-passe
        </h2>

        <div>
            <p>Pode alterar a sua palavra-passe.</p>
            <form method="POST" action="" onsubmit="return validateForm(event)">
                <div class="email-form">
                    <span id="error" class="error-message"></span>
                    <input type="hidden" name="email" value="<?php echo $email; ?>">
                    <input type="password" placeholder="palavra-passe" style="margin-bottom: 1rem;" name="pass1" id="pass1-input" oninput="validatePasswordMatch()">
                    <input type="password" placeholder="repita a palavra-passe" name="pass2" id="pass2-input" oninput="validatePasswordMatch()">
                    <input type="submit" value="Alterar palavra-passe" class="disabled" id="submit-button">
                </div>
            </form>
        </div>
    </div>

    <script>
        function validatePasswordMatch() {
            var pass1Input = document.getElementById('pass1-input');
            var pass2Input = document.getElementById('pass2-input');
            var errorElement = document.getElementById('error');
            var submitButton = document.getElementById('submit-button');

            if (pass1Input.value === pass2Input.value && pass1Input.value !== '') {
                pass1Input.style.border = '1px solid #40bf64';
                pass2Input.style.border = '1px solid #40bf64';
                errorElement.textContent = '';
                submitButton.classList.remove('disabled');
                submitButton.disabled = false;
            } else {
                pass1Input.style.border = '1px solid #e51b15';
                pass2Input.style.border = '1px solid #e51b15';
                errorElement.textContent = 'As palavras-passe não coincidem.';
                submitButton.classList.add('disabled');
                submitButton.disabled = true;
            }
        }

        function validateForm(event) {
            var pass1Input = document.getElementById('pass1-input');
            var pass2Input = document.getElementById('pass2-input');
            var submitButton = document.getElementById('submit-button');

            if (pass1Input.value === '' || pass2Input.value === '') {
                event.preventDefault();
            }

            if (submitButton.disabled) {
                event.preventDefault();
            }
        }
    </script>
</body>

</html>