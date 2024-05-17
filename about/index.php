<?php
    $selected_language = mysqli_real_escape_string($conn, $_SESSION['selected_language']);
    $sql = "SELECT * FROM employees WHERE language = '$selected_language'";
    $result = mysqli_query($conn, $sql);
    
    if (!$result) {
        echo 'Falha na consulta: ' . mysqli_error($conn);
        exit();
    }
    
    $emp = array();
    
    while ($row = mysqli_fetch_assoc($result)) {
        $emp[] = $row;
    }
?>


<section class="about-header">

</section>

<section>
    <div class="about-text-box">
        <h1><?php echo $language['ABOUT_TITLE'] ?></h1>
        <p class="paragraph-description"><?php echo $language['ABOUT_TEXT'] ?></p>
    </div>
</section>

<section class="about-us">
    <div class="about-us-row">
        <div class="about-us-row-img-col">
            <img class="about-us-row-img" src='./resources/_images/landscape8.jpg'>
        </div>
        <div class="about-us-row-text-col">
            <?php echo $language['ABOUT_TEXT_1']?>
        </div>
    </div>
    <div class="about-us-row about-us-row-reverse">
         <div class="about-us-row-img-col">
            <img class="about-us-row-img" src='./resources/_images/team.jpg'>
        </div>
        <div class="about-us-row-text-col">
            <?php echo $language['ABOUT_TEXT_2']?>
        </div>
    </div>
    <div class="about-us-row">
        <div class="about-us-row-img-col">
            <img class="about-us-row-img" src='./resources/_images/landscape5.jpg'>
        </div>
        <div class="about-us-row-text-col">
            <?php echo $language['ABOUT_TEXT_3']?>
        </div>
    </div>
</section>
<br>


<section class="about-employees">

    <div class="about-employees-header">
        <h1 class="about-employees-title">
            <?php echo $language['TEAM_TITLE'] ?>
        </h3>
        <div class="about-employees-title-description">
            <?php echo $language['TEAM_TEXT'] ?>
        </div>
    </div>

    <div class="about-employees-team">
        <?php foreach ($emp as $e) {
        echo "
        <div class='about-employees-card'>
            <img class='about-employees-card-image' src='" . $e['img'] . "'>
            <div class='about-employees-card-info'>
                <h2 class='about-employees-card-info-name'>" . $e['name'] . "</h2>
                <h3 class='about-employees-card-info-role'>" . $e['role'];
                
                if(isset($e['family_role'])) {
                    echo " - " . $e['family_role'];
                }
                
                echo "</h3>
                <div class='about-employees-card-info-text'>
                    ". $e['text'] ."
                </div>
            </div>
        </div>
        ";
        } ?>
    </div>
</section>