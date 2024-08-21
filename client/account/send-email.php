<?php
session_start();

require('../../assets/scripts/db/connect.php');

$verification_code = substr(number_format(time() * rand(), 0, '', ''), 0, 6);
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

    input[type="email"] {
        padding: 0.75rem 1rem;
        width: 60%;
        border-radius: 0.315rem border 1px solid var(--light-text-reverse-color);
        font-size: 16px;
        border: 1px solid var(--light-text-reverse-color);
    }

    input[type="email"]:focus {
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
</style>

<body class="profile">
    <div class="content">
        <h2>
            <label for="return">
                <?php
                $link = "";
                if(isset($_SESSION['logged']))
                    $link = "./index.php";
                else
                    $link = "../login/login.php";
                ?>
                <a href="<?=$link?>"><i class="fas fa-chevron-left"></i></a>

            </label>
            Enviar e-mail
        </h2>

        <div>
            <p>Introduza o endereço de email associado à sua conta, e iremos enviar-lhe uma ligação para redefinir a sua palavra-passe. </p>
            <form method="POST" action="./receive-code.php">
                <div class="email-form">
                    <input type="hidden" name="code" value="<?php echo $verification_code; ?>">
                    <input type="email" placeholder="email" name="mail" required>
                    <input type="submit" value="Enviar email">
                </div>
            </form>
        </div>
    </div>
</body>

</html>