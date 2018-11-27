<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: Owner
  Date: 11/22/2018
  Time: 12:33 PM
  To change this template use File | Settings | File Templates.
--%>
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
    <input type="text" placeholder="" name="name" required>
    <br/>
    <label for="Address"><b>Address:</b></label>
    <input type="text" placeholder="" name="address" required>
    <br/>
    <label for="Card"><b>Card Type:</b></label>
    <select>
      <option value="American Express">American Express</option>
      <option value="VISA">VISA</option>
      <option value="Mastercard">Mastercard</option>
    </select>
    <br/>
    <label for="Expiry Date"><b>Expiry Date:</b></label>
    <input type="text" placeholder="" name="expiryDate" required>

    <br/>
    <label for="CVV Code:"><b>CVV Code:</b></label>
    <input type="text" placeholder="" name="cvvCode" required>

    <br/>
    <label for="Amount"><b>Amount:</b></label>
    <input type="text" placeholder="" name="amount" required>

    <br/>

    <label for="Amount"><b>Amount:</b></label>
    <input type="text" placeholder="" name="amount" required>

    <br/>

    <br><br>
    <input type="submit" value="Submit">
    <input type="submit" value="Reset">


  </div>

  <%
    Date date = new Date();
    out.print("<h2>" + date.toString() + "</h2>");


  %>
</form>
</body>
</html>
