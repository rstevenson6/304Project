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

<style>

</style>
</head>
<body>

<%@ include file="auth.jsp" %>


<h4 align="left">

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

String sql = "SELECT oID, itemTotal FROM Orders WHERE uID LIKE "+ Integer.parseInt(custId);
PreparedStatement psmt = con.prepareStatement(sql);
ResultSet rset = psmt.executeQuery();

while(rset.next()){
	out.println("<br><h2><a href=\"listprod.jsp\">Order#" + rset.getString(1) + ": total price $" + rset.getString(2) + "</a></h2>");
	out.println("<TD>&nbsp;&nbsp;&nbsp;&nbsp;<A HREF=\"cancelOrder.jsp?delete="
			+rset.getString(1)+"\">Cancel this order</A></TD>");
}


}catch(SQLException e){out.println("SQL Exception");}
%> 
</h4>




</BODY>
</HTML>


