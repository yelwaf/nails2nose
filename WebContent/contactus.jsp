<?xml version="1.0" encoding="ISO-8859-1" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page errorPage='ErrorPage.jsp' %>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>Beeline Pest Control - Contact Info</title>
<!-- InstanceEndEditable -->
<meta charset="utf-8">

<meta name="description" content="How to contact Beeline Pest Control.">
<meta name="keywords" content="Beeline Pest Control, Beeline, Pest, Control, Exterminator, Pest Control, Termite, Termite Inspection, Inspection, contact, hours, phone, directions, Bugs, Ants, Bees, Bed Bugs, Specialist, Bloomington, Normal, Central, Illinois, Bloomington Illinois, Normal Illinois, Central Illinois, McLean, residential, commercial, Termidor, certified, professional,">
<link rel="stylesheet" href="css/effects/skewbackward.css" />
<link rel="stylesheet" href="css/stylesheet.css" />
<link rel="stylesheet" href="css/default.css" />

<link rel="shortcut icon" href="images/shared/favicon.ico" type="image/x-icon">
<link rel="icon" href="images/shared/favicon.ico" type="image/x-icon">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<script type="text/javascript" src="js/googleanalytics.js"></script>
<script type="text/javascript">
function sendMail(event){

	var contactname = document.forms["contactform"]["contactname"].value;
    var contactemail = document.forms["contactform"]["contactemail"].value;
    var contactphone = document.forms["contactform"]["contactphone"].value;
    var contactmessage = document.forms["contactform"]["contactmessage"].value;
    
//	alert(name);
    
    var jspcall = new String("email.jsp?contactname=" + contactname + "&contactemail=" + contactemail + "&contactphone=" + contactphone   + "&contactmessage=" + contactmessage);
//    var jspcall = new String("email/email.jsp?name=" & name & "&emailAddr=" & emailAddr & "&mssg=" & mssg);

//	alert(jspcall);

    window.location.href = jspcall;
    
}
</script>													

</head>

<body >

<div id="banner">
	<%@ include file='webparts/TitleBanner.html' %>
</div>
 
<div id="navigation">
	<%@ include file='webparts/Navigation.jsp' %>
</div>

<center>
<div id="home" >

 	<div id="behind">	 
		<div id="mainarea">	
		  <div id="maincontent">
			<br />
			<center><h2>Contact <i>Beeline Pest Control</i> for the best pricing!</h2></center>
			<br />
            <form id="contactform" action="javascript:sendMail();" method="post" style="float:left;margin-right:60px;">
            	<b><u>Send us an email:</u></b>
            	<br/>
            	<br/>
              	<div class="clabel">Name:<br/>
                  <input required autofocus placeholder=" John Q Public" name="name" type="text" id="contactname">
				</div>
				<br/>
                <div class="clabel">Email:<br/>                
                  <input required placeholder=" addr@domain.com" name="email" type="text" id="contactemail">
                </div>
				<br/>
                <div class="clabel">Phone:<br/>              
                  <input required name="phone" placeholder=" (###) ###-####" type="text" id="contactphone">
                </div>
				<br/>
                <div class="clabel">Message:<br/> 
                <textarea id="message" rows="3" name="contactmessage"></textarea></div>

                <div class="clear"> </div>
                <div class="btns"><br />
                  <span class="fright">
                  <input name="submit" type="image" class="button" id="submit" value="Submit" src="images/contactus/submit.png" >
                </span></div>
          </form>

<div style="float:right;margin-left:30px;">

            	<b><u>Get Directions:</u></b>
            	<br/><br/>
   <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3034.901182854517!2d-88.98232879999999!3d40.47745109999992!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x880b71cd8866b933%3A0xf67a363a2ecd4ff9!2s206+S+Robinson+St!5e0!3m2!1sen!2sus!4v1396917364834" width="300" height="225" frameborder="0" style="border:0"></iframe>  

				
</div>
			<div style="float:none;">
				<b><u>Location:</u></b>
				<br /><p/>
					206 S. Robinson<br/>
					Bloomington, IL 61701
				<br />
				<img class="skew-backward" alt="Beeline Pest Control vehicle" src="images/contactus/truck.png" style="width=150px;height:104px;" />
				<br /><p/>
				<b><u>Business hours:</u></b>
				<br /><br /><p/>
					Monday - Friday <br/>8:00am - 5:00pm
				<br /><br /><p/>
					<u>After hours</u><br/>Send an email or call!
				<br />
				
				
				
				<br /><br /><br /><br />
			</div>
		  </div>
		</div>
 
 	 	
	 </div>
</div>
</center>

<div>
	<%@ include file='webparts/CopyRight.html'%>
</div>

</body>
</html>