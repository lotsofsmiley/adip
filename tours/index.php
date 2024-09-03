<section class="tours-header">
    <div class="tours-header-text-box">
        <h1><?php echo $language['TOURS_TITLE'] ?></h1>
        <p class="paragraph-description"><?php echo $language['TOURS_DESCRIPTION'] ?></p>
    </div>
</section>

<section class="section-tours">
        <?php
        echo "<div class='tours-grid'>";
        $selected_language = mysqli_real_escape_string($conn, $_SESSION['selected_language']);
        $showtours = "SELECT * FROM tour WHERE language = $selected_language and display = 1 and disabled = 0 order by id; ";
        if ($show = mysqli_query($conn, $showtours))
            while ($row = mysqli_fetch_assoc($show))
                echo "
                    <div class='tours-grid-object'>
                        <div class='tours-image-container'>
                            <img class='tours-image-object' src='resources/_images/" . $row['image'] . "'>
                        </div>
                        <div class='tours-content'>
                            <h3 class='tours-title'>" . $row['name'] . "</h3>
                            <p class='tours-description'>" . $row['description'] . "</p>
                            <a class='tours-button' href='./?p=21&id=" . $row['id'] . "'>" . $language['TOURS_SECTION_BUTTON_2'] . "</a>
                        </div>
                    </div>";

        echo "</div>"
        ?>
</section>