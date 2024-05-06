<?php
$sql = "SELECT * FROM tour";
$result = mysqli_query($conn, $sql);

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
        <h1>"A experiência Airbnb no Douro mais autêntica de 2019"</h1>
        <p class="paragraph-description">Prepare-se para embarcar numa viagem de descoberta e paixão com aDayinDouro. Fundada em 2011 pelo visionário Manuel Guimarães,
            um engenheiro de computação com um coração apaixonado, esta empresa familiar é muito mais do que apenas uma empresa - é uma celebração de emoções e laços familiares.<br>
            Prove connosco o autêntico Vale do Douro para fazer parte da Experiência mais autêntica do Douro em 2019!</p>
        <a href="#tours" class="header-button">Tours</a>
    </div>
</section>

<a id="about"></a>
<section class="about">

    <div class="about-row" F>
        <div class="about-img-col">

        </div>
        <div class="about-text-col">
            <h1>Sobre nós</h1>
            <p class="about-paragraph paragraph-description">A vida de Manuel seguiu um rumo inesperado durante a crise econômica de 2008. Enfrentou dificuldades, mas manteve acesa dentro de si a chama da esperança.
                Foi nesse momento de adversidade que ele encontrou sua verdadeira vocação. <br>
                Determinado a criar um futuro brilhante para sua família, ele começou a alugar um quarto na casa da sua família através do Airbnb, abrindo as portas para viajantes sedentos por experiências autênticas.
                Mas foi em 2011 que a verdadeira magia aconteceu. <br>
                Manuel criou a aDayinDouro, uma empresa dedicada a criar experiências vínicas no Vale do Douro, a região vinícola mais marcante de Portugal.
                Eles compartilharam histórias, momentos preciosos e diversão criando laços que transcenderam os limites físicos. <br>
                Juntos, eles descobriram uma nova maneira de conectar corações e mentes por meio da hospitalidade.</p>

            <a href="./?p=1" class="about-more-button">Saber mais..</a>
        </div>
    </div>


</section>

<a id="tours"></a>
<section class="tours">
    <h1>Os nossos Tours</h1>
    <p class="paragraph-description">Aqui pode conferir as nossas diferentes opções de passeios vínicos. De acordo com o seu perfil, personalidade e orçamento,
        podemos proporcionar-lhe uma experiência de vida que nunca irá esquecer! Faça parte da nossa família inscrevendo-se para um tour de vinhos abaixo!</p>

    <div class="tours-row">
        <?php foreach ($tours as $tour) {
            echo "
                <div class='tours-img-col'>
                        <img class='tour-image' src='resources/_images/" . $tour['image'] . "'>
                        <h3 class='tour-title'>" . $tour['name'] . "</h3>
                        <p class='tour-description'>" . $tour['description'] . "</p>
                        <a href='./?p=21&id=" . $tour['id'] . "' class='tour-buttonLink'>Ver Tour</a>
                    </div>";
        } ?>
    </div>
</section>