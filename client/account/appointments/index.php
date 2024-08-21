<?php
session_start();

require('../../../assets/scripts/db/connect.php');



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




        <div>
            <h2>
                <label for="return">
                    <a href="../index.php"><i class="fas fa-chevron-left"></i></a>
                </label>
                Perfil
            </h2>
        </div>

            <?php
            $userAppointmentsQuery = "SELECT a.id as id_appointment, t.id as tour_id, t.name as tour_name, a.start, a.number_people FROM appointment a JOIN tour t ON a.id_tour = t.id WHERE a.cancel_date is null and a.id_user = " . $_SESSION['id'] . " AND a.start >= CURDATE() + INTERVAL 1 DAY order by start";
            $userAppointmentsResult = mysqli_query($conn, $userAppointmentsQuery);

            if ($userAppointmentsResult && mysqli_num_rows($userAppointmentsResult) > 0) {
                while ($appointmentRow = mysqli_fetch_assoc($userAppointmentsResult)) {
                echo "<div style='display:flex; justify-content: space-between; align-items: center;'>";
                    echo "<div>";
                    echo "<p>Nome do tour: " . $appointmentRow['tour_name'] . "</h3>";
                    echo "<p>Data do tour: " . $appointmentRow['start'] . "</p>";
                    echo "<p>Nº de pessoas: " . $appointmentRow['number_people'] . "</p>";
                    echo "</div>";
                    //echo "<div>";
                    //echo "<a href='./cancel-code.php?appointment=". $appointmentRow['id_appointment'] ."&tour=" . $appointmentRow['tour_id'] . "&start=" . $appointmentRow['start'] . "&number_people=" . $appointmentRow['number_people'] . "'><i class='fas fa-trash'></i></a>";
                    //echo "</div>";
                echo "</div>";
                }
            } else {
                echo "<p>No upcoming appointments found.</p>";
            }
            ?>
</body>

</html>