<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" import="java.io.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%
String authenticatedUser = null;
session = request.getSession(true);

try{
	authenticatedUser = validateLogin2(out,request,session);
	
}catch(IOException e){
	System.err.println(e);
}

if(authenticatedUser != null){
	response.sendRedirect("Admin.jsp");
}else{
	session.setAttribute("LoginMessage", "Failed Login. Kindly try again");
	response.sendRedirect("adminsignin.jsp");
}
%>


<%!
String validateLogin2(JspWriter out, HttpServletRequest request, HttpSession session) throws IOException{
	/*
	String userId = request.getParameter("userId");
	String password = request.getParameter("password");
	if (userId==null || password==null)
		return null;
	if((userId.length()==0) ||(password.length()==0))
		return null;
	if(toInt(userId)==null)
		return null;
	*/
	/*
	if (userId.equals("test") && password.equals("test"))
		return userId;
	else
		return null;
	*/
	 
	/*
	//Login using Database 
		java.sql.Connection con = null; 
		String url = "jdbc:sqlserver://sql04.ok.ubc.ca:1433;DatabaseName=db_dkandie;";
		String uId = "dkandie";
		String pw = "32056153";
	try{ 
		con = DriverManager.getConnection(url,uId,pw);
		String sql = "SELECT password FROM Customer WHERE uID = ? ";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1,toInt(userId));
		ResultSet rset = pstmt.executeQuery();
		if(rset.next()){
		//if(password.equals(rset.getString("password")) && rset.getInt("accessLevel")==0){ //ADD check for admin 
		if(password.equals(rset.getString("password"))){
			session.removeAttribute("LoginMessage");
			session.setAttribute("authenticatedUser", userId);
			return userId;
		}else{
			//session.setAttribute("LoginMessage", "Failed Login. Kindly try again");
			return null;
		}
		}else{
			//out.println("error1"); 
		return null;
		} 
		

		
	}catch(SQLException e){out.println(e);}
	finally{
			try{ 
				if(con!=null)
				con.close();
				out.print("Found error, went to finally clause");
		}catch (SQLException e){ out.println("SQL exception 2: " + e.getMessage());}
	}
	//}catch(IOException e){out.println("error in Validate user " + e.toString());}
	//	out.println( }
	//return null;
	return null;
	*/
	return "0"; //for testing 
	}
	
	
Integer toInt(String s){
	try{
	return Integer.parseInt(s);
	}catch(NumberFormatException e){
		return null;
	}
}
%>
