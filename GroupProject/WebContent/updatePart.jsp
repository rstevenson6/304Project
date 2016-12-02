<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>

<%
// Get the current list of products
HashMap productList = (HashMap) session.getAttribute("productList");

if (productList == null)
{	out.println("No products");
	productList = new HashMap();
}


// Read parameters
String id = request.getParameter("id");
String qty = request.getParameter("qty");

out.println("ID: "+id);

// Update quantity for product selected
if (productList.containsKey(id)) 
{ // find item in shopping cart
	ArrayList product = (ArrayList) productList.get(id);
	product.set(3, (new Integer(qty))); 	// change quantity to new quantity
}

session.setAttribute("productList", productList);
%>

<!--
<jsp:forward page="showcart.jsp" />
-->





