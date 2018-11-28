
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
  body {font-family: Arial, Helvetica, sans-serif;}
  * {box-sizing: border-box;}

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

  input[type=text]:focus, select:active, select:hover{
    background-color: #ddd;
    outline: none;
  }

  label {
    display: inline-block;
    width: 140px;
    text-align: left;
  }​

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

<form>
  <div class="container">
    <label for="Name"><b>Name:</b></label>
    <input type="text" placeholder="" name="name" maxlength="30" required>
    <br/>
    <label for="Address"><b>Address:</b></label>
    <input type="text" placeholder="" name="address" maxlength="30" required>
    <br/>
    <label for="Card"><b>Card Type:</b></label>
    <select required>
      <option value="American Express">American Express</option>
      <option value="VISA">VISA</option>
      <option value="Mastercard">Mastercard</option>
    </select>
      <br>
      <label for="Card Number"><b>Card Number:</b></label>
      <input type="text" placeholder="" name="cardNumber"  class="js-cardNumber" maxlength="20"  placeholder="Card Number"  required>

      <br/>
    <br/>
    <label for="Expiry Date"><b>Expiry Date:</b></label>
    <input type="text" placeholder="" name="expiryDate" class="js-date"   placeholder="MM / YYYY" maxlength="7" required>

    <br/>
    <label for="CVV Code:"><b>CVV Code:</b></label>
    <input type="text" placeholder="" name="cvvCode" maxlength="4" required>

    <br/>
    <label for="Amount"><b>Amount:</b></label>
    <input type="text" placeholder="" name="amount" maxlength="10"  required>

    <br/>



    <br><br>
    <input type="submit" value="Submit" id="submit">
    <input type="submit" value="Reset" id="reset">

<br>


  </div>
</form>
</body>

</html>





<script>
    var input_Date = document.querySelectorAll('.js-date')[0];
    var input_Cardnumber = document.querySelectorAll('.js-cardNumber')[0];
    var dateInputMask = function dateInputMask(elm) {
        elm.addEventListener('keypress', function(e) {
            if(e.keyCode < 47 || e.keyCode > 57) {
                e.preventDefault();
            }

            var len = elm.value.length;

            // If we're at a particular place, let the user type the slash
            // i.e., 12/12/1212
            if(len !== 1 || len !== 3) {
                if(e.keyCode == 47) {
                    e.preventDefault();
                }
            }

            // If they don't add the slash, do it for them...
            if(len === 2) {
                elm.value += '/';
            }
        });
    };

    var dateInputMask_CardNo = function dateInputMask_CardNo(elm) {
        elm.addEventListener('keypress', function(e) {
            var len = elm.value.length;


            // If they don't add the slash, do it for them...
            if(len%5 === 0) {
                elm.value += ' ';
            }
        });
    };

    dateInputMask(input_Date);
    dateInputMask_CardNo(input_Cardnumber);


    function myFunction() {
        document.getElementById("reset").reset();
    }


</script>













