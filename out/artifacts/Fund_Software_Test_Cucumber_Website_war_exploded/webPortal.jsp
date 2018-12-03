<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    body {
        font-family: Arial, Helvetica, sans-serif;
    }

    * {
        box-sizing: border-box;
    }

    /* Add padding to containers */
    .container {
        padding: 16px;
        background-color: white;
    }

    /* Full-width input fields */
    input[type=text], select {
        padding: 15px;
        margin: 5px 0 22px 0;
        display: inline-block;
        border: 1px solid #111111;
        background: #ffff;
    }

    input[type=text]:focus, select:active, select:hover {
        background-color: #ddd;
        outline: none;
    }

    label {
        display: inline-block;
        width: 140px;
        text-align: left;
    }

    ​
    hr {
        border: 1px solid #f1f1f1;
        margin-bottom: 25px;
    }

    .btn {
        background-color: #4CAF50;
        color: white;
        padding: 16px 20px;
        margin: 8px 0;
        border: none;
        cursor: pointer;
        width: 100%;
        opacity: 0.9;
    }

    .btn:hover {
        opacity: 1;
    }
</style>

<html>
<head>
    <title>Tutorial Assignment Demo</title>
</head>
<body>
<h3>Payment Processing Form</h3>
<hr>
<h1>WEB PORTAL</h1>
<form action="./webPortal" method="post">
    <div class="container">
        <label for="Name"><b>Name:</b></label>
 <input type="text" placeholder="" id="name" name="name" maxlength="30" required
                     oninvalid="this.setCustomValidity('Please enter name')"
                     oninput="this.setCustomValidity('')">
        <br/>
        <label for="Address"><b>Address:</b></label>
       <input type="text" placeholder="" id="address" name="address" maxlength="30" required
                       oninvalid="this.setCustomValidity('Please enter address')"
                       oninput="this.setCustomValidity('')">
        <br/>
        <label for="card_type"><b>Card Type:</b></label>
       <select required id="card_type" name = "card_type">
        <option value="American Express">American Express</option>
        <option value="VISA">VISA</option>
        <option value="Mastercard">Mastercard</option>
    </select>
        <br>
        <label for="card_number"><b>Card Number:</b></label>
       <input type="text" placeholder="" id="card_number" name ="card_number"class="js-cardNumber" maxlength="20"
                            placeholder="Card Number" required
                            oninvalid="this.setCustomValidity('Please enter card number')"
                            oninput="this.setCustomValidity('')">

        <br/>
        <br/>
        <label for="expiry_date"><b>Expiry Date:</b></label>
      <input type="text" placeholder="" id="expiry_date" name = "expiry_date" class="js-date" placeholder="MM / YYYY"
                            maxlength="7" required oninvalid="this.setCustomValidity('Please enter expiry date')"
                            oninput="this.setCustomValidity('')">

        <br/>
        <label for="cvv_code"><b>CVV Code:</b></label>
       <input type="text" placeholder="" id="cvv_code" name = "cvv_code" maxlength="3" required
                         oninvalid="this.setCustomValidity('Please enter CVV code')"
                         oninput="this.setCustomValidity('')">

        <br/>
        <label for="Amount"><b>Amount:</b></label>
       <input type="text" placeholder="" id="amount" name="amount" maxlength="10" required
                       oninvalid="this.setCustomValidity('Please enter amount')"
                       oninput="this.setCustomValidity('')">
        <br/>

        <br><br>
        <input type="submit" value="Submit" id="submit">
        <input type="reset" value="Reset" id="reset">

        <h3 style="color:red" > ${errorMessage} <h3/>
        <h3 style="color:blue;">${successMessage} </h3>
        <br>
                <% String message = (String)request.getAttribute("alertMsg");%>
    </div>
</form>
</body>

</html>


<script>
    var input_Date = document.querySelectorAll('.js-date')[0];
    var input_Cardnumber = document.querySelectorAll('.js-cardNumber')[0];
    var dateInputMask = function dateInputMask(elm) {
        elm.addEventListener('keypress', function (e) {
            if (e.keyCode < 47 || e.keyCode > 57) {
                e.preventDefault();
            }

            var len = elm.value.length;

            // If we're at a particular place, let the user type the slash
            // i.e., 12/12/1212
            if (len !== 1 || len !== 3) {
                if (e.keyCode == 47) {
                    e.preventDefault();
                }
            }

            // If they don't add the slash, do it for them...
            if (len === 2) {
                elm.value += '/';
            }
        });
    };

    var dateInputMask_CardNo = function dateInputMask_CardNo(elm) {
        elm.addEventListener('keypress', function (e) {
            var len = elm.value.length;


            // If they don't add the slash, do it for them...
            if (len % 5 === 0) {
                elm.value += ' ';
            }
        });
    };

    dateInputMask(input_Date);
    dateInputMask_CardNo(input_Cardnumber);



</script>

<script type="text/javascript">
    var msg = "<%=message%>";
    if(msg !=="null"){
        alert(msg);
    }
</script>









