<?php
if ($_SERVER["REQUEST_METHOD"] == "GET") {
    $id = $_GET['id'];
    $max = $_GET['tickets'];
    $day = $_GET['day'];
    if (empty($id)) {
        echo "Erro, pedido inválido";
        exit();
    }
} else {
    echo "Erro, pedido inválido";
    exit();
}


$sql = "SELECT * FROM tour WHERE id = '$id' ";
$result = mysqli_query($conn, $sql);

if (!$result) {
    echo 'Falha na consulta: ' . mysqli_error($conn);
} else {
}
$row = mysqli_fetch_assoc($result);

?>

<section class="tour-header">
    <div class="tour-text-box">
        <h1> <?= $row['name'] ?></h1>
    </div>
</section>
<section class="checkout-section">
    <div class="checkout">
        <div class="checkout-table">
            <table>
                <thead>
                    <tr>
                        <th scope="col" style="width:55%;">Tipo do bilhete</th>
                        <th scope="col" style="width:15%;">Preço</th>
                        <th scope="col" style="width:15%;">Quantidade</th>
                        <th scope="col" style="width:15%;">Total</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Adulto -->
                    <tr>
                        <td><?= $row['name'] ?> - Adulto</td>
                        <td><?= $row['price_unit'] ?>€</td>
                        <td><input type="number" min="0" value="0" name="quantity1" max="<?= $max ?>" onchange="calculateTotal(this, <?= $row['price_unit'] ?>, 'total1', 'total')"></td>
                        <td><span id="total1">0</span>€</td>
                    </tr>
                    <!-- Criança -->
                    <tr>
                        <td><?= $row['name'] ?> - Criança</td>
                        <td><?= $row['price_unit'] / 2 ?>€</td>
                        <td><input type="number" min="0" value="0" name="quantity2" max="<?= $max ?>" onchange="calculateTotal(this, <?= $row['price_unit'] / 2 ?>, 'total2', 'total')"></td>
                        <td><span id="total2">0</span>€</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="checkout-total">
            <div class="total-title">
                Total do Carrinho
            </div>
            <div class="total-row">
                <div>Total</div>
                <div>
                    <span id="total">0.00</span>€
                </div>
            </div>
        </div>
        <div id="checkout-wrapper">
            <button type="button" class="checkout-button" id="checkout-button" onclick="redirectToPayment()">Avançar para pagamento</button>
        </div>
    </div>
    <div class="contact-info">
        <h3 class="contact-info-title">Alguma pergunta?</h3>
        <div class="contact-info-text">Não exite em contactar-nos, ficamos contentes em ajudar</div>
        <div class="contact-phone"><i class="contact-icon fa fa-phone"></i><a href="tel:+351 916 541 852">+351 916 541 852</a></div>
        <div class="contact-email"><i class="contact-icon fa fa-envelope"></i><a href="mailto:adayinporto@gmail.com">adayinporto@gmail.com</a></div>
    </div>
</section>

<style>
    .checkout-button.disabled {
        opacity: 0.5;
        pointer-events: none;
    }
</style>

<script>
    var numElements = document.querySelectorAll('input[type="number"]');
    numElements.forEach(function(element) {
        element.addEventListener('change', validateMax);
        element.addEventListener('input', validateMax);
        element.addEventListener('keyup', validateMax);
        element.addEventListener('paste', validateMax);
    });

    function validateMax() {
        var maxQuantity = <?= $max ?>;
        var quantity1 = parseInt(document.getElementsByName('quantity1')[0].value);
        var quantity2 = parseInt(document.getElementsByName('quantity2')[0].value);
        var totalQuantity = quantity1 + quantity2;

        if (this.name === 'quantity1' && totalQuantity > maxQuantity) {
            var remaining = maxQuantity - quantity2;
            if (remaining < 0) remaining = 0;
            this.value = remaining;
        } else if (this.name === 'quantity2' && totalQuantity > maxQuantity) {
            var remaining = maxQuantity - quantity1;
            if (remaining < 0) remaining = 0;
            this.value = remaining;
        }

        calculateOverallTotal();
        updateCheckoutButtonState();
    }

    function calculateTotal(input, price, totalId, overallTotalId) {
        var quantity = input.value;
        var total = quantity * price;
        document.getElementById(totalId).textContent = total.toFixed(2);

        calculateOverallTotal();
        updateCheckoutButtonState();
    }

    function calculateOverallTotal() {
        var total1 = parseFloat(document.getElementById('total1').textContent);
        var total2 = parseFloat(document.getElementById('total2').textContent);
        var overallTotal = total1 + total2;
        document.getElementById('total').textContent = overallTotal.toFixed(2);
    }

    function redirectToPayment() {
        var adultsQuantity = parseInt(document.getElementsByName('quantity1')[0].value);
        var childrenQuantity = parseInt(document.getElementsByName('quantity2')[0].value);

        if (adultsQuantity === 0 && childrenQuantity === 0) {
            return;
        }

        var url = './?p=23&id=<?= $id ?>&tickets=<?= $max ?>&day=<?= $day ?>&adults=' + adultsQuantity + '&children=' + childrenQuantity;
        window.location.href = url;
    }

    function updateCheckoutButtonState() {
        var quantity1 = parseInt(document.getElementsByName('quantity1')[0].value);

        var checkoutButton = document.getElementById('checkout-button');
        if (quantity1 === 0) {
            checkoutButton.classList.add('disabled');
            checkoutButton.setAttribute('disabled', true);
        } else {
            checkoutButton.classList.remove('disabled');
            checkoutButton.removeAttribute('disabled');
        }
    }

    window.addEventListener('DOMContentLoaded', function() {
        updateCheckoutButtonState();
    });
</script>