<section class="tour-header">

</section>

<section>
    <div class="tours-text-box">
        <h1><?php echo $language['TOURS_TITLE'] ?></h1>
        <p class="paragraph-description"><?php echo $language['TOURS_DESCRIPTION'] ?></p>
    </div>
</section>

<section class="section-tours">

    <div class="tour-tours">
        <?php
        echo "<div class='tour-row'>";
        $selected_language = mysqli_real_escape_string($conn, $_SESSION['selected_language']);
        $showtours = "SELECT * FROM tour WHERE language = $selected_language order by id; ";
        if ($show = mysqli_query($conn, $showtours))
            while ($row = mysqli_fetch_assoc($show))
                echo "
                <a href='./?p=21&id=" . $row['id'] . "'>
                    <div class='tour-tour'>
                        <img class='tours-image' src='resources/_images/" . $row['image'] . "'>
                        <h3 class='tours-title'>" . $row['name'] . "</h3>
                        <p class='tour-description'>" . $row['description'] . "</p>
                    </div> </a>";

        echo "</div>"
        ?>
    </div>
</section>