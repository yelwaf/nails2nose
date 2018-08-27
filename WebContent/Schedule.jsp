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
	<input id="address" type="textbox">
	<button id="submitter">Distance</button>
	<div id="output"></div>
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
</body>
</html>