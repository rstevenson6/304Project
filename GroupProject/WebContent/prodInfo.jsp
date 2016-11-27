<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.ArrayList"%>
<%
// Get the current list of products
@SuppressWarnings({"unchecked"})

String id = request.getParameter("id");
String url = "jdbc:sqlserver://sql04.ok.ubc.ca:1433;DatabaseName=db_dkandie;";
String uId = "dkandie";
String pw = "32056153";
Connection con=null;
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); //To ensure that the Driver is found 
//out.println("About to begin try statement");
try{
NumberFormat currFormat = NumberFormat.getCurrencyInstance();
//Class.forName("com.sql.jdbc.Driver");
con = DriverManager.getConnection(url,uId,pw);
String sql1 = "SELECT pID, photo, pName, company, description, price, pRating FROM Part WHERE pID = " + id + ";";
PreparedStatement pstmt = null;
ResultSet rset =null;

int pId=0;
String pic = null;
String pName=null;
String company = null;
String desc =null;
String price=null;
double rating=0;

pstmt = con.prepareStatement(sql1);
rset = pstmt.executeQuery();

while(rset.next()){
pId =rset.getInt("pID");
pic =rset.getString("photo");
pName =rset.getString("pName");
company =rset.getString("company");
desc=rset.getString("description");
price =currFormat.format(rset.getDouble("price"));
rating=rset.getDouble("pRating");
}

System.out.print(pId);
}catch(SQLException e){out.println("Error found in reading SQL: "+ e.getMessage());}
finally {
	if(con != null)
	try{
	con.close();
	}catch(SQLException e) {out.println("Exception caught: " + e.getMessage());}
}



%>
