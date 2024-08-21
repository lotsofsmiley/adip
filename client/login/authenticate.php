<?php 
session_start();

require('../../assets/scripts/db/connect.php');

if ($stmt = $conn->prepare('SELECT id, name, phone_number, nacionality, birthdate, verified, gender, role, password FROM user AS u WHERE email = ?')) {
    $stmt->bind_param('s', $_POST['email']);
    $stmt->execute();
    $stmt->store_result();
    if ($stmt->num_rows > 0) {
        $stmt->bind_result($id, $name, $phone, $nacionality, $birth, $verified, $gender, $role, $password);
        $stmt->fetch();

        if (sha1($_POST['password']) == $password) {
            session_regenerate_id();
            $_SESSION['logged'] = TRUE;
            $_SESSION['email'] = $_POST['email'];
            $_SESSION['role'] = $role;
            $_SESSION['name'] = $name;
            $_SESSION['id'] = $id;
            $_SESSION['phone'] = $phone;
            $_SESSION['nacionality'] = $phone;
            $_SESSION['birth'] = $birth;
            $_SESSION['gender'] = $gender;

            
            if ($verified == 1)
                $_SESSION['verified'] = TRUE;
            else
                $_SESSION['verified'] = FALSE;

            if (isset($_SESSION['phone']) && isset($_SESSION['name']) && isset($_SESSION['nacionality']) && isset($_SESSION['birth']) && $_SESSION['verified'] == TRUE)
                $_SESSION['complete_account'] = TRUE;
            else
            $_SESSION['complete_account'] = FALSE;

                $permissions = array();
                if ($stmt = $conn->prepare('SELECT p.tag FROM role_permission AS rp JOIN permission AS p ON rp.permission = p.id WHERE rp.role = ?')) {
                    $stmt->bind_param('s', $role);
                    $stmt->execute();
                    $stmt->store_result();
                    if ($stmt->num_rows > 0) {
                        $stmt->bind_result($tag);
                        while ($stmt->fetch()) {
                            $permissions[] = $tag;
                        }
                    }
                    $stmt->close();
                }
                $_SESSION['permissions'] = $permissions;

                header("location: ../../index.php");
                echo 'Welcome ' . $_SESSION['name'] . '!';
            } else {

                echo 'Incorrect username and/or password!1';
                //echo "<script>setTimeout(function() { window.location.href = './login.php'; }, 2000);</script>";
            }
        } else {
            echo 'Incorrect username and/or password!';
            //echo "<script>setTimeout(function() { window.location.href = './login.php'; }, 2000);</script>";
        }
        $stmt->close();
}
?>
<style>
    body{
        background-color: black;
        color: white;
    }
</style>
<body>    
</body>