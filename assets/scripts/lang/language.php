<?php
require('../db/connect.php');
$sql2 = "SELECT * FROM language";
$result2 = mysqli_query($conn, $sql2);
$languages = array();
while ($row = mysqli_fetch_assoc($result2)) {
    $languages[] = $row;
}

$language_file_name = '../../../../resources/view/languages/lang_eng.php';
$language_image_src = '../../../../resources/_images/languages/en.jpg';

if (isset($_SESSION['selected_language'])) {
    $selected_language = $_SESSION['selected_language'];

    foreach ($languages as $l) {
        echo $l['id'];
        if ($l['id'] === $selected_language) {
            $language_file_name = '../../../../' . $l['file_name'];
            $language_image_src = '../../../../' . $l['file_image'];
            include($language_file_name);
            break;
        }
    }
} elseif (!isset($_SESSION['selected_language'])) {
    $_SESSION['selected_language'] = '2';
}
echo $language_file_name;

echo $language['LOGIN_TITLE'];
?>