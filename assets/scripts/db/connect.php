<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "db";

$conn = @mysqli_connect($servername, $username, $password, $dbname) or 
die("Impossível estabelecer uma conex&atilde;o.");

mysqli_set_charset($conn,"utf8");
?>