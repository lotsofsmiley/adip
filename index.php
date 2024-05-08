<?php
session_start();
$op = 0;
if (isset($_GET['p']))
    $op = $_GET['p'];

// Include database connection
require('./assets/scripts/db/connect.php');

$sql = "SELECT * FROM social_media";
$result = mysqli_query($conn, $sql);
$sql2 = "SELECT * FROM language";
$result2 = mysqli_query($conn, $sql2);

if (!$result || !$result2) {
    echo 'Falha na consulta: ' . mysqli_error($conn);
    exit();
}

$socials = array();
$languages = array();

while ($row = mysqli_fetch_assoc($result)) {
    $socials[] = $row;
}

while ($row = mysqli_fetch_assoc($result2)) {
    $languages[] = $row;
}

$language_file_name = './resources/view/languages/lang_eng.php';
$language_image_src = './resources/_images/languages/en.jpg';


if (isset($_SESSION['selected_language'])) {
    $selected_language = $_SESSION['selected_language'];

    foreach ($languages as $language) {
        if ($language['code'] === $selected_language) {
            $language_file_name = $language['file_name'];
            $language_image_src = $language['file_image'];
            break;
        }
    }
}

?>




<!DOCTYPE html>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>aDayinDouro</title>
    <link rel="stylesheet" href="./resources/css/styles.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">
    <script src="https://kit.fontawesome.com/ce285c7720.js" crossorigin="anonymous"></script>
    <script src="path/to/jquery.min.js"></script>
    <script>
        function createXMLHttpRequest() {
            if (window.XMLHttpRequest) {
                return new XMLHttpRequest();
            } else if (window.ActiveXObject) {
                return new ActiveXObject("Microsoft.XMLHTTP");
            } else {
                console.error("XMLHttpRequest is not supported by this browser.");
                return null;
            }
        }
    </script>
</head>

<body>
    <nav class="navbar" id="navbar">
        <div class="nav-logo-container">
            <img src="./resources/_images/full_nobg_logo.png" alt="aDayinDouro" class="logo-image noSelect">
        </div>
        <div class="nav-links" id="navLinks">
            <i class="fa fa-times" onclick="closemenu()"></i>
            <ul id="menu">
                <li class="nav-items menu-sub-item"></li>
                <li class="nav-items menu-sub-item hover"><a class="noSelect" href="./?p=0">HOME</a></li>
                <li class="nav-items menu-sub-item hover"><a class="noSelect" href="./?p=1">SOBRE NÓS</a></li>
                <li class="nav-items menu-sub-item hover"><a class="noSelect" href="index.php#tours">TOURS</a></li>
                <li class="nav-items menu-sub-item hover"><a class="noSelect" href="index.php#contact">CONTACTO</a></li>
                <li class="nav-items menu-sub-item"></li>
                <li class="nav-items book-button"><a class="noSelect" href="index.php#tours">RESERVA JÁ</a></li>
                <li class="nav-items menu-sub-item"></li>

                <li class="nav-items nav-language">
                <img src="<?php echo $language_image_src; ?>" class="language-image" style="margin-right: -20px;"/>
                <ul id="dropdown-language" class="dropdown">
                    <?php foreach ($languages as $language): ?>
                        <li class="sub-item">
                            <a class="noSelect language-option" href="#" data-language="<?php echo $language['code']; ?>">
                                <img src="<?php echo $language['file_image']; ?>" alt="<?php echo $language['description']; ?>" class="language-image">
                                <?php echo $language['description']; ?>
                            </a>
                        </li>
                    <?php endforeach; ?>
                </ul>
            </li>

                <!-- <li class="nav-items menu-sub-item"><a class="noSelect" href="./?p=6">FAQ's</a></li> -->
                <!--
                <li class="menu-sub-item responsive-language">
                    <a class="noSelect" href="./client/account/index.php">
                        <span class="material-icons-outlined"> manage_accounts </span>
                        PERFIL
                    </a>
                </li>
                <li class="menu-sub-item responsive-language">
                    <a class="noSelect" href="./client/login/logout.php">
                        <span class="material-icons-outlined"> logout </span>
                        LOG OUT
                    </a>
                </li>

                <?php if (!isset($_SESSION['logged'])) { ?>
                    <li class="nav-items menu-sub-item"><a class="noSelect" href="./client/login/login.php">LOG IN</a></li>
                <?php } else { ?>
                    <li class="nav-items nav-language">
                        <img src="./resources/_images/user.png" class="language" />
                        <ul class="dropdown">
                            <li class="sub-item">
                                <a class="noSelect" href="./client/account/index.php">
                                    <span class="material-icons-outlined" style="margin-right:6px;"> manage_accounts </span>
                                    PERFIL
                                </a>
                            </li>
                            <li class="sub-item">
                                <a class="noSelect" href="./client/login/logout.php">
                                    <span class="material-icons-outlined" style="margin-right:6px;"> logout </span>
                                    LOG OUT
                                </a>
                            </li>
                        </ul>
                    </li>
                <?php } ?>
                -->
            </ul>
        </div>
        <i class="fa fa-bars" onclick="openmenu()"></i>
    </nav>

    <section>
        <?php
        switch ($op) {
            case 0:
                include("./home/index.php");
                break;

            case 1:
                include("./about/index.php");
                break;

            case 2:
                include("./tours/index.php");
                break;
            case 21:
                include("./tours/tour/index.php");
                break;
            case 22:
                include("./tours/checkout/index.php");
                break;
            case 23:
                include("./tours/checkout/payment.php");
                break;
            case 24:
                include("./tours/checkout/insert.php");
                break;

            case 3:
                include("./contact/index.php");
                break;

            case 5:
                include("./login/logout.php");
                break;

            case 6:
                include("./faqs/index.php");
                break;

            default:
                echo "<h3> Conteudo Inválido ($op) </h3>";
        }
        ?>
    </section>
    <footer class="footer" id="contact">
        <div class="footer-column footer-about">
            <!--<h3 class="company-title">aDayinPorto</h3>-->
            <div class="logo-container">
                <img src="./resources/_images/full_nobg_logo.png" alt="adip" class="logo-image noSelect">
            </div>
            <div class="footer-description">
                Prepare-se para embarcar numa viagem de descoberta e paixão com aDayinDouro. Fundada em 2011 pelo visionário Manuel Guimarães, um engenheiro informático de coração apaixonado, esta empresa familiar é muito mais do que uma empresa - é uma celebração de emoções e laços familiares.<br>
                Prove connosco o autêntico Vale do Douro para fazer parte da Experiência mais autêntica do Douro em 2019!
            </div>
        </div>

        <!--<div class="footer-column footer-legal">
                <a class="footer-policies">Privacy Policy & Terms and Conditions</a>
            </div>-->

        <div class="footer-column footer-contact">
            <h3 class="footer-title">Contacte-nos!</h3>
            <a class="footer-contact-phone" target="_blank" href="tel:+351 916 541 852">
                <i class="footer-contact-icon fa fa-phone"></i>
                (+351) 916 541 852
            </a>

            <a class="footer-contact-mail" target="_blank" href="mailto:adayinporto@gmail.com">
                <i class="footer-contact-icon fa fa-envelope"></i>
                adayinporto@gmail.com
            </a>
        </div>

        <div class="footer-column footer-contact">
            <h3 class="footer-title">Visite as nossas redes sociais!</h3>
            <?php foreach ($socials as $social) {
                echo "
                <a class='social-platform' target='_blank' href='" . $social['value'] . "'>
                    <i class='" . $social['icon_class'] . "'></i>
                </a>";
            } ?>

            <!--
            <a class="social-platform" target="_blank" href="https://www.tripadvisor.com/Attraction_Review-g189180-d4137824-Reviews-Taste_Porto_Food_Tours-Porto_Porto_District_Northern_Portugal.html">
                <i class="social-platform-icon fab fa-tripadvisor"></i>
            </a>
            <a class="social-platform" target="_blank" href="">
                <i class="social-platform-icon fab fa-twitter"></i>
            </a>
            <a class="social-platform" style="margin-right:5px;" target="_blank" href="https://www.youtube.com/channel/UCWWG4QPG8QFUJVZHKcPjcHg">
                <i class="social-platform-icon fa fa-youtube"></i>
            </a>
            <a class="social-platform" target="_blank" href="https://www.facebook.com/adayinporto/">
                <i class="social-platform-icon fa fa-facebook-square"></i>
            </a>
            <a class="social-platform" target="_blank" href="https://www.instagram.com/adayindouro/">
                <i class="social-platform-icon fa fa-instagram"></i>
            </a>
            -->
        </div>
    </footer>



    <script>
        var navLinks = document.getElementById("navLinks");

        function openmenu() {
            navLinks.style.right = "0";
        }

        function closemenu() {
            navLinks.style.right = "-200px";
        }

        var navbar = document.getElementById("navbar");

        window.onscroll = () => {
            if (window.scrollY != 0) {
                navbar.classList.add("scrolled");
            } else {
                navbar.classList.remove("scrolled");
            }
        };


        var dropdown = document.getElementById("dropdown-language");

        window.onclick = function (e) {
            if (!e.target.matches('.language-image')) {
                if (dropdown.style.display = "flex") {
                    dropdown.style.display = "none";
                }
            } else {
                if (dropdown.style.display = "none") {
                    dropdown.style.display = "flex";
                } else {
                    dropdown.style.display = "none";
                }
            }
        }

        document.addEventListener("DOMContentLoaded", function() {
        var languageOptions = document.querySelectorAll('.language-option');
        languageOptions.forEach(function(option) {
            option.addEventListener('click', function(event) {
                event.preventDefault();
                var languageCode = option.getAttribute('data-language');
                selectLanguage(languageCode);
                dropdown.style.display = "none";
            });
        });

        function selectLanguage(languageCode) {
            var xhr = createXMLHttpRequest();
            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    window.location.reload();
                }
            };
            xhr.open("GET", "./assets/update_language/update_language_session.php?language=" + encodeURIComponent(languageCode), true);
            xhr.send();
        }
    });

    </script>
</body>

</html>