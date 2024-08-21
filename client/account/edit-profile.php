<?php
session_start();

require('../../assets/scripts/db/connect.php');


$stmt = $conn->prepare('SELECT u.email, u.name, u.phone_number, u.nacionality, u.birthdate, u.creation_date, u.verified, g.description, r.name
                        FROM user u
                        JOIN role r ON u.role = r.id
                        JOIN gender g ON u.gender = g.id
                        WHERE u.id = ?');
$stmt->bind_param('i', $_SESSION['id']);
$stmt->execute();
$stmt->bind_result($email, $name, $phone, $nacionality, $birth, $creation, $verified, $gender, $role);
$stmt->fetch();
$stmt->close();


?>

<style>
    input,
    select {
        border: none;
        outline: none;
        font-size: 16px;
    }

    input:focus,
    select:focus {
        outline: none;
    }

    .bordered-input {
        border-bottom: 1px solid var(--light-text-reverse-color);
    }

    input[type="submit"] {
        border-radius: 15px;
        background: var(--alt-contrast-color);
        width: 15%;
        text-align: center;
        padding: 0.5rem 1rem;
        box-shadow: 0 0 0 1px var(--light-text-reverse-color);
        border-radius: 15px;
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
            <label for="return">
                <a href="./index.php"><i class="fas fa-chevron-left"></i></a>
            </label>
            Editar perfil
        </h2>

        <div>
            <form action="" method="POST" onsubmit="return confirmSubmit();">
                <div class="details-row">
                    <p>Detalhes da conta: </p>
                    <input type="submit" value="Confirmar edição">
                </div>

                <table>
                    <tr>
                        <td>Nome:</td>
                        <td><input class="bordered-input" type="text" value="<?= $name ?>" name="name" required></td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td><input class="bordered-input" type="email" value="<?= $email ?>" name="email" required></td>
                    </tr>
                    <tr>
                        <td>Nº Telemóvel:</td>
                        <td><input class="bordered-input" type="phone" value="<?= $phone ?>" name="phone" required></td>
                    </tr>
                    <tr>
                        <td>Nacionalidade:</td>
                        <td><input class="bordered-input" type="text" value="<?= $nacionality ?>" name="nacionality" required></td>
                    </tr>
                    <tr>
                        <td>Data de nascimento:</td>
                        <td><input type="date" max="<?= date("Y-m-d") ?>" value="<?= $birth ?>" name="birth" required></td>
                    </tr>
                    <tr>
                        <td>Género:</td>
                        <td>
                            <select name="gender"' name="gender"' required>
                                <?php
                                $showdesc = "SELECT * FROM gender ORDER BY id;";
                                if ($show = mysqli_query($conn, $showdesc)) {
                                    while ($row = mysqli_fetch_assoc($show)) {
                                        echo "<option value='" . $row['id'] . "'";
                                        if ($row['description'] === $gender) {
                                            echo " selected";
                                        }
                                        echo ">" . $row['description'] . "</option>";
                                    }
                                }
                                ?>
                            </select>
                        </td>
                    </tr>
                </table>
            </form>
        </div>


        <?php
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $_name = $_POST['name'];
            $_email = $_POST['email'];
            $_phone = $_POST['phone'];
            $_nacionality = $_POST['nacionality'];
            $_birth = $_POST['birth'];
            $_gender = $_POST['gender'];

            $_email = mysqli_real_escape_string($conn, $_email);
            $_name = mysqli_real_escape_string($conn, $_name);
            $_phone = mysqli_real_escape_string($conn, $_phone);
            $_nacionality = mysqli_real_escape_string($conn, $_nacionality);
            $_birth = mysqli_real_escape_string($conn, $_birth);

            $updateFields = "";

            if ($email !== $_email) {
                $checkemail = "SELECT * FROM user WHERE email='$_email'";
                $resultemail = mysqli_query($conn, $checkemail);

                if ($resultemail && mysqli_num_rows($resultemail) == 0) {
                    $updateFields .= "email = '$_email', ";
                } else {
                    echo "Já existe um registo com esse email.";
                    exit();
                }
            }

            if ($phone !== $_phone) {
                $checkphone = "SELECT * FROM user WHERE phone_number='$_phone'";
                $resultphone = mysqli_query($conn, $checkphone);

                if ($resultphone && mysqli_num_rows($resultphone) == 0) {
                    $updateFields .= "phone_number = '$_phone', ";
                } else {
                    echo "Já existe um registo com esse Nº Telemóvel.";
                    exit();
                }
            }

            $updateFields .= "name = '$_name',
                      nacionality = '$_nacionality',
                      birthdate = '$_birth',
                      gender = '$_gender'";

            $sql = "UPDATE user SET $updateFields WHERE email = '$email'";

            $result = mysqli_query($conn, $sql);
            if (!$result) {
                die("Error updating profile: " . mysqli_error($conn));
            } else {
                echo "<div>";
                echo "A sua conta foi atualizada.";
                echo "</div>";
                echo "<script>setTimeout(function() { window.location.href = './index.php'; }, 1000);</script>";
                exit();
            }
        }
        ?>

    </div>

    <script>
        window.addEventListener('DOMContentLoaded', (event) => {
            const inputFields = document.querySelectorAll('input[type="text"], input[type="email"], input[type="phone"], input[type="date"]');
            inputFields.forEach((input) => {
                input.addEventListener('input', () => {
                    if (!input.value) {
                        input.classList.add('bordered-input');
                    } else {
                        input.classList.remove('bordered-input');
                    }
                });
            });
        });

        function confirmSubmit() {
            if (confirm("Tem a certeza?")) {
                return true;
            } else {
                return false;
            }
        }
    </script>
</body>

</html>