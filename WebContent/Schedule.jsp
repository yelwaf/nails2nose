<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Schedule</title>
<link rel="stylesheet" type="text/css"  href="css/Master.css" />
<link rel="stylesheet" type="text/css"  href="css/Schedule.css" />
</head>


<body onload="initialize()">
	 <%@ include file='navigation.html'  %>
	 <div id="transparent">
	 <div>
	 	<div class="sitting">
	 		Address:<br>
			<input id="address" type="textbox">
			<button id="submitter">Distance</button>
			<div id="output"></div><br><br>
			<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAyJgEVMSFrK2-bqjD5tu6kiTiwxcR65Cw&callback=initMap">
		    </script>
			<script type="text/javascript">
		    var geocoder;
		    var map;
		    var service;
		    var didClickIt = false;
		        document.getElementById("submitter").addEventListener("click",function(){
		            didClickIt = true;
		        });
		
		        setInterval(function(){
		            // this is the closest you get to an infinite loop in JavaScript
		            if( didClickIt ) {
		                didClickIt = false;
		            
		                var o=document.getElementById("output"),v=document.getElementById("address").value;
		
			            geocoder.geocode( { 'address': v}, function(results, status) {
		                       if (status == 'OK') {	              
		                          var x=results[0].geometry.location;
				           	   	  var destinationA = x;
				           		  var origin1 = {lat:33.6152126, lng:-112.25393309999998};
				           	        service.getDistanceMatrix({
				           	          origins: [origin1],
				           	          destinations: [destinationA],
				           	          travelMode: 'DRIVING',
				           	          unitSystem: google.maps.UnitSystem.IMPERIAL,
				           	          avoidHighways: false,
				          			}, function(response, status) {
				          				 var results = response.rows[0].elements;
				           	          if (status !== 'OK') {
				           	            alert('Error was: ' + status);
				           	          } else {
				           	        	o.textContent=results[0].distance.text;
				           	          }
				          			});
				           	        
		                       }   
		                    });                       
		            		}
			            },500);
		        
		        function initialize() {
		          geocoder = new google.maps.Geocoder();
		          service = new google.maps.DistanceMatrixService;
		        }
		        
		        
		        function initMap() {
		            var map = new google.maps.Map(document.getElementById('map'), {
		              zoom: 16,
		              center: {lat: 33.615, lng: -112.253},
		              mapTypeControl: true,
		              mapTypeControlOptions: {
		                style: google.maps.MapTypeControlStyle.DROPDOWN_MENU,
		                mapTypeIds: ['roadmap', 'terrain']
		              }
		            });
		          }
		    </script>
		    Quantity:<br>
	    	<input type="number" name="quantity" min="1" max="20"><br><br>
	    	Animal Types:<br>
	    	<form>
			  <input type="checkbox" name="animal1" value="dog"> Dog<br>
			  <input type="checkbox" name="animal2" value="cat"> Cat<br> 
			  <input type="checkbox" name="animal3" value="bird"> Bird<br> 
			  <input type="checkbox" name="animal4" value="reptile"> Reptile<br> 
			  <input type="checkbox" name="animal5" value="aquatic"> Aquatic<br> 
			  <input type="checkbox" name="animal6" value="other"> Other<br>  
			  <input type="textbox">
			</form><br><br>
			Other:<br>
			<form>
			  <input type="radio" name="living" value="stay" checked> Stay in Home<br>
			  <input type="radio" name="living" value="visit"> Just Visiting<br>
			</form><br><br>
			Special Notes:<br>
			<input type="text" id="specialnote">
    </div>
   </div>
  </div>
</body>
</html>