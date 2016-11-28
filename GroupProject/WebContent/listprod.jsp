<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<title>NeXt list of Products </title>
</head>
<body>

<h1>Search for the products you want to buy:</h1>

<form method="get" action="listprod.jsp">
<p align="left">
  <select size="1" name="categoryName">
  <ins> PCategory</ins>
  <optgroup label="Product Category"></optgroup>
  <option value ="All">All</option>
  <option value ="Hard Drives">Hard Drives</option>
  <option value="RAM" >RAM</option>
  <option value ="Mice">Mice</option>
  <option value="Keyboards">Keyboards</option>
  <option value="Monitors">Monitors</option>
  <option value="Laptops">Laptops</option>

<input type="text" name="productName" size="50">
</select>
<input type="image" alt="Submit" src="cartLogo.png" style="width:51px;height:51px;border:0;">
<input type="image" alt="Reset" src="resetButton.jpg" style="width:100px;height:51px;border:0;">

</form>

<% // Get product name to search for
String name = request.getParameter("productName");
String category = request.getParameter("categoryName");

boolean hasNameP = name != null && !name.equals("");
boolean hasCategoryP = category != null && !category.equals("") && !category.equals("All");

/*Integer qty = Integer.parseInt(request.getParameter("Quantity").toString());
<input type="text" name="Quantity" size="50"><input type="submit" value="Submit">
*/
		
// Variable name now contains the search string the user entered
// Use it to build a query and print out the resultset.  Make sure to use PreparedStatement!

// Make the connection
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
	//String sql2 = "SELECT pName, price, pID FROM Part";
	PreparedStatement pstmt = null;
	ResultSet rset =null;
	String pName=null;
	String pId =null;
	String pPrice=null;
	String pPrice2 =null;
	String sql =null;
	//String pTest = "5";
	if(hasNameP && hasCategoryP){
		sql = "SELECT pName, price, pID FROM Part, PartCategory WHERE Part.catID=Partcategory.catID AND catName LIKE ? AND pName LIKE ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,category);
		pstmt.setString(2,name);
		rset = pstmt.executeQuery();
		out.println("Parts in the category: \"" + category + "\" Containing \""+ name + "\" ");
		out.println("<table width=\"100%\"><tr> <th> </th> <th> Product name</th> <th>Price</th></tr>");
		while(rset.next()){
			pName =rset.getString("pName");
			pId =rset.getString("pID");
			pPrice =currFormat.format(rset.getDouble("price"));
			pPrice2 =rset.getDouble("price")+""; //CHANGE TO STRING
			//pPrice2.substring(0, 2);
			
			out.println("<tr> <td> <a href=\"addcart.jsp?id="+pId+"&name="+pName+"&price="+pPrice2+" \">add to cart</a> "+
						"</td> <td><a href=\"prodInfo.jsp?id="+pName+" </a></td><td>"+pPrice+"</td> </tr>");
			//out.println("");
	}
	out.println("</table>");
	}else if(hasNameP){
		sql = "SELECT pName, price, pID FROM Part WHERE pName LIKE ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,"%"+name+"%");
		rset = pstmt.executeQuery();
		out.println("Products countaining " + "'"+name+"'");
		out.println("<table width=\"100%\"> <tr><th></th><th>Product name</th> <th>Price</th></tr>");
			while(rset.next()){
				pName =rset.getString("pName");
				pId =rset.getString("pID");
				pPrice =currFormat.format(rset.getDouble("price"));
				pPrice2 =rset.getDouble("price")+"";
				//pPrice2.substring(0, 2);
				out.println("<tr> <td> <a href=\"addcart.jsp?id="+pId+"&name="+pName+"&price="+pPrice2+" \">add to cart</a> "+
						"</td> <td>"+pName+"</td><td>"+pPrice+"</td> </tr>");
		}
		out.println("</table>");
	}else if(hasCategoryP){
		sql = "SELECT pName, price, pID FROM Part, PartCategory WHERE Part.catID=Partcategory.catID AND catName LIKE ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,category);
		rset = pstmt.executeQuery();
		out.println("Parts in the category: " + category);
		out.println("<table width=\"100%\"><tr> <th> </th> <th> Product name</th> <th>Price</th></tr>");
		while(rset.next()){
			pName =rset.getString("pName");
			pId =rset.getString("pID");
			pPrice =currFormat.format(rset.getDouble("price"));
			pPrice2 =rset.getDouble("price")+""; //CHANGE TO STRING
			//pPrice2.substring(0, 2);
			
			out.println("<tr> <td> <a href=\"addcart.jsp?id="+pId+"&name="+pName+"&price="+pPrice2+" \">add to cart</a> "+
						"</td> <td>"+pName+"</td><td>"+pPrice+"</td> </tr>");
			//out.println("");
	}
	out.println("</table>");
	}else{
	sql = "SELECT pName, price, pID FROM Part";
	pstmt = con.prepareStatement(sql);
	//pstmt.setString(1,name);
	rset = pstmt.executeQuery();
	out.println(" All Parts ");
	out.println("<table width=\"100%\"><tr> <th> </th> <th> Product name</th> <th>Price</th></tr>");
		while(rset.next()){
			pName =rset.getString("pName");
			pId =rset.getString("pID");
			pPrice =currFormat.format(rset.getDouble("price"));
			pPrice2 =rset.getDouble("price")+""; //CHANGE TO STRING
			//pPrice2.substring(0, 2);
			
			out.println("<tr> <td> <a href=\"addcart.jsp?id="+pId+"&name="+pName+"&price="+pPrice2+" \">add to cart</a> "+
						"</td> <td>"+pName+"</td><td>"+pPrice+"</td> </tr>");
			//out.println("");
	}
	out.println("</table>");
	}
	}catch(SQLException e){out.println("Error found in reading SQL: "+ e.getMessage());}
	finally {
		if(con != null)
		try{
		con.close();
		}catch(SQLException e) {out.println("Exception caught: " + e.getMessage());}
	}
	
// Print out the ResultSet

// For each product create a link of the form
// href = "addcart.jsp?id=<productId>&name=<productName>&price=<productPrice>"

// Close connection

// Useful code for formatting currency values:
// NumberFormat currFormat = NumberFormat.getCurrencyInstance();
// out.println(currFormat.format(5.0);	// Prints $5.00
%>

</body>
</html>