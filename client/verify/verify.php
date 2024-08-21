<?php
session_start();

require('../../assets/scripts/db/connect.php');
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

<body class="profile">
    <div class="content">


        <h2>
            Verificar
        </h2>

        <div>
                <p>Insira o seu email para completar a verificação</p>
                <form method="POST" action="">
                    <div class="email-form">
                        <input type="email" placeholder="email" name="email" required>
                        <input type="submit" value="Enviar email">
                    </div>
                </form>
        </div>
        <?php
        if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['email'])) {
            $email = $_POST['email'];

            $email = mysqli_real_escape_string($conn, $email);

            $checkemail = "SELECT * FROM user WHERE email = '$email'";
            $resultemail = mysqli_query($conn, $checkemail);
            if ($resultemail && mysqli_num_rows($resultemail) !== 0) {
                
                $sql = "UPDATE user SET verified = 1 WHERE email = '$email'";

                $result = mysqli_query($conn, $sql);
                if (!$result) {
                    die("Error verifying user: " . mysqli_error($conn));
                } else {
                    echo "<div>";
                    echo "A sua conta foi verificada. Redirecionando...";
                    echo "</div>";
                    echo "<script>setTimeout(function() { window.location.href = '../account/index.php'; }, 2000);</script>";
                    exit();
                }
            }
        }
        ?>
    </div>
</body>

</html>