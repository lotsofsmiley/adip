<?php
    $sql = "SELECT * FROM employees WHERE language = 1";
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
        <h1>Sobre nós</h1>
        <p class="paragraph-description">aaaaaa</p>
    </div>
</section>

<section class="about-us">
    <div class="about-us-row">
        <div class="about-us-row-img-col">
            aaa
        </div>
        <div class="about-us-row-text-col">
            A paixão de Manuel e da sua família pelo Vale do Douro era uma chama acesa dentro deles.
            Cada canto, cada vinhedo, cada sabor continha uma história profunda e emocionalmente cativante.
            Foi assim que nasceu a ideia de oferecer passeios personalizados que fossem além de uma simples visita.<br>
            Cada passeio da aDayinDouro é uma imersão total nas maravilhas do Vale do Douro.
            Das pitorescas colinas cobertas de vinhedos às tradicionais vinícolas, cada paragem é uma oportunidade para se apaixonar pela rica história e cultura da região.
            Mas o verdadeiro encanto está nas pessoas - a família de Manuel, com os seus sorrisos calorosos e corações generosos,
            guia cada hóspede em uma jornada de conexões profundas e momentos tocantes, tornando-os parte da família.
        </div>
    </div>
    <div class="about-us-row">
        <div class="about-us-row-text-col">
            A história de Manuel e sua família ganhou vida quando, em 2019, eles foram homenageados com o prestigioso prêmio "A experiência Airbnb no Douro mais autêntica de 2019".
            Este reconhecimento foi o selo de aprovação pela paixão e dedicação que colocam em cada visita e reafirmaram que estavam no caminho certo para criar memórias inesquecíveis.
            Com a aDayinDouro, todos os dias são repletos de amor, conexão e um toque de magia.
            É uma empresa familiar onde as emoções transbordam em cada interação e cada cliente se torna parte de uma história em constante evolução.
        </div>
        <div class="about-us-row-img-col">
            aaa
        </div>
    </div>
    <div class="about-us-row">
        <div class="about-us-row-img-col">
            aaa
        </div>
        <div class="about-us-row-text-col">
            Unidos pelo amor e paixão pelo Vale do Douro, Manuel, a sua família e a sua equipa apaixonada estão prontos para compartilhar a jornada mais emocionante de sua vida.<br>
            Junte-se a nós e deixe-se levar pela emoção enquanto descobrimos juntos a essência do Vale do Douro, uma experiência que vai tocar o seu coração e despertar os seus sentidos. 
            Bem-vindo ao aDayinDouro - onde a paixão, a descoberta e os laços familiares se encontram.
        </div>
    </div>
</section>
<br>


<section class="about-employees">

    <div class="about-employees-header">
        <h1 class="about-employees-title">
            Membros da família
        </h3>
        <div class="about-employees-title-description">
            Conheça a nossa fantástica equipa.
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