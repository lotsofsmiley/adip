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
if (!$result) {
    echo 'Falha na consulta: ' . mysqli_error($conn);
} else {
    $row = mysqli_fetch_assoc($result);
}

$sqlbody = "SELECT * FROM tour_body WHERE id = '$id' and language = '$selected_language' ";
$resultbody = mysqli_query($conn, $sqlbody);
if (!$resultbody) {
    echo 'Falha na consulta: ' . mysqli_error($conn);
} else {
    $rowbody = mysqli_fetch_assoc($resultbody);
}


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

    <div class="tour-photos">
        <?php
            $photos = "SELECT * FROM tour_image WHERE id_tour = '$id' and display = 1 ";
            $photosres = mysqli_query($conn, $photos);
            if (!$photosres) {
                echo 'Falha na consulta: ' . mysqli_error($conn);
            } else {
                while ($row = mysqli_fetch_assoc($photosres)) { 
                    $photosrow[] = $row['image'];
                };
            }
            if (empty($photosrow)) {
                echo "";
            } else {
                echo "
                <div class='tour-photo-grid'>";
                    foreach ($photosrow as $x) {
                        echo "<div class='tour-photo-container'><img class='tour-photo' src='./resources/_images/tour/". $id . "/" . $x . "'></img></div>";
                    }
                    echo "
                </div>";
            }
        ?>
        <div>
            <div>

            </div>
        </div>
    </div>


    <div class="tour-extras">
        <h2 class="tour-extras-main-title">
            <?= $language['TOUR_EXTRA_TITLE']; ?>
        </h2>
        <div class="tour-extras-body">
                <?php
                
                //Highlights
                $highlight = "SELECT * FROM tour_extras WHERE id_tour = '$id' and language = '$selected_language' and highlight = 1 ";
                $highlightresult = mysqli_query($conn, $highlight);
                if (!$highlightresult) {
                    echo 'Falha na consulta: ' . mysqli_error($conn);
                } else {
                    while ($row = mysqli_fetch_assoc($highlightresult)) {
                        $highlights[] = $row['description'];
                    };
                }
                if (empty($highlights)) {
                    echo "";
                } else {
                    echo "<div class='tour-extra'><div class='tour-extra-title'><h4>" . $language['TOUR_EXTRA_HIGHLIGHT'] . "</h4></div><div class='tour-extra-content'><ul>";
                    foreach ($highlights as $highlight) {
                        echo "<li>" . $highlight . "</li>";
                    }
                    echo "</ul></div></div>";
                }


                //Full description
                $description = "SELECT * FROM tour_body WHERE id = '$id' and language = '$selected_language'";
                $descresult = mysqli_query($conn, $description);
                if (!$descresult) {
                    echo 'Falha na consulta: ' . mysqli_error($conn);
                } else $description = mysqli_fetch_assoc($descresult);
                if (empty($description)) {
                    echo "";
                } else {
                    echo "<div class='tour-extra'><div class='tour-extra-title'><h4>" . $language['TOUR_EXTRA_DESCRIPTION'] . "</h4></div><div class='tour-extra-content'>";
                    echo $description['content'];
                    echo "</div></div>";
                }


                //Includes	
                $includes1 = "SELECT * FROM tour_extras WHERE id_tour = '$id' and language = '$selected_language' and include = 1 ";
                $i1 = mysqli_query($conn, $includes1);
                if (!$i1) {
                    echo 'Falha na consulta: ' . mysqli_error($conn);
                } else {
                    while ($row = mysqli_fetch_assoc($i1)) {
                        $in1[] = $row['description'];
                    };
                }
                $includes2 = "SELECT * FROM tour_extras WHERE id_tour = '$id' and language = '$selected_language' and include = 2 ";
                $i2 = mysqli_query($conn, $includes2);
                if (!$i2) {
                    echo 'Falha na consulta: ' . mysqli_error($conn);
                } else {
                    while ($row = mysqli_fetch_assoc($i2)) {
                        $in2[] = $row['description'];
                    };
                }
                if (empty($in1) && empty($in2)) {
                    echo "";
                } else {
                    echo "<div class='tour-extra'><div class='tour-extra-title'><h4>" . $language['TOUR_EXTRA_INCLUDES'] . "</h4></div><div class='tour-extra-content'><ul class='tour-extra-include'>";
                    foreach ($in1 as $in) {
                        echo "<li class='tour-extra-include'><i class='fa-solid fa-check'></i>" . $in . "</li>";
                    }
                    foreach ($in2 as $in) {
                        echo "<li><i class='fa-solid fa-xmark'></i>" . $in . "</li>";
                    }
                    echo "</ul></div></div>";
                }
                if (empty($in2) && !empty($in1)) {
                    echo "<div class='tour-extra'><div class='tour-extra-title'><h4>" . $language['TOUR_EXTRA_INCLUDES'] . "</h4></div><div class='tour-extra-content'><ul class='tour-extra-include>";
                    foreach ($in1 as $in) {
                        echo "<li><i class='fa-solid fa-check'></i>" . $in . "</li>";
                    }
                    echo "</ul></div></div>";
                } else {
                    echo "";
                }
                if (empty($in1) && !empty($in2)) {
                    echo "<div class='tour-extra'><div class='tour-extra-title'><h4>" . $language['TOUR_EXTRA_INCLUDES'] . "</h4></div><div class='tour-extra-content'><ul class='tour-extra-include'>";
                    foreach ($in2 as $in) {
                        echo "<li><i class='fa-solid fa-check'></i>" . $in . "</li>";
                    }
                    echo "</ul></div></div>";
                } else {
                    echo "";
                }


                //Not recommended
                $notrec = "SELECT * FROM tour_extras WHERE id_tour = '$id' and language = '$selected_language' and not_recommended = 1 ";
                $notrecres = mysqli_query($conn, $notrec);
                if (!$notrecres) {
                    echo 'Falha na consulta: ' . mysqli_error($conn);
                } else {
                    while ($row = mysqli_fetch_assoc($notrecres)) {
                        $notrecrow[] = $row['description'];
                    };
                }
                if (empty($notrecrow)) {
                    echo "";
                } else {
                    echo "<div class='tour-extra'><div class='tour-extra-title'><h4>" . $language['TOUR_EXTRA_NOT_SUITABLE'] . "</h4></div><div class='tour-extra-content'><ul>";
                    foreach ($notrecrow as $y) {
                        echo "<li>" . $y . "</li>";
                    }
                    echo "</ul></div></div>";
                }


                //Meeting point
                $meeting = "SELECT * FROM tour_extras WHERE id_tour = '$id' and language = '$selected_language' and meeting_point = 1 ";
                $meetingres = mysqli_query($conn, $meeting);
                if (!$meetingres) {
                    echo 'Falha na consulta: ' . mysqli_error($conn);
                } else {
                    while ($row = mysqli_fetch_assoc($meetingres)) {
                        $meetingrow['description'] = $row['description'];
                        $meetingrow['link'] = $row['link'];
                    };
                }
                if (empty($meetingrow)) {
                    echo "";
                } else {
                    echo "<div class='tour-extra'><div class='tour-extra-title'><h4>" . $language['TOUR_EXTRA_MEETING'] . "</h4></div><div class='tour-extra-content'>";
                    echo $meetingrow['description'];
                    echo "<br><br><a class='tour-extra-meeting-link' href='$meetingrow[link]'>" . $language['TOUR_EXTRA_MEETING_DESCRIPTION'] . "</a>";
                    echo "</div></div>";
                }


                //Important info
                $beforeinfo = "SELECT * FROM tour_extras WHERE id_tour = '$id' and language = '$selected_language' and before_tour = 1 ";
                $beforeinfores = mysqli_query($conn, $beforeinfo);
                if (!$beforeinfores) {
                    echo 'Falha na consulta: ' . mysqli_error($conn);
                } else {
                    while ($row = mysqli_fetch_assoc($beforeinfores)) {
                        $beforeinforow[] = $row['description'];
                    };
                }

                $shtake = "SELECT * FROM tour_extras WHERE id_tour = '$id' and language = '$selected_language' and should_take = 1 ";
                $shtakeres = mysqli_query($conn, $shtake);
                if (!$shtakeres) {
                    echo 'Falha na consulta: ' . mysqli_error($conn);
                } else {
                    while ($row = mysqli_fetch_assoc($shtakeres)) {
                        $shtakerow[] = $row['description'];
                    };
                }

                $ntallowed = "SELECT * FROM tour_extras WHERE id_tour = '$id' and language = '$selected_language' and not_allowed = 1 ";
                $ntallowedres = mysqli_query($conn, $ntallowed);
                if (!$ntallowedres) {
                    echo 'Falha na consulta: ' . mysqli_error($conn);
                } else {
                    while ($row = mysqli_fetch_assoc($ntallowedres)) {
                        $ntallowedrow[] = $row['description'];
                    };
                }
                if(!empty($beforeinforow) && !empty($shtakerow) && !empty($ntallowedrow)){

                        
                    echo "<div class='tour-extra important-info'>
                            <div class='tour-extra-title'>
                                <h4>" . $language['TOUR_EXTRA_IMPORTANT_INFO'] . "</h4>
                            </div>
                            <div class='tour-extra-content'>";

                        //BEFORE INFO        
                        echo    "<div class='important-info-row'>"; 
                                if (empty($beforeinforow)) {
                                    echo "";
                                } else {
                                    echo "<div class='important-info-row-title'>" . $language['TOUR_EXTRA_BEFORE_INFO'] . "</div><ul>";
                                    foreach ($beforeinforow as $y) {
                                        echo "<li>" . $y . "</li>";
                                    }
                                    echo "</ul></div>";
                                }

                        //SHOULD TAKE
                         echo   "<div class='important-info-row'>";
                                if (empty($shtakerow)) {
                                    echo "";
                                } else {
                                    echo "<div class='important-info-row-title'>" . $language['TOUR_EXTRA_SHOULD_TAKE'] . "</div><ul>";
                                    foreach ($shtakerow as $y) {
                                        echo "<li>" . $y . "</li>";
                                    }
                                    echo "</ul></div>";
                                }


                        //NOT ALLOWED
                        echo   "<div class='important-info-row'>";
                                if (empty($ntallowedrow)) {
                                    echo "";
                                } else {
                                    echo "<div class='important-info-row-title'>" . $language['TOUR_EXTRA_NOT_ALLOWED'] . "</div><ul>";
                                    foreach ($ntallowedrow as $y) {
                                        echo "<li>" . $y . "</li>";
                                    }
                                    echo "</ul>";
                                }
                        

                }
                    else 
                        echo "";
            
            ?>
            </div>
        </div>
</section>