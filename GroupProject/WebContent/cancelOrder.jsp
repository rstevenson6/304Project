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


<h5>How dare you cancel an order</h5>
<p>you little bitch? I’ll have you know I graduated top of my class in the Navy Seals, and I’ve been</p>
 <p>involved in numerous secret raids on Al-Quaeda, and I have over 300 confirmed kills. </p>
 <p>I am trained in gorilla warfare and I’m the top sniper in the entire US armed forces. </p>
 <p>You are nothing to me but just another target. I will wipe you the fuck out with precision the likes of which has never been seen before on this Earth, mark my fucking words. </p>
 <p>You think you can get away with saying that shit to me over the Internet? Think again, fucker. </p>
<p> As we speak I am contacting my secret network of spies across the USA and your IP is being traced right now so you better prepare for the storm, maggot. </p>
 <p>The storm that wipes out the pathetic little thing you call your life. </p>
 <p>You’re fucking dead, kid. I can be anywhere, anytime, and I can kill you in over seven hundred ways, and that’s just with my bare hands. </p>
<p> Not only am I extensively trained in unarmed combat, but I have access to the entire arsenal of the United States Marine Corps and</p> 
<p> I will use it to its full extent to wipe your miserable ass off the face of the continent, you little shit. If only you could have known what unholy retribution your </p>
<p> little “clever” comment was about to bring down upon you, maybe you would have held your fucking tongue. But you couldn’t, you didn’t, and now you’re paying the price, you goddamn idiot. </p>
<p> I will shit fury all over you and you will drown in it. You’re fucking dead, kiddo.</p>




</BODY>
</HTML>


