<?php
$servername = "127.0.0.1:3306";
$username = "u188898724_smiley";
$password = "c2fVy|@*X^4";
$dbname = "u188898724_main";

$conn = @mysqli_connect($servernane, $username, $password, $dbname) or 
die("Impossível estabelecer uma conex&atilde;o.");

mysqli_set_charset($conn,"utf8");
?>