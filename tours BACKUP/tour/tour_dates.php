<?php
require('../../assets/scripts/db/connect.php');
if (isset($_POST['date'])) {
    $selected_date = $_POST['date'];
    $id = $_POST['id'];
    $td = date('Y-m-d');

    $sql = "SELECT * FROM tour WHERE id = '$id' ";
    $sqlbody = "SELECT * FROM tour_body WHERE id = '$id' ";
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

    $todaydate = date('Y-m-d', strtotime($selected_date));


    $weekdays = array(
        'Sunday' => 'Domingo',
        'Monday' => 'Segunda-feira',
        'Tuesday' => 'Terça-feira',
        'Wednesday' => 'Quarta-feira',
        'Thursday' => 'Quinta-feira',
        'Friday' => 'Sexta-feira',
        'Saturday' => 'Sábado'
    );

    $next3days = array();
    $date = new DateTime($todaydate);

    $uniqueDates = $_POST['uniqueDates'];

    if ($todaydate !== $td) {
        $date->modify('-1 day');
    }

    $nextAvailableDays = array();
    while (count($nextAvailableDays) < 3) {
        $date->modify('+1 day');
        $dday = $date->format('Y-m-d');

        if (!in_array($dday, $uniqueDates)) {
            $nextAvailableDays[] = $dday;
        }
    }

    foreach ($nextAvailableDays as $day) {
        $sql = "SELECT SUM(number_people) as bought_tickets FROM appointment WHERE id_tour='$id' and start='$day' and cancel_date is null and payment_date is not null";
        $countappointment = mysqli_query($conn, $sql);
        $rowappointment = mysqli_fetch_assoc($countappointment);

        if ($rowappointment['bought_tickets'] !== null) {
            $tickets_left = $row['tour_limit'] - $rowappointment['bought_tickets'];
        } else {
            $tickets_left = $row['tour_limit'];
        }

        $weekday = $weekdays[date('l', strtotime($day))];
        $formatted_date = date('d/m', strtotime($day));

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
                        " . $tickets_left . " Bilhetes disponíveis
                    </div>
                </div>
                <div class='tour-side-dates-action'>
                    <div class='action-price'>
                        " . $row['price_unit'] . "$ Pessoa
                    </div>
                    <a href='./?p=22
                                &id=" . $row['id'] . "
                                &tickets=" . $tickets_left . "
                                &day=" . $day . "
                    '>
                        <div class='action-button'>
                            Escolher
                        </div>
                    </a>
                </div>
            </div>";
    }
}
?>