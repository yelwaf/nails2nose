<%@ page import="javax.servlet.*,java.io.UnsupportedEncodingException,java.util.Properties,javax.mail.PasswordAuthentication,java.security.Security,java.util.Date,java.util.Properties,javax.mail.Message,javax.mail.MessagingException,javax.mail.Session,javax.mail.Transport,javax.mail.internet.AddressException,javax.mail.internet.InternetAddress,javax.mail.internet.MimeMessage,java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<?xml version="1.0" encoding="ISO-8859-1" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page errorPage='ErrorPage.jsp' %>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>Beeline Pest Control - Contact Result</title>

<link rel="stylesheet" href="css/stylesheet.css" />
<link rel="stylesheet" href="css/default.css" />

<link rel="shortcut icon" href="images/shared/favicon.ico" type="image/x-icon">
<link rel="icon" href="images/shared/favicon.ico" type="image/x-icon">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<script type="text/javascript" src="js/googleanalytics.js"></script>
<%!
	boolean errorFlag = false;

public void sendMail(HttpServletRequest request) {

    String Fr = "notify@beeline-pestcontrol.com";

    String To = "ozlo3@msn.com";
    //String To = "glennfawley@hotmail.com"; 

    String Bcc = "glennfawley@gmail.com";
    String SMTPhost = "localhost";

    try {
	    Properties props = new Properties();
	    props.put("mail.smtp.host", SMTPhost);
	    Session s = Session.getInstance(props,null);
	
	    MimeMessage message = new MimeMessage(s);
	
	    InternetAddress from = new InternetAddress(Fr);
	    message.setFrom(from);
	    
	    InternetAddress to = new InternetAddress(To);
	    InternetAddress bcc = new InternetAddress(Bcc);
	    
	    message.addRecipient(Message.RecipientType.TO, to);
	    message.addRecipient(Message.RecipientType.BCC, bcc);

        String name = request.getParameter("contactname");
        message.setSubject("*** New Contact: "+ name +" Beeline-PestControl.com Contact Request Form");
        message.setText("This message was sent from:" + "\n" +
        	"http://www.beeline-pestcontrol.com/contactus.html"	 + "\n" +
        	"------------------------------------------------------------" 	 + "\n" +
        	"Name:  " + request.getParameter("contactname") 	 + "\n" +
        	"Email: " + request.getParameter("contactemail") 	 + "\n" +
        	"Phone: " + request.getParameter("contactphone") 	 + "\n" +
        	"------------------------------------------------------------" 	 + "\n\n" +
        	request.getParameter("contactmessage") 	 + "\n\n" +
        	"------------------------------------------------------------");
	
	    Transport.send(message);
    
	} catch (MessagingException e) {
		errorFlag=true;
	    //throw new RuntimeException(e);
	}
}
%>

<% 
errorFlag = false;
sendMail(request); 
%>

</head>

<body >

<div id="banner">
	<%@ include file='../webparts/TitleBanner.html' %>
</div>

<div id="navigation">
	<%@ include file='../webparts/Navigation.jsp' %>
</div>

<center>
<div id="home" >

 	<div id="behind">	 
		<div id="mainarea">	
		  <div id="maincontent">
			<br />
<%=  errorFlag ?  			
        "<br><font color='FF0000'>We're sorry.  There was a problem sending your email to <b>Beeline Pest Control</font></b>.&nbsp;<br><br><br><br>" +
		"<p/>" +
		"<center><b><h2>Please check your email address is correct or call 309.828.7330 to schedule an appointment!</h2></b></center>" +
		"<br /><br /><br /><p/>"
	:
	            "<br><center><h2><i>Thank you for your interest in Beeline Pest Control.</i></h2><br><br><br><b>You can expect to be contacted within 24 hours.</center><b>&nbsp;<br><br>" +
				"<br /><br /><p/>"
	
%>
		  </div>
		</div>
 
 	 	
	 </div>
</div>
</center>

<div>
	<%@ include file='../webparts/CopyRight.html'%>
</div>

</body>
</html>