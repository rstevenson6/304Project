<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<title>NeXt User Profile</title>
<link rel="stylesheet" type="text/css" href="main.css">
<style>

</style>
</head>
<body>

<%@ include file="auth.jsp" %>


<h4 align="center">

<% 
// Get customer id
//String custId = request.getParameter("customerId"); //Removed for login page test
String custId = session.getAttribute("authenticatedUser").toString();
@SuppressWarnings({"unchecked"})
HashMap<String, ArrayList<Object>> productList = (HashMap<String, ArrayList<Object>>) session.getAttribute("productList");



Connection con = null;
String url = "jdbc:sqlserver://sql04.ok.ubc.ca:1433;DatabaseName=db_dkandie;";
String uId = "dkandie";
String pw = "32056153";
//out.println("TESTING HERE "); 
try{ con = DriverManager.getConnection(url,uId,pw);

String sql = "SELECT firstName, lastName FROM Customer WHERE uID LIKE "+ Integer.parseInt(custId);
PreparedStatement psmt = con.prepareStatement(sql);
ResultSet rset = psmt.executeQuery();

while(rset.next()){
	out.println("Welcome to NeXt " + rset.getString(1) + " " + rset.getString(2)+ " have a nice day.");
}
}catch(SQLException e){out.println("nope");}
%> 
</h4>

<h4 align="center"><a href="order.jsp">Your orders</a></h4>
<h4 align="center"><a href="changeOrder.jsp">Change shipping address</a></h4>
<h4 align="center"><a href="cancelOrder.jsp">Cancel order</a></h4>



</BODY>
</HTML>
