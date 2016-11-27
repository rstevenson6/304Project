<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<title>NeXt Order List</title>
</head>
<body>

<h1 align = "center">Order List</h1>

<%
// Useful code for formatting currency values:
// NumberFormat currFormat = NumberFormat.getCurrencyInstance();
// out.println(currFormat.format(5.0));  // Prints $5.00

// Make connection
//Connection con = null;
	String url = "jdbc:sqlserver://sql04.ok.ubc.ca:1433;DatabaseName=db_dkandie;";
	String uId = "dkandie";
	String pw = "32056153";
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); //To ensure that the Driver is found 
NumberFormat currFormat = NumberFormat.getCurrencyInstance();

try{
	Connection con = DriverManager.getConnection(url,uId,pw);
	String sql1 = "SELECT orderId, Orders.customerId, cname, totalAmount"
				+" FROM Orders, Customer"
				+" WHERE Orders.customerId=Customer.customerId";
	String sql2 = "SELECT orderId, productId, quantity, price"
				+" FROM OrderedProduct"
				+" WHERE orderId LIKE ?";
	PreparedStatement pstmt = con.prepareStatement(sql1);
	PreparedStatement pstmt2 = con.prepareStatement(sql2);
	ResultSet rset1 = pstmt.executeQuery();
	ResultSet rset2 = null;
	out.println("<table align = \"center\" border=\"2\" ><tr> <th>Order ID</th><th> Customer ID</th> <th>Customer name</th> <th>Total ammount</th>");
	//above changed, border included
	while(rset1.next()){
	out.println("<tr> <td>"+rset1.getInt("orderId")
				+"</td> <td>" +rset1.getInt("customerId")
				+"</td> <td>"+rset1.getString("cname")
				+"</td> <td>"+currFormat.format(rset1.getDouble("totalAmount"))
				+" </td> </tr> ");
	//out.println("</table>");
	//out.println(" <table><tr><th> Product ID</th> <th>Quantity</th> <th>Price</th>");
	out.println(" <tr align=\"right\"><td colspan =\"4\"> <table border =\"1\">"
					+"<tbody> <tr><th> Product ID</th> <th>Quantity</th> <th>Price</th>");// NEW code 
	pstmt2.setInt(1,rset1.getInt("orderId"));
	rset2 = pstmt2.executeQuery();
	while(rset2.next()){
	out.println("<tr> <td>"+ rset2.getString("productId")+"</td> <td>"+rset2.getString("quantity")+"</td> "+"<td>"+
			currFormat.format(rset2.getDouble("price"))+"</td></tr>");
	// NEW code
	}
	out.println("</tbody> </table> </td> </tr>"); // NEW code
	}
	out.println("</table>");
	
}catch(SQLException e){ System.out.println(e.getMessage()); }
// Write query to retrieve all order headers

// For each order in the ResultSet

	// Print out the order header information
	// Write a query to retrieve the products in the order
	//   - Use a PreparedStatement as will repeat this query many times
	// For each product in the order
		// Write out product information 

// Close connection
%>

</body>
</html>

