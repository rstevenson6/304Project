<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<title>Create User </title>
<link rel="stylesheet" type="text/css" href="main.css">
</head>
<body>

<h1>Please enter the following information</h1>

// form method may be post and not get

<form method="get" action="createUser.jsp">
First Name
<input type="text" name="fname" size="50">
Last Name
<input type="text" name="lname" size="50">
User Name
<input type="text" name="uID" size="50">
Password
<input type="text" name="pass" size="50">
Email Address
<input type="text" name="email" size="50">
Street Address
<input type="text" name="addr" size="50">
City
<input type="text" name="city" size="50">
Province
<input type="text" name="prov" size="50">
Postal Code
<input type="text" name="pcode" size="50">

<input type="submit" value="Submit"><input type="reset" value="Reset"> 

</form>

<%
	
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); //To ensure that the Driver is found	

String fname = request.getParameter("fname");
String lname = request.getParameter("lname");
String uID = request.getParameter("uID");
String pass = request.getParameter("pass");
String email = request.getParameter("email");
String addr = request.getParameter("addr");
String city = request.getParameter("city");
String prov = request.getParameter("prov");
String pcode = request.getParameter("pcode");

String sql = "";

//if user ID already exists ask again

//else
	sql = "INSTER INTO Customer VALUES (?,?,?,?,?,?,?,?,?)";

// Make the connection
	String url = "jdbc:sqlserver://sql04.ok.ubc.ca:1433;DatabaseName=db_dkandie;";
	String uId = "dkandie";
	String pw = "32056153";
	Connection con=null;

	try 
	{
		con = DriverManager.getConnection(url, uid, pw);
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(uID,pass,fname,lname,email,addr,city,prov,pcode);
		
		
		
		
		
	}
	catch (SQLException ex) 
	{
		out.println(ex);
	} 
	finally 
	{
		try 
		{
			if (con != null)
				con.close();
		} 
		catch (SQLException ex) 
		{
			out.println(ex);
		}

	
%>
</body>
</html>