<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<title>Your Shopping Cart</title>
</head>
<body>

<%
// Get the current list of products
@SuppressWarnings({"unchecked"})
HashMap<String, ArrayList<Object>> productList = (HashMap<String, ArrayList<Object>>) session.getAttribute("productList");
ArrayList partArr = new ArrayList();
String id = request.getParameter("delete");
String update = request.getParameter("update");
String newqty = request.getParameter("newqty");


if (productList == null)
{	out.println("<H1>Your shopping cart is empty!</H1>");
	productList = new HashMap<String, ArrayList<Object>>();
}
else
{
	NumberFormat currFormat = NumberFormat.getCurrencyInstance();
	
	if(id != null && (!id.equals(""))) {
		if(productList.containsKey(id)) {
			productList.remove(id);
		}
	}
	
	if(update != null && (!update.equals(""))) {
		if (productList.containsKey(update)) { // find item in shopping cart
			partArr = (ArrayList) productList.get(update);
			partArr.set(3, (new Integer(newqty))); // change quantity to new quantity
		}
		else {
			productList.put(id,partArr);
		}
	}

	out.println("<h1>Your Shopping Cart</h1>");
	out.print("<table><tr><th>Product Id</th><th>Product Name</th><th>Quantity</th>");
	out.println("<th>Price</th><th>Subtotal</th></tr>");

	int count = 0;
	double total =0;
	Iterator<Map.Entry<String, ArrayList<Object>>> iterator = productList.entrySet().iterator();
	while (iterator.hasNext()) 
	{	count++;
		Map.Entry<String, ArrayList<Object>> entry = iterator.next();
		ArrayList<Object> product = (ArrayList<Object>) entry.getValue();
		out.print("<tr><td>"+product.get(0)+"</td>");
		out.print("<td>"+product.get(1)+"</td>");

		out.print("<TD ALIGN=CENTER><INPUT TYPE=\"text\" name=\"newqty"+count+"\" size=\"3\" value=\""
				+product.get(3)+"\"></TD>");
		//out.print("<td align=\"center\">"+product.get(3)+"</td>");
		double pr = Double.parseDouble( (String) product.get(2));
		int qty = ( (Integer)product.get(3)).intValue();

		out.print("<td align=\"right\">"+currFormat.format(pr)+"</td>");
		out.print("<td align=\"right\">"+currFormat.format(pr*qty)+"</td></tr>");
		// allow the customer to delete items from their shopping cart click here
			out.println("<TD>&nbsp;&nbsp;&nbsp;&nbsp;<A HREF=\"showcart.jsp?delete="
						+product.get(0)+"\">Remove Item from Cart</A></TD>");
			out.println("<TD>&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE=BUTTON OnClick=\"update("
					+product.get(0)+", document.form1.newqty"+ count +".value)\" VALUE=\"Update Quantity\">"); 
			
		out.println("</tr>");
		total = total +pr*qty;
	}
	out.println("<tr><td colspan=\"4\" align=\"right\"><b>Order Total</b></td>"
			+"<td align=\"right\">"+currFormat.format(total)+"</td></tr>");
	out.println("</table>");

	out.println("<h2><a href=\"Login.jsp\">Check Out</a></h2>"); //CHANGED to allow for login
}
	out.println("<h2><a href=\"listprod.jsp\">Continue Shopping</a></h2>");
	session.setAttribute("productList", productList);
%>

</body>
</html> 

