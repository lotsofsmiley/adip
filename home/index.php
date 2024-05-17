<?php
if (isset($selected_language)) {
    $selected_language = mysqli_real_escape_string($conn, $_SESSION['selected_language']);
    $sql = "SELECT * FROM tour WHERE language = '$selected_language'";
    $result = mysqli_query($conn, $sql);
}

if (!$result) {
    echo 'Falha na consulta: ' . mysqli_error($conn);
    exit();
}

$tours = array();

while ($row = mysqli_fetch_assoc($result)) {
    $tours[] = $row;
}

?>

<section class="header">

</section>


<section>
    <div class="text-box">
        <h1><?php echo $language['MAIN_HEADER'] ?></h1>

        <p class="paragraph-description"><?php echo $language['MAIN_HEADER_TEXT'] ?></p>

        <a href="#tours" class="header-button"><?php echo $language['MAIN_HEADER_BUTTON'] ?></a>
    </div>
</section>

<a id="about"></a>
<section class="about">

    <div class="about-row" F>
        <div class="about-img-col">
            <img class="about-img" src='./resources/_images/landscape3.jpg'>
        </div>
        <div class="about-text-col">
            <h1><?php echo $language['ABOUT_SECTION_TITLE'] ?></h1>

            <p class="about-paragraph paragraph-description"><?php echo $language['ABOUT_SECTION_TEXT'] ?></p>

            <a href="./?p=1" class="about-more-button"><?php echo $language['ABOUT_SECTION_BUTTON'] ?></a>
        </div>
    </div>


</section>

<a id="tours"></a>
<section class="tours">
    <h1><?php echo $language['TOURS_SECTION_TITLE'] ?></h1>

    <p class="paragraph-description"><?php echo $language['TOURS_SECTION_TEXT'] ?></p>

    <div class="tours-row">
        <?php foreach ($tours as $tour) {
            echo "
                <div class='tours-img-col'>
                        <img class='tour-image' src='resources/_images/" . $tour['image'] . "'>
                        <h3 class='tour-title'>" . $tour['name'] . "</h3>
                        <p class='tour-description'>" . $tour['description'] . "</p>
                        <a href='./?p=21&id=" . $tour['id'] . "' class='tour-buttonLink'>" . $language['TOURS_SECTION_BUTTON'] . "</a>
                    </div>";
        } ?>
    </div>
</section>

<section class="pwc">
    <div class="pwc-content-box">
        <div class="pwc-content">
            <h1 class="pwc-title"><?php echo $language['PWC_SECTION_TITLE'] ?></h1>
            <div class="pwc-content-text">
                <?php echo $language['PWC_SECTION_TEXT'] ?>
            </div>
            <div class="pwc-content-button">
                <a href="https://www.portugalwines.club"><?php echo $language['PWC_SECTION_BUTTON'] ?></a>
            </div>
        </div>
    </div>
</section>