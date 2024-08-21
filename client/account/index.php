<?php
session_start();

require('../../assets/scripts/db/connect.php');



$stmt = $conn->prepare('SELECT u.email, u.name, u.phone_number, u.nacionality, u.birthdate, u.creation_date, u.verified, g.description, g.id, r.name
                    FROM user u
                    JOIN role r ON u.role = r.id
                    JOIN gender g ON u.gender = g.id
                    WHERE u.id = ?');

$stmt->bind_param('i', $_SESSION['id']);
$stmt->execute();
$stmt->bind_result($email, $name, $phone, $nacionality, $birth, $creation, $verified, $gender, $genderid, $role);
$stmt->fetch();
session_regenerate_id();
$_SESSION['logged'] = TRUE;
$_SESSION['email'] = $email;
$_SESSION['name'] = $name;
$_SESSION['phone'] = $phone;
$_SESSION['nacionality'] = $nacionality;
$_SESSION['birth'] = $birth;
$_SESSION['gender'] = $genderid;

if ($verified == 1)
    $_SESSION['verified'] = TRUE;
else
    $_SESSION['verified'] = FALSE;

if (isset($_SESSION['phone']) && isset($_SESSION['name']) && isset($_SESSION['nacionality']) && isset($_SESSION['birth']) && $_SESSION['verified'] == TRUE)
    $_SESSION['complete_account'] = TRUE;
else
    $_SESSION['complete_account'] = FALSE;

echo '<script>';
echo 'console.log(' . json_encode($_SESSION) . ');';
echo '</script>';

$stmt->close();
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
<body class="profile">
    <div class="content">




        <div style="display: flex;
        justify-content: space-between;">
            <h2>
                <label for="return">
                    <a href="../../index.php"><i class="fas fa-chevron-left"></i></a>
                </label>
                Perfil
            </h2>
            <h2>
                Marcações
                <label for="return">
                    <a href="./appointments/index.php"><i class="fas fa-chevron-right"></i></a>
                </label>
            </h2>
        </div>

        <div>
            <div class="details-row">
                <p>Detalhes da conta: </p>
                <a href="./edit-profile.php"><i class="fa-regular fa-pen-to-square fa-2xl"></i></a>
            </div>

            <table>
                <tr>
                    <td>Nome:</td>
                    <td><?= $name ?></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><?= $email ?></td>
                </tr>
                <tr>
                    <td>Nº Telemóvel:</td>
                    <td><?= $phone ?></td>
                </tr>
                <tr>
                    <td>Nacionalidade:</td>
                    <td><?= $nacionality ?></td>
                </tr>
                <tr>
                    <td>Data de nascimento:</td>
                    <td><?php
                        if (isset($birth))
                            echo date('d-m-Y', strtotime($birth));
                        else
                            echo $birth;
                        ?></td>
                </tr>
                <tr>
                    <td>Género:</td>
                    <td><?= $gender ?></td>
                </tr>
                <?php if ($_SESSION['role'] !== 1) { ?>
                    <tr>
                        <td>Cargo:</td>
                        <td><?= $role ?></td>
                    </tr>
                <?php } ?>
            </table>
            <br>
            <p class="change-pass">
                <a href="./send-email.php">Alterar palavra-passe</a>
            </p>
        </div>
        <?php
        if ($_SESSION['verified'] !== TRUE) {
            echo "<div>";
            echo "A sua conta não está verificada. Foi enviado para o seu email um link de verificação. <a href='../verify/send-verify.php'>Reenviar link</a>";
            echo "</div>";
        }
        if ($_SESSION['complete_account'] !== TRUE) {
            echo "<div>";
            echo "A sua registo não está completo. Complete-o editando o seu perfil e preenchendo todos os campos.";
            echo "</div>";
        }
        ?>
    </div>
</body>

</html>