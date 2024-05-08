<?php
session_start();

if (isset($_GET['language'])) {
    $_SESSION['selected_language'] = $_GET['language'];
}
?>