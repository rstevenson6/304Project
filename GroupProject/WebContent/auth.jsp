
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%
Object authUser = session.getAttribute("authenticatedUser");
boolean authenticated = authUser ==null ? false : true;

if(!authenticated){
	String loginMessage = "you have not been authenticated to view this page";
	session.setAttribute("LoginMessage",loginMessage);
	response.sendRedirect("login.jsp");
	return;
}

//REMOVED: <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
//pageEncoding="ISO-8859-1" % >
%>
</head>
<body>

</body>
</html>