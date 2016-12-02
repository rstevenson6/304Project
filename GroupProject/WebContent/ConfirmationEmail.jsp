<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="javax.mail.*,java.util.Properties,javax.mail.internet.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Send email</title>
</head>
<body>
<%
// This class send an e-mail message to an address provided as a parameter
// Get e-mail parameter from request
/* removed for testing
String email = request.getParameter("email");
if (email == null)
{	out.println("No e-mail address provided.  Mail not sent.");
	return;  // Error
}
*/

try
{
// Setup basic e-mail session
Properties props = new Properties();
String myHost = "localhost";
//String myHost = "sql04.ok.ubc.ca"; //"localhost";
//String uId = "dkandie";
//String pw = "32056153";
props.put("mail.smtp.host", myHost);
//props.put("mail.smtp.port", 1433);
//props.put("mail.smtp.auth", "true");
//props.put("mail.smtp.starttls.enable", "true");
/* Authenticator auth = new Authenticator() {
    public PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication("dkandie","32056153"); 
    }
}; 
*/
Session mailSession = Session.getDefaultInstance(props, null);

// Create a new e-mail message
MimeMessage message = new MimeMessage(mailSession);

// Set the subject line
message.setSubject("Test Message from JSP");

// Set the text
String myText = "This is an example message from JSP.\nPlease do not respond to it.";
message.setText(myText);

// Set the FROM address line.  Note: This could be anything.  It does NOT have to be real in general.
// However, the UBC mail server will reject many addresss that do not appear local.
Address address = new InternetAddress("danielkandie@yahoo.com", "Daniel Kandie"); 
message.setFrom(address);

// Optional: Add multiple from addresses
//Address[] fromAddress = new Address[2];
//fromAddress[0] = address;
//fromAddress[1] = new InternetAddress("anyoneelse@a.com", "Anyone"); 
//message.addFrom(fromAddress);

// Set to TO address line.  This should be real if you want it delivered. CHANGE to email
Address toAddress = new InternetAddress("danielkandie@yahoo.com");
message.addRecipient(Message.RecipientType.TO, toAddress);

// Optional: Add an address to CC line
//Address ccAddress = new InternetAddress("mytest@abc.com");
//message.addRecipient(Message.RecipientType.CC, ccAddress);

// Basic version for now sending the e-mail
Transport.send(message);

// Optional: More complicated version that actually connects to the server
//message.saveChanges(); // implicit with send()
//Transport transport = session.getTransport("smtp");
//transport.connect(host, username, password);
//transport.sendMessage(message, message.getAllRecipients());
//transport.close();

//out.println("E-mail sent to address: "+email);
}
catch(Exception e)
{	out.println("Error: "+e);
}
%>

</body>
</html>

