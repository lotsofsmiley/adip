<?php

if ($_SERVER["REQUEST_METHOD"] == "GET") {
    $id = $_GET['id'];
    $max = $_GET['tickets'];
    $day = $_GET['day'];
    $adults = $_GET['adults'];
    $children = $_GET['children'];
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

$totalAdults = $row['price_unit'] * $adults;
$totalChildren = $row['price_unit'] / 2 * $children;
$total = $totalAdults + $totalChildren;


?>

<style>
    .error-message {
        color: red;
        font-size: 12px;
        margin-top: 4px;
        padding-block: 0.5rem;
    }

    .payment-section {
        width: 50rem;
        margin: auto;
        display: flex;
    }

    .payment {
        width: 65%;
        padding: 2rem;
        margin-top: 3.5rem;
    }

    .payment-form {
        margin-top: 2rem;
    }

    .side-content {
        width: 35%;
        padding: 2rem;
    }

    .payment-form p {
        margin-top: 10px;
    }

    input,
    select {
        margin-block: 0 !important;
    }

    .validity-cvv {
        display: flex;
        width: 100%;
    }

    .card-holder {
        width: calc(100% - 1rem);
    }

    .card-number {
        width: calc(100% - 1rem);
    }

    .card-validity {
        border-top-left-radius: 0px;
        border-bottom-left-radius: 0px;
    }

    .card-cvv {
        border-top-right-radius: 0px;
        border-bottom-right-radius: 0px;
    }

    .card-country {
        width: calc(100% - 2rem);
    }

    form {
        width: 100%;
    }

    .payment-button {
        width: calc(100% - 2rem);
        text-align: center;
        padding: 0.5rem 1rem;
        background: var(--contrast-color);
        box-shadow: 0 0 0 1px var(--light-text-reverse-color);
        border-radius: 15px;
        margin-block: 1rem;
        color: white;
        cursor: pointer;
        border: none;
        font-size: 15px;
        font-weight: 400;
    }

    .payment-button.disabled {
        opacity: 0.5;
        pointer-events: none;
    }

    tr:last-child {
        border-bottom: none;
    }

    tr {
        border-bottom: 1px solid var(--light-text-reverse-color);
    }

    .payment-title {
        font-size: 1.375rem;
        font-weight: 500;
    }

    .contact-info,
    .cart-info {
        width: 100% !important;
    }

    .cart-info {
        margin-bottom: 1rem;
    }
</style>

<section class="tour-header">
    <div class="tour-text-box">
        <h1> <?= $row['name'] ?></h1>
    </div>
</section>
<section class="payment-section">
    <div class="payment">

        <div class="payment-title">
            Dados de pagamento
        </div>

        <form method="POST" action="./?p=24">
            <div class="payment-form">
                <span id="error" class="error-message"></span>
                <div class="card-holder">
                    <p>Nome no cartão</p>
                    <input class="card-holder" type="text" placeholder="Introduz o nome do titular do cartão" name="name">
                </div>
                <div class="card-number">
                    <p>Número do cartão*</p>
                    <input class="card-number" type="text" id="card-number-input" placeholder="0000 0000 0000 0000" name="cardNumber" required>
                </div>
                <div class="validity-cvv">
                    <div>
                        <p>CVV*</p>
                        <input class="card-cvv" type="text" id="cvv-input" placeholder="000" name="cvv" required>
                    </div>
                    <div>
                        <p>Validade*</p>
                        <input class="card-validity" type="text" id="validity-input" placeholder="MM/AA" name="validity" required>
                    </div>
                </div>
                <div>
                    <p>País/Região</p>
                    <select class="card-country" name="cardcountry" required="true">
                        <option value="AF">Afghanistan</option>
                        <option value="AL">Albania</option>
                        <option value="DZ">Algeria</option>
                        <option value="AS">American Samoa</option>
                        <option value="AD">Andorra</option>
                        <option value="AO">Angola</option>
                        <option value="AI">Anguilla</option>
                        <option value="AQ">Antarctica</option>
                        <option value="AG">Antigua and Barbuda</option>
                        <option value="AR">Argentina</option>
                        <option value="AM">Armenia</option>
                        <option value="AW">Aruba</option>
                        <option value="AU">Australia</option>
                        <option value="AT">Austria</option>
                        <option value="AZ">Azerbaijan</option>
                        <option value="BS">Bahamas</option>
                        <option value="BH">Bahrain</option>
                        <option value="BD">Bangladesh</option>
                        <option value="BB">Barbados</option>
                        <option value="BY">Belarus</option>
                        <option value="BE">Belgium</option>
                        <option value="BZ">Belize</option>
                        <option value="BJ">Benin</option>
                        <option value="BM">Bermuda</option>
                        <option value="BT">Bhutan</option>
                        <option value="BO">Bolivia</option>
                        <option value="BA">Bosnia and Herzegovina</option>
                        <option value="BW">Botswana</option>
                        <option value="BV">Bouvet Island</option>
                        <option value="BR">Brazil</option>
                        <option value="IO">British Indian Ocean Territory</option>
                        <option value="BN">Brunei</option>
                        <option value="BG">Bulgaria</option>
                        <option value="BF">Burkina Faso</option>
                        <option value="BI">Burundi</option>
                        <option value="KH">Cambodia</option>
                        <option value="CM">Cameroon</option>
                        <option value="CA">Canada</option>
                        <option value="CV">Cape Verde</option>
                        <option value="KY">Cayman Islands</option>
                        <option value="CF">Central African Republic</option>
                        <option value="TD">Chad</option>
                        <option value="CL">Chile</option>
                        <option value="CN">China</option>
                        <option value="CX">Christmas Island</option>
                        <option value="CC">Cocos (Keeling) Islands</option>
                        <option value="CO">Colombia</option>
                        <option value="KM">Comoros</option>
                        <option value="CG">Congo</option>
                        <option value="CK">Cook Islands</option>
                        <option value="CR">Costa Rica</option>
                        <option value="HR">Croatia</option>
                        <option value="CU">Cuba</option>
                        <option value="CY">Cyprus</option>
                        <option value="CZ">Czech Republic</option>
                        <option value="DK">Denmark</option>
                        <option value="DJ">Djibouti</option>
                        <option value="DM">Dominica</option>
                        <option value="DO">Dominican Republic</option>
                        <option value="TP">East Timor</option>
                        <option value="EC">Ecuador</option>
                        <option value="EG">Egypt</option>
                        <option value="SV">El Salvador</option>
                        <option value="GQ">Equatorial Guinea</option>
                        <option value="ER">Eritrea</option>
                        <option value="EE">Estonia</option>
                        <option value="ET">Ethiopia</option>
                        <option value="FK">Falkland Islands</option>
                        <option value="FO">Faroe Islands</option>
                        <option value="FJ">Fiji Islands</option>
                        <option value="FI">Finland</option>
                        <option value="FR">France</option>
                        <option value="GF">French Guiana</option>
                        <option value="PF">French Polynesia</option>
                        <option value="TF">French Southern territories</option>
                        <option value="GA">Gabon</option>
                        <option value="GM">Gambia</option>
                        <option value="GE">Georgia</option>
                        <option value="DE">Germany</option>
                        <option value="GH">Ghana</option>
                        <option value="GI">Gibraltar</option>
                        <option value="GR">Greece</option>
                        <option value="GL">Greenland</option>
                        <option value="GD">Grenada</option>
                        <option value="GP">Guadeloupe</option>
                        <option value="GU">Guam</option>
                        <option value="GT">Guatemala</option>
                        <option value="GG">Guernsey</option>
                        <option value="GN">Guinea</option>
                        <option value="GW">Guinea-Bissau</option>
                        <option value="GY">Guyana</option>
                        <option value="HT">Haiti</option>
                        <option value="HM">Heard Island and McDonald Islands</option>
                        <option value="VA">Holy See (Vatican City State)</option>
                        <option value="HN">Honduras</option>
                        <option value="HK">Hong Kong</option>
                        <option value="HU">Hungary</option>
                        <option value="IS">Iceland</option>
                        <option value="IN">India</option>
                        <option value="ID">Indonesia</option>
                        <option value="IR">Iran</option>
                        <option value="IQ">Iraq</option>
                        <option value="IE">Ireland</option>
                        <option value="IM">Isle of Man</option>
                        <option value="IL">Israel</option>
                        <option value="IT">Italy</option>
                        <option value="CI">Ivory Coast</option>
                        <option value="JM">Jamaica</option>
                        <option value="JP">Japan</option>
                        <option value="JE">Jersey</option>
                        <option value="JO">Jordan</option>
                        <option value="KZ">Kazakhstan</option>
                        <option value="KE">Kenya</option>
                        <option value="KI">Kiribati</option>
                        <option value="KW">Kuwait</option>
                        <option value="KG">Kyrgyzstan</option>
                        <option value="LA">Laos</option>
                        <option value="LV">Latvia</option>
                        <option value="LB">Lebanon</option>
                        <option value="LS">Lesotho</option>
                        <option value="LR">Liberia</option>
                        <option value="LY">Libyan Arab Jamahiriya</option>
                        <option value="LI">Liechtenstein</option>
                        <option value="LT">Lithuania</option>
                        <option value="LU">Luxembourg</option>
                        <option value="MO">Macao</option>
                        <option value="MK">North Macedonia</option>
                        <option value="MG">Madagascar</option>
                        <option value="MW">Malawi</option>
                        <option value="MY">Malaysia</option>
                        <option value="MV">Maldives</option>
                        <option value="ML">Mali</option>
                        <option value="MT">Malta</option>
                        <option value="MH">Marshall Islands</option>
                        <option value="MQ">Martinique</option>
                        <option value="MR">Mauritania</option>
                        <option value="MU">Mauritius</option>
                        <option value="YT">Mayotte</option>
                        <option value="MX">Mexico</option>
                        <option value="FM">Micronesia, Federated States of</option>
                        <option value="MD">Moldova</option>
                        <option value="MC">Monaco</option>
                        <option value="MN">Mongolia</option>
                        <option value="ME">Montenegro</option>
                        <option value="MS">Montserrat</option>
                        <option value="MA">Morocco</option>
                        <option value="MZ">Mozambique</option>
                        <option value="MM">Myanmar</option>
                        <option value="NA">Namibia</option>
                        <option value="NR">Nauru</option>
                        <option value="NP">Nepal</option>
                        <option value="NL">Netherlands</option>
                        <option value="AN">Netherlands Antilles</option>
                        <option value="NC">New Caledonia</option>
                        <option value="NZ">New Zealand</option>
                        <option value="NI">Nicaragua</option>
                        <option value="NE">Niger</option>
                        <option value="NG">Nigeria</option>
                        <option value="NU">Niue</option>
                        <option value="NF">Norfolk Island</option>
                        <option value="KP">North Korea</option>
                        <option value="GB">Northern Ireland</option>
                        <option value="MP">Northern Mariana Islands</option>
                        <option value="NO">Norway</option>
                        <option value="OM">Oman</option>
                        <option value="PK">Pakistan</option>
                        <option value="PW">Palau</option>
                        <option value="PS">Palestine</option>
                        <option value="PA">Panama</option>
                        <option value="PG">Papua New Guinea</option>
                        <option value="PY">Paraguay</option>
                        <option value="PE">Peru</option>
                        <option value="PH">Philippines</option>
                        <option value="PN">Pitcairn</option>
                        <option value="PL">Poland</option>
                        <option value="PT" selected="selected">Portugal</option>
                        <option value="PR">Puerto Rico</option>
                        <option value="QA">Qatar</option>
                        <option value="RE">Reunion</option>
                        <option value="RO">Romania</option>
                        <option value="RU">Russian Federation</option>
                        <option value="RW">Rwanda</option>
                        <option value="SH">Saint Helena</option>
                        <option value="KN">Saint Kitts and Nevis</option>
                        <option value="LC">Saint Lucia</option>
                        <option value="PM">Saint Pierre and Miquelon</option>
                        <option value="VC">Saint Vincent and the Grenadines</option>
                        <option value="WS">Samoa</option>
                        <option value="SM">San Marino</option>
                        <option value="ST">Sao Tome and Principe</option>
                        <option value="SA">Saudi Arabia</option>
                        <option value="SN">Senegal</option>
                        <option value="RS">Serbia</option>
                        <option value="SC">Seychelles</option>
                        <option value="SL">Sierra Leone</option>
                        <option value="SG">Singapore</option>
                        <option value="SK">Slovakia</option>
                        <option value="SI">Slovenia</option>
                        <option value="SB">Solomon Islands</option>
                        <option value="SO">Somalia</option>
                        <option value="ZA">South Africa</option>
                        <option value="GS">South Georgia and the South Sandwich Islands</option>
                        <option value="KR">South Korea</option>
                        <option value="SS">South Sudan</option>
                        <option value="ES">Spain</option>
                        <option value="LK">Sri Lanka</option>
                        <option value="SD">Sudan</option>
                        <option value="SR">Suriname</option>
                        <option value="SJ">Svalbard and Jan Mayen</option>
                        <option value="SZ">Swaziland</option>
                        <option value="SE">Sweden</option>
                        <option value="CH">Switzerland</option>
                        <option value="SY">Syria</option>
                        <option value="TJ">Tajikistan</option>
                        <option value="TZ">Tanzania</option>
                        <option value="TH">Thailand</option>
                        <option value="CD">The Democratic Republic of Congo</option>
                        <option value="TL">Timor-Leste</option>
                        <option value="TG">Togo</option>
                        <option value="TK">Tokelau</option>
                        <option value="TO">Tonga</option>
                        <option value="TT">Trinidad and Tobago</option>
                        <option value="TN">Tunisia</option>
                        <option value="TR">Turkey</option>
                        <option value="TM">Turkmenistan</option>
                        <option value="TC">Turks and Caicos Islands</option>
                        <option value="TV">Tuvalu</option>
                        <option value="UG">Uganda</option>
                        <option value="UA">Ukraine</option>
                        <option value="AE">United Arab Emirates</option>
                        <option value="GB">United Kingdom</option>
                        <option value="US">United States</option>
                        <option value="UM">United States Minor Outlying Islands</option>
                        <option value="UY">Uruguay</option>
                        <option value="UZ">Uzbekistan</option>
                        <option value="VU">Vanuatu</option>
                        <option value="VE">Venezuela</option>
                        <option value="VN">Vietnam</option>
                        <option value="VG">Virgin Islands, British</option>
                        <option value="VI">Virgin Islands, U.S.</option>
                        <option value="WF">Wallis and Futuna</option>
                        <option value="EH">Western Sahara</option>
                        <option value="YE">Yemen</option>
                        <option value="YU">Yugoslavia</option>
                        <option value="ZM">Zambia</option>
                        <option value="ZW">Zimbabwe</option>
                    </select>
                </div>
                <input type="hidden" value="<?php echo $id ?>" name="id" />
                <input type="hidden" value="<?php echo $day ?>" name="day" />
                <input type="hidden" value="<?php echo $adults ?>" name="adults" />
                <input type="hidden" value="<?php echo $children ?>" name="children" />

                <div style="margin-top:2rem;" id="payment-wrapper">
                    <input type="submit" class="payment-button disabled" id="payment-button" value="Confirmar pagamento">
                </div>
            </div>
        </form>
    </div>
    <div class="side-content">
        <div class="cart-info">
            <h3 class="cart-info-title">A sua reserva</h3>
            <div class="cart-info-tour"><?= $row['name'] ?></div>
            <table>
                <tbody>
                    <tr>
                        <td>Adultos X <?= $adults ?></td>
                        <td><?= $totalAdults ?>€</td>
                    </tr>
                    <?php if ($children > 0) { ?>
                        <tr>
                            <td>Crianças X <?= $children ?></td>
                            <td><?= $totalChildren ?>€</td>
                        </tr>
                    <?php } ?>
                    <!--<tr>
                            <td>Subtotal:</td>
                        </tr>-->
                    <tr>
                        <td>Total</td>
                        <td><?= $total ?>€</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="contact-info">
            <h3 class="contact-info-title">Alguma pergunta?</h3>
            <div class="contact-info-text">Não exite em contactar-nos, ficamos contentes em ajudar</div>
            <div class="contact-phone"><i class="contact-icon fa fa-phone"></i><a href="tel:+351 916 541 852">+351 916 541 852</a></div>
            <div class="contact-email"><i class="contact-icon fa fa-envelope"></i><a href="mailto:adayinporto@gmail.com">adayinporto@gmail.com</a></div>
        </div>
    </div>

</section>

<script>
    var Error = document.getElementById('error');

    var cardNumberInput = document.getElementById('card-number-input');

    cardNumberInput.addEventListener('input', function() {
        this.value = this.value.replace(/\D/g, '');
        this.value = formatCardNumber(this.value);
        this.value = this.value.slice(0, 19);

        if (this.value.length === 19) {
            Error.textContent = '';
            this.style.border = '1px solid #40bf64';
        }
        validateForm();
    });


    var validityInput = document.getElementById('validity-input');
    var monthYearRegex = /^(0[1-9]|1[0-2])(\/(\d{0,2}))?$/;

    validityInput.addEventListener('input', function(event) {
        var keyCode = event.which || event.keyCode;
        var isBackspace = keyCode === 8;

        this.value = this.value.replace(/\D/g, '');
        this.value = formatValidity(this.value);
        this.value = this.value.slice(0, 5);

        if (!isBackspace && this.value.length >= 5) {
            var match = this.value.match(monthYearRegex);
            if (match) {
                var month = parseInt(match[1], 10);
                var year = match[3] ? parseInt(match[3], 10) : null;
                var currentYear = new Date().getFullYear() % 100;
                var currentMonth = new Date().getMonth() + 1;

                if (year !== null && (year < currentYear || (year === currentYear && month < currentMonth))) {
                    validityInput.setCustomValidity('');
                    Error.textContent = 'A data deve ser futura.';
                    this.style.border = '1px solid #e51b15';
                } else {
                    validityInput.setCustomValidity('');
                    Error.textContent = '';
                    this.style.border = '1px solid #40bf64';
                }
            } else {
                validityInput.setCustomValidity('Formato inválido (MM/AA)');
                Error.textContent = 'Formato inválido (MM/AA)';
            }
        } else {
            validityInput.setCustomValidity('');
            Error.textContent = '';
        }
        validateForm();
    });


    var cardNumberInput = document.getElementById('card-number-input');
    var cvvInput = document.getElementById('cvv-input');
    var validityInput = document.getElementById('validity-input');
    var paymentButton = document.getElementById('payment-button');

    cvvInput.addEventListener('input', function() {
        this.value = this.value.replace(/\D/g, '');
        this.value = this.value.slice(0, 3);

        if (this.value.length > 3) {
            Error.textContent = '';
            this.style.border = '1px solid #40bf64';
        }
        validateForm();
    });


    cardNumberInput.addEventListener('blur', function() {
        if (this.value.length < 19) {
            Error.textContent = 'Número do cartão inválido.';
            this.style.border = '1px solid #e51b15';
        } else {
            Error.textContent = '';
            this.style.border = '1px solid #40bf64';
        }
        validateForm();
    });

    cvvInput.addEventListener('blur', function() {
        if (this.value.length < 3) {
            Error.textContent = 'CVV inválido.';
            this.style.border = '1px solid #e51b15';
        } else {
            Error.textContent = '';
            this.style.border = '1px solid #40bf64';
        }
        validateForm();
    });

    validityInput.addEventListener('blur', function() {
        var value = this.value.trim();
        if (value.length < 5) {
            Error.textContent = 'Data de validade inválida.';
            this.style.border = '1px solid #e51b15';
        }
        validateForm();
    });

    function formatCardNumber(value) {
        var formattedValue = value.replace(/\s/g, '').replace(/(\d{4})/g, '$1 ');
        return formattedValue.trim();
    }

    function formatValidity(value) {
        var formattedValue = value.replace(/(\d{2})(\d{0,2})/, '$1/$2');
        return formattedValue.trim();
    }

    function validateForm() {
        if (
            cardNumberInput.value.length === 19 &&
            cvvInput.value.length >= 3 &&
            validityInput.value.length >= 5
        ) {
            paymentButton.disabled = false;
            paymentButton.classList.remove('disabled');
        } else {
            paymentButton.disabled = true;
            paymentButton.classList.add('disabled');
        }
    }
</script>