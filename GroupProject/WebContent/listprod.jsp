<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<title>NeXt list of Products </title>


<style>
body{
background-color:#012839; 
}
h1{
color: white;
}

a {
	-moz-box-shadow:inset 0px -3px 7px 0px #29bbff;
	-webkit-box-shadow:inset 0px -3px 7px 0px #29bbff;
	box-shadow:inset 0px -3px 7px 0px #29bbff;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #2dabf9), color-stop(1, #0688fa));
	background:-moz-linear-gradient(top, #2dabf9 5%, #0688fa 100%);
	background:-webkit-linear-gradient(top, #2dabf9 5%, #0688fa 100%);
	background:-o-linear-gradient(top, #2dabf9 5%, #0688fa 100%);
	background:-ms-linear-gradient(top, #2dabf9 5%, #0688fa 100%);
	background:linear-gradient(to bottom, #2dabf9 5%, #0688fa 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#2dabf9', endColorstr='#0688fa',GradientType=0);
	background-color:#2dabf9;
	-moz-border-radius:3px;
	-webkit-border-radius:3px;
	border-radius:3px;
	border:1px solid #0b0e07;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	padding:0px 22px;
	text-decoration:none;
	text-shadow:0px 1px 0px #263666;
}
a:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #0688fa), color-stop(1, #2dabf9));
	background:-moz-linear-gradient(top, #0688fa 5%, #2dabf9 100%);
	background:-webkit-linear-gradient(top, #0688fa 5%, #2dabf9 100%);
	background:-o-linear-gradient(top, #0688fa 5%, #2dabf9 100%);
	background:-ms-linear-gradient(top, #0688fa 5%, #2dabf9 100%);
	background:linear-gradient(to bottom, #0688fa 5%, #2dabf9 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#0688fa', endColorstr='#2dabf9',GradientType=0);
	background-color:#0688fa;
}
a:active {
	position:relative;
	top:1px;
}



table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
    align:"center";
}
tr:nth-child(even) {
    background-color: 	#B0C4DE;
    color: black;
     
    
}
tr:nth-child(odd) {
    background-color: #4682B4;
    color: white;
}

}
</style>
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
<a alt="Reset" class="a">Reset</a>

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
					"</td> <td><a href=\"prodInfo.jsp?id="+pId+" \"> "+ pName+"</a> </td><td>"+pPrice+"</td> </tr>");
			//out.println(""); prodInfo.jsp?
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
						"</td> <td><a href=\"prodInfo.jsp?id="+pId+" \"> "+ pName+"</a> </td><td>"+pPrice+"</td> </tr>");
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
					"</td> <td><a href=\"prodInfo.jsp?id="+pId+" \"> "+ pName+"</a> </td><td>"+pPrice+"</td> </tr>");
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
			
			//out.println("<tr> <td> <a href=\"addcart.jsp?id="+pId+"&name="+pName+"&price="+pPrice2+" \">add to cart</a> "+
			//			"</td> <td>"+pName+"</td><td>"+pPrice+"</td> </tr>");
			out.println("<tr> <td> <a href=\"addcart.jsp?id="+pId+"&name="+pName+"&price="+pPrice2+" \">add to cart</a> "+
					"</td> <td><a href=\"prodInfo.jsp?id="+pId+" \"> "+ pName+"</a> </td><td>"+pPrice+"</td> </tr>");
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