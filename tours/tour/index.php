<?php
if ($_SERVER["REQUEST_METHOD"] == "GET") {
    $id = $_GET['id'];
    if (empty($id)) {
        echo "Erro, pedido inválido";
        exit();
    }
} else {
    echo "Erro, pedido inválido";
    exit();
}

$sql = "SELECT * FROM tour WHERE id = '$id' and language = '$selected_language' ";
$result = mysqli_query($conn, $sql);
if (!$result) {echo 'Falha na consulta: ' . mysqli_error($conn);} else {$row = mysqli_fetch_assoc($result);}

$sqlbody = "SELECT * FROM tour_body WHERE id = '$id' and language = '$selected_language' ";
$resultbody = mysqli_query($conn, $sqlbody);
if (!$resultbody) {echo 'Falha na consulta: ' . mysqli_error($conn);} else {$rowbody = mysqli_fetch_assoc($resultbody);}


?>

<section class="tour-header">
    <div class="tour-header-text-box">
        <h1> <?= $row['name'] ?></h1>
    </div>
</section>
<section class="tour-main">
    <ul class="tour-info">
        <li class="tour-data max-guests">
            <i style="margin-right: 0.3rem" class="fa-solid fa-people-group"></i>
            <?= $row['group_type'] ?> <?php echo ' ' . $language['TOUR_INFO_GROUP']; ?>
        </li>
        <li class="tour-data duration">
            <i style="margin-right: 0.3rem" class="fa-regular fa-clock"></i>
            <?= $row['duration'] ?>
        </li>
        <li class="tour-data language">
            <i style="margin-right: 0.3rem" class="fa-regular fa-flag"></i>
            <?= $row['tour_language'] ?>
        </li>
    </ul>
    <div class="tour-introduction">
        <h2 class="tour-introduction-title">
            <?= $rowbody['subtitle'] ?>
        </h2>
        <div class="tour-introduction-body">
            <?= $row['description'] ?>
        </div>
    </div>
    <div class="tour-extras">
        <h2 class="tour-extras-main-title">
            <?= $language['TOUR_EXTRA_TITLE']; ?>
        </h2>
        <div class="tour-extras-body">
            <!-- Highlights -->
            <div class="tour-extra">
                <?php 
                    $highlight = "SELECT * FROM tour_extras WHERE id_tour = '$id' and language = '$selected_language' and highlight = 1 ";
                    $highlightresult = mysqli_query($conn, $highlight);
                    if (!$highlightresult) {echo 'Falha na consulta: ' . mysqli_error($conn);} else {
                        while ($row = mysqli_fetch_assoc($highlightresult)) {
                            $highlights[] = $row['description'];
                        };
                    }
                    if (empty($highlights)) {
                        echo "";
                    } else {
                        echo "<div class='tour-extra-title'><h4>" . $language['TOUR_EXTRA_HIGHLIGHT'] . "</h4></div><div class='tour-extra-content'><ul>";
                            foreach ($highlights as $highlight) {
                                echo "<li>" . $highlight . "</li>";
                            }
                        echo "</ul></div>";
                    }
                    ?>
            </div>
            <!-- Full description -->
            <div class="tour-extra">
                <?php 
                    $description = "SELECT * FROM tour_body WHERE id = '$id' and language = '$selected_language'";
                    $descresult = mysqli_query($conn, $description);
                    if (!$descresult) {echo 'Falha na consulta: ' . mysqli_error($conn);} else $description = mysqli_fetch_assoc($descresult);
                    if (empty($description)) {
                        echo "";
                    } else {
                        echo "<div class='tour-extra-title'><h4>" . $language['TOUR_EXTRA_DESCRIPTION'] . "</h4></div><div class='tour-extra-content'>";
                            echo $description['content'];
                        echo "</div>";
                    }
                    ?>
            </div>
            <!-- Includes -->
            <div class="tour-extra">
                <?php 
                    $includes1 = "SELECT * FROM tour_extras WHERE id_tour = '$id' and language = '$selected_language' and includes = 1 ";
                    $i1 = mysqli_query($conn, $includes1);
                    if (!$i1) {echo 'Falha na consulta: ' . mysqli_error($conn);} else {
                        while ($row = mysqli_fetch_assoc($i1)) {
                            $in1[] = $row['description'];
                        };
                    }
                    $includes2 = "SELECT * FROM tour_extras WHERE id_tour = '$id' and language = '$selected_language' and includes = 2 ";
                    $i2 = mysqli_query($conn, $includes2);
                    if (!$i2) {echo 'Falha na consulta: ' . mysqli_error($conn);} else {
                        while ($row = mysqli_fetch_assoc($i2)) {
                            $in2[] = $row['description'];
                        };
                    }
                    if (empty($highlights)) {
                        echo "";
                    } else {
                        echo "<div class='tour-extra-title'><h4>" . $language['TOUR_EXTRA_HIGHLIGHT'] . "</h4></div><div class='tour-extra-content'><ul>";
                            foreach ($highlights as $highlight) {
                                echo "<li>" . $highlight . "</li>";
                            }
                        echo "</ul></div>";
                    }
                    ?>
            </div>
        </div>
    </div>
</section>