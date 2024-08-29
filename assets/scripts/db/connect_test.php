<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "u188898724_main";

$conn = @mysqli_connect($servernane, $username, $password, $dbname) or 
die("Impossível estabelecer uma conex&atilde;o.");

mysqli_set_charset($conn,"utf8");
?>