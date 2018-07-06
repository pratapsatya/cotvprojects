<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Create an account</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="container">

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

        <h2>Welcome ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a></h2>
         <table>
<tr>
<td>From:</td><td><input list="places" id="source" name="place"><datalist id="places">
    <option value="Hyderabad">
    <option value="Tirupathi">
    <option value="Vijayawada">
    <option value="Shirdi">
    <option value="Kurnool">
    <option value="chennai">
    <option value="bangalore">
  </datalist>
  </input>
</select>
            </td>
            </tr>
            <tr>
<td>To:</td><td><input list="places1" id="destiny" name="place1"><datalist id="places1">
    <option value="Hyderabad">
    <option value="Tirupathi">
    <option value="Vijayawada">
    <option value="Shirdi">
    <option value="Kurnool">
    <option value="chennai">
    <option value="bangalore">
  </datalist></input>
            </td>
</tr>
<tr>
<td><select>
  <option value="roundtrip">roundtrip</option>
  <option value="oneway">oneway</option>
</select></td>
</tr>
<tr>
<td><input type="date" id="myDate" value="2014-02-09"></td>
</tr>

         </table> 
    </c:if>

</div>
<button onclick="myFunction()">Click me</button>
<p id="error">
</p>
<!-- /container -->
<script>
function myFunction() {
	  var s=document.getElementById("source");
	  var d=document.getElementById("destiny");
	  document.getElementById("error").innerHTML="the source is"+s.value;
		  
	  if(s.equals(d))
		 document.getElementById("error").innerHTML="source and destination cant be same"; 
	  if(s==d)
			 document.getElementById("error").innerHTML="source and destination cant be same1";
	  if(s!=d)
			 document.getElementById("error").innerHTML="source and destination are not same"; 
	  
	  document.getElementById("error").innerHTML="source and destination cant be same para";
	}
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
