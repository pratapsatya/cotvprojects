<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking Details Page</title>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
input[type=text], select, textarea {
    width: 100%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    margin-top: 6px;
    margin-bottom: 16px;
    resize: vertical;
}
input[type=number], select, textarea {
    width: 100%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    margin-top: 6px;
    margin-bottom: 16px;
    resize: vertical;
}
input[type=submit] {
    background-color: #4CAF50;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
input[type=submit]:hover {
    background-color: #45a049;
}
.container {
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 20px;
}
</style>
</head>
<body>
<form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

<a onclick="document.forms['logoutForm'].submit()">Logout</a>
<form method="POST" action="${contextPath}/ticketconfirmation" >
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
<h3>Passenger Details</h3>

<div class="container">
 
    <label for="fname" >First Name</label>
    <input type="text" id="fname" name="firstname" placeholder="Your name.." onfocus="myFunction()" required>

    <label for="lname">Last Name</label>
    <input type="text" id="lname" name="lastname" placeholder="Your last name.." required>

    <label for="age">age</label>
    <input type="number" id="age" name="age" placeholder="Your age........." required>
    <select id="berth">
    
  <option value="volvo">upper berth</option>
  <option value="saab">lower berth</option>
  
</select>
  Window Seat:<input type="checkbox" id="myCheck"><br><br>
  
  Card Details
  <input type="text" id="accnum" name="accnum" placeholder="Your card number.." required>
  <input type="number" id="csv" name="csv" placeholder="csv.." required>
<input type="month" id="expiry" name="expiry" placeholder="mm/yyyy" required>  
<input type="hidden" name="trainId" id="trainid">
    <input type="submit" value="Confirm Booking" >
 
</div>
<p id="error"></p>

</form>
<script>
function myFunction(){
	document.getElementById("trainid").value=localStorage.trainId;}
	</script>
</body>
</html>