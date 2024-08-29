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
$sqlbody = "SELECT * FROM tour_body WHERE id = '$id' and language = '$selected_language' ";
$result = mysqli_query($conn, $sql);
$resultbody = mysqli_query($conn, $sqlbody);

if (!$result) {
    echo 'Falha na consulta: ' . mysqli_error($conn);
} else {
}
$row = mysqli_fetch_assoc($result);

if (!$resultbody) {
    echo 'Falha na consulta: ' . mysqli_error($conn);
} else {
}
$rowbody = mysqli_fetch_assoc($resultbody);

?>

<section class="tour-header">
    <div class="tour-text-box">
        <h1> <?= $row['name'] ?></h1>
    </div>
</section>
<div class="tour-regular">
    <section class="tour-main">
        <ul class="tour-info">
            <li class="tour-data max-guests">
                <?php //Max <?= $row['tour_limit'] guests ?>
                Small Groups
            </li>
            <li class="tour-data price-unit">
                <?= $row['price_unit'] ?> €
            </li>
            <li class="tour-data starting">
                Starting between 8:30/9:00
            </li>
            <li class="tour-data ending">
                Ending around <?= date("H:i", strtotime($row['ending'])) ?>
            </li>
        </ul>
        <div class="introduction">
            <h2 class="introduction-title">
                <?= $rowbody['subtitle'] ?>
            </h2>
            <div class="introduction-body">
                <?= $rowbody['content'] ?>
            </div>
        </div>
    </section>
    <section class="tour-side">
        <div class="tour-side-info">
            <div class="tour-side-title">
                <?php echo $language['TOUR_SIDE_TITLE']; ?>
            </div>
            <div class="tour-side-subtitle">
                <?php echo $language['TOUR_SIDE_SUBTITLE']; ?>
            </div>
        </div>
        <div class="tour-side-calendarbox">
            <input type="date" value="<?= date('Y-m-d') ?>" min="<?= date('Y-m-d') ?>" max="<?= date('Y') ?>-12-31">
            <div class="tour-side-calendar">



                <?php
                $weekdays = array(
                    'Sunday' => $language['SUNDAY'],
                    'Monday' => $language['MONDAY'],
                    'Tuesday' => $language['TUESDAY'],
                    'Wednesday' => $language['WEDNESDAY'],
                    'Thursday' => $language['THURSDAY'],
                    'Friday' => $language['FRIDAY'],
                    'Saturday' => $language['SATURDAY']
                );

                //Procura os dias que já estão cheios
                $sql = "SELECT a.start
                            FROM appointment a
                            INNER JOIN (
                                SELECT id_tour, start, SUM(number_people) AS total_people
                                FROM appointment
                                GROUP BY id_tour, start
                            ) subquery ON a.id_tour = subquery.id_tour AND a.start = subquery.start
                            INNER JOIN tour t ON a.id_tour = t.id
                            WHERE subquery.total_people = t.tour_limit
                            GROUP BY a.start";

                $result = mysqli_query($conn, $sql);

                if (!$result) {
                    echo 'Falha na consulta: ' . mysqli_error($conn);
                } else {
                    $uniqueDates = array();

                    while ($rowuniquedates = mysqli_fetch_assoc($result)) {
                        $uniqueDates[] = $rowuniquedates['start'];
                    }
                }
                ///////////////

                $todaydate = date('Y-m-d');
                $next3days = array();
                $date = new DateTime($todaydate);

                $nextAvailableDays = array();
                $date = new DateTime($todaydate);

                while (count($nextAvailableDays) < 3) {
                    $date->modify('+1 day');
                    $dday = $date->format('Y-m-d');

                    if (!in_array($dday, $uniqueDates)) {
                        $nextAvailableDays[] = $dday;
                    }
                }

                foreach ($nextAvailableDays as $day) {
                    $sql = "SELECT sum(number_people) as bought_tickets FROM appointment WHERE id_tour='$id' and start='$day' and cancel_date is null and payment_date is not null";
                    $countappointment = mysqli_query($conn, $sql);
                    $rowappointment = mysqli_fetch_assoc($countappointment);

                    if ($rowappointment['bought_tickets'] !== null)
                        $tickets_left = $row['tour_limit'] - $rowappointment['bought_tickets'];
                    else
                        $tickets_left = $row['tour_limit'];


                    $weekday = $weekdays[date('l', strtotime($day))];
                    $formatted_date = date('d/m', strtotime($day));

                    $link = "";
                    if (isset($_SESSION['logged']) && isset($_SESSION['complete_account'])) {
                        $link = "./?p=22&id=" . $row['id'] . "&tickets=" . $tickets_left . "&day=" . $day;
                    } elseif (!isset($_SESSION['logged'])) {
                        $link = "./client/login/login.php";
                    } elseif (isset($_SESSION['logged']) && (!isset($_SESSION['verified']) || !isset($_SESSION['complete_account']))) {
                        $link = "./client/acount/index.php";
                    }

                    echo "
                        <div class='tour-side-dates'>
                            <div class='tour-side-dates-info'>
                                <div class='info-date'>
                                    " . ucfirst($weekday) . ", " . $formatted_date . "
                                </div>
                                <div class='info-time'>
                                    8:30/9:00 --> " . date('H:i', strtotime($row['ending'])) . "
                                </div>
                                <div class='info-tickets'>
                                    " . $tickets_left . " " . $language['TOUR_SIDE_AVAILABILITY'] . "
                                </div>
                            </div>
                            <div class='tour-side-dates-action'>
                                <div class='action-price'>
                                    " . $row['price_unit'] . "€ " . $language['TOUR_SIDE_PEOPLE'] . "
                                </div>
                                <a href='$link'>
                                    <div class='action-button'>
                                        " . $language['TOUR_SIDE_BUTTON'] . "
                                    </div>
                                </a>
                            </div>
                        </div>";
                }
                ?>
            </div>
            <!--<a href="">
                <div class="tour-side-more">
                    Mostrar mais datas
                </div>
            </a>-->
        </div>
    </section>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
    $(document).ready(function() {
        function updateTourDates(selectedDate) {
            $.ajax({
                type: "POST",
                url: "./tours/tour/tour_dates.php",
                data: {
                    date: selectedDate,
                    id: <?= $id ?>,
                    uniqueDates: <?= json_encode($uniqueDates) ?>
                },
                success: function(response) {
                    $(".tour-side-calendar").html(response);
                }
            });
        }

        $("input[type='date']").change(function() {
            var selectedDate = $(this).val();
            updateTourDates(selectedDate);
        });
    });
</script>