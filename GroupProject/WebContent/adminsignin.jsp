<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Login</title>
</head>
<body>
<center>
<h1> Enter Admin ID and Password </h1>
<%
if (session.getAttribute("LoginMessage") != null)
	out.println("<p>" + session.getAttribute("LoginMessage").toString() +"</p>");
%>
<br>
<form name="Login from" method =post action="ValidateLogin.jsp" >
<table width="50%" border="0" cellspacing="0" cellpadding="0" >
<tr> 
<td> <div align="right">Admin ID:    </div> </td>
<td> <input type="text" name="userId" size=10 maxlength=10> </td>
</tr>

<tr>
<td> <div align="right">Password:    </div></td>
<td> <input type="password" name="password" size=10 maxlength=10> </td>
</tr>
</table>
<input class="submit" type="submit" name="sub" value="Log in">
</form>
<br>
</center>
</body>
</html>