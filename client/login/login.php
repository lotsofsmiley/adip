<!DOCTYPE html>
<?php
session_start();

require('../../assets/scripts/db/connect.php');
$sql = "SELECT * FROM language";
$result = mysqli_query($conn, $sql);
if (!$result) {
    echo 'Falha na consulta: ' . mysqli_error($conn);
    exit();
}
$languages = array();
while ($row = mysqli_fetch_assoc($result)) {
    $languages[] = $row;
}
$language_file_name = '../../resources/view/languages/lang_eng.php';
$language_image_src = '../../resources/_images/languages/en.jpg';
if (isset($_SESSION['selected_language'])) {
    $selected_language = $_SESSION['selected_language'];

    foreach ($languages as $l) {
        if ($l['id'] === $selected_language) {
            $language_file_name = '../.' . $l['file_name'];
            $language_image_src = '../.' . $l['file_image'];
            include($language_file_name);
            break;
        }
    }
} elseif (!isset($_SESSION['selected_language'])) {
    $_SESSION['selected_language'] = '2';
}
?>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./styles.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css">
</head>

<body>
    <div class="login">
        <h1><?php echo $language['LOGIN_TITLE'];?></h1>
        <form action="authenticate.php" method="post">
            <div class="input">
                <label for="email">
                    <i class="fas fa-user"></i>
                </label>
                <input type="email" name="email" placeholder="<?php echo $language['LOGIN_EMAIL']?>" id="email" required>
            </div>
            <div class="input">
                <label for="password">
                    <i class="fas fa-lock"></i>
                </label>
                <input type="password" name="password" placeholder="<?php echo $language['LOGIN_PASSWORD']?>" id="password" required>

                <a href="../account/send-email.php">
                <?php echo $language['LOGIN_RECOVER_PASSWORD']?>
                </a>
            </div>

            <div class="register-link">
                <a href="../register/index.php"><?php echo $language['LOGIN_REGISTER']?></a>
            </div>
            <div class="buttons">
                <a class="return-button" href="../../index.php"><input class="return-button" type="button" value="<?php echo $language['LOGIN_BACK_BUTTON']?>"></a>
                <input type="submit" value="<?php echo $language['LOGIN_BUTTON']?>">
            </div>
        </form>
    </div>
</body>

</html>