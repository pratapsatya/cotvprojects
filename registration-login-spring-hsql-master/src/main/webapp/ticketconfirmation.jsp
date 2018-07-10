<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "db_example";
String userId = "lahari";
String password = "Satya977";
 String num=request.getParameter("trainId"); 
String fname=request.getParameter("firstname");
String lname=request.getParameter("lastname");
String age=request.getParameter("age");
int id=Integer.parseInt(num);
try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

<a onclick="document.forms['logoutForm'].submit()">Logout</a>
<h3></h3>
<table align="center" cellpadding="5" cellspacing="5" border="1" id="mytable">

<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM trains where trains_id="+id;


resultSet = statement.executeQuery(sql);

while(resultSet.next()){
	int i=0;
%>
<tr>
<td>First Name:</td><td><%=fname %></td></tr>
<tr><td>Last Name:</td><td><%=lname %></td></tr>
<tr><td>Age:<td><%=age %></td></tr>
<tr><td>Train Number:</td><td><%=resultSet.getString("trainnumber") %></td></tr>
<tr><td>Source:</td><td><%=resultSet.getString("source") %></td></tr>
<tr><td>Destination:</td><td><%=resultSet.getString("destination") %></td></tr>
<tr><td>Train Name:</td><td><%=resultSet.getString("trainname") %></td></tr>
<tr><td>Timings:</td><td><%=resultSet.getString("timings") %></td></tr>
<tr><td>Seat Number:</td><td>10</td></tr>
<% 
}

} catch (Exception e) {  
e.printStackTrace();
}
%>
</table>
<br>
<br>
<a href="/welcome">Book a return ticket</a>

<script type="text/javascript">
function myFun(){
	
}</script>
</body>
</html>