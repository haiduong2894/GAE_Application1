<%@page import="com.haiduong.gaeapplication.DataSensor"%>
<%@page import="javax.swing.table.TableModel"%>
<%@page import="java.awt.Window"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.haiduong.gaeapplication.Gateway.Node" %>
<%@ page import="com.haiduong.gaeapplication.PMF" %>

<html>
<head>
<title>Map</title>
<link type="text/css" rel="stylesheet" href="login.css">
<script type="text/javascript" src="mapTools.jsp"></script>
<style type="text/css">
div#map_container{
	width:100%;
	height:350px;
}
</style>
<script async defer type="text/javascript"
   src="http://maps.googleapis.com/maps/api/js?sensor=false&language=vi&key=AIzaSyCygRXb-HJURc5BaMAcdBXrf_q1va_Q2pc&callback=loadMap"></script>

<script type="text/javascript">
var markers = [];
var map;
var poly;


	var lat8 = 21.005792, longi8 = 105.8380023;
	var lat9 = 21.005792, longi9 = 105.8420023;
	var lat0 = 21.005792, longi0 = 105.8430023;
	var lat1 = 21.005792, longi1 = 105.8440023;
	var lat2 = 21.005792, longi2 = 105.8450023;
	var lat3 = 21.005792, longi3 = 105.8460023;
	var lat4 = 21.005792, longi4 = 105.8470023;
	
	var latlng0 = new google.maps.LatLng(lat0, longi0);
	var latlng4 = new google.maps.LatLng(lat1, longi1);
	var latlng5 = new google.maps.LatLng(lat2, longi2);
	var latlng6 = new google.maps.LatLng(lat3, longi3);
	var latlng7 = new google.maps.LatLng(lat4, longi4);
	var latlng8 = new google.maps.LatLng(lat8, longi8);
	var latlng9 = new google.maps.LatLng(lat9, longi9);
    var positions = [latlng0,latlng4,latlng5,latlng6,latlng7,latlng9,latlng8];
    
	//var map = new google.maps.Map(document.getElementById("map_container"),myOptions);
 	function loadMap() {
	  var lat = 21.005792, longi = 105.8415023;
    var latlng = new google.maps.LatLng(lat, longi);
    var latlng2 = new google.maps.LatLng(21.005389, 105.8416928);
    var myOptions = {
      zoom: 16,
      center: latlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }; 
    
    poly = new google.maps.Polyline({
        strokeColor: '#000000',
        strokeOpacity: 1.0,
        strokeWeight: 3
      });
    poly.setMap(map);
    
    map = new google.maps.Map(document.getElementById("map_container"),myOptions);
    var image = {
    	    url: "/Support/Arrow-Down.ico",
  		  size: new google.maps.Size(71, 71),
		  origin: new google.maps.Point(0, 0),
		  anchor: new google.maps.Point(17, 34),
		  scaledSize: new google.maps.Size(40, 40) 
    	  };
    var image2 = {
    		  url: "/Support/Alert.ico",
    		  size: new google.maps.Size(71, 71),
    		  origin: new google.maps.Point(0, 0),
    		  anchor: new google.maps.Point(17, 34),
    		  scaledSize: new google.maps.Size(35, 35)
    		};
    var contentString = '<div id="content">'+
    '<div id="siteNotice">'+
    '</div>'+
    '<h1 id="firstHeading" class="firstHeading">Uluru</h1>'+
    '<div id="bodyContent">'+
    '<p><b>Uluru</b>, also referred to as <b>Ayers Rock</b>, is a large ' +
    'sandstone rock formation in the southern part of the '+
    'Northern Territory, central Australia. It lies 335&#160;km (208&#160;mi) '+
    'south west of the nearest large town, Alice Springs; 450&#160;km '+
    '(280&#160;mi) by road. Kata Tjuta and Uluru are the two major '+
    'features of the Uluru - Kata Tjuta National Park. Uluru is '+
    'sacred to the Pitjantjatjara and Yankunytjatjara, the '+
    'Aboriginal people of the area. It has many springs, waterholes, '+
    'rock caves and ancient paintings. Uluru is listed as a World '+
    'Heritage Site.</p>'+
    '<p>Attribution: Uluru, <a href="https://en.wikipedia.org/w/index.php?title=Uluru&oldid=297882194">'+
    'https://en.wikipedia.org/w/index.php?title=Uluru</a> '+
    '(last visited June 22, 2009).</p>'+
    '</div>'+
    '</div>';
    
    var marker, i;
    var infowindow = new google.maps.InfoWindow();
    var locations = [
                     ['Sensor 1', 21.005792,105.8410023],
                     ['Sensor 2', 21.005792,105.8420023],
                     ['Sensor 3', 21.005792,105.8430023],
                     ['Sensor 4', 21.005792,105.8440023],
                     ['Sensor 5', 21.005792,105.8450023],
                     ['Sensor 6', 21.005792,105.8460023],
                     ['Sensor 7', 21.005792,105.8470023],
                     [contentString, 21.005792, 105.8480023]
                   ]; 
    ///////////////////////
    <%
    PersistenceManager pm = PMF.get().getPersistenceManager();
    String query = "select from " + Node.class.getName();
    List<Node> nodes = (List<Node>) pm.newQuery(query).execute();
    for (Node nd : nodes){
    %>
    	var lat = <%=nd.getLat()%>, lng = <%=nd.getLng()%>;
    <% 
    	if(nd.getActive()) {
    		//create marker active
    %>
    		marker = new google.maps.Marker({
    		    position: new google.maps.LatLng(lat, lng),
    		    animation: google.maps.Animation.DROP,
    		    map: map
    		});
    	  
    	  	google.maps.event.addListener(marker, 'click', (function(marker, i) {
    		    return function() {
    		  	  infowindow.setContent('<div style="width:100%;height:100%;overflow:hidden">' +
    		                '<p>Sensor'+<%=nd.getMac()%>+'</p>' + '<p>Nhiet Do:'+<%=nd.getTemHum(nd.getMac(), "tem")%> +'</p>' +
    		                '<p>Do Am:'+<%=nd.getTemHum(nd.getMac(), "hum")%> +'</p>' +
    		                '<p><form action="/command" method="get"><button id="getbtn" name="commandMap" value="0002000$" ">Get Temperature/Humidity</button></form></p>'+
    		                '<p><button id="showbtn" onclick="" ">Show/Hide Image</button></p>'+
    		                '<p><img id="test" height="100" src = "/Support/jiyeon1.jpg" /></p> '+
    		                '</div>');
    		      //infowindow.setContent(locations[i][0]);
    		      infowindow.open(map, marker);
    		      map.setZoom(16);
    		      map.setCenter(marker.getPosition());
    	    	}
    	  	})(marker, i));
    	  
    		google.maps.event.addListener(marker, 'rightclick', (function(marker, i) {
    		  return function() {
    		    infowindow.setContent(locations[i][0]);
    		    infowindow.open(map, marker);
    		  }
    		})(marker, i)); 
    <%
    	}
    	else{//creat marker sleep
    %>
		    marker = new google.maps.Marker({
			    position: new google.maps.LatLng(lat, lng),
			    animation: google.maps.Animation.DROP,
			    icon: image,
			    map: map
			});
		  
		  	google.maps.event.addListener(marker, 'click', (function(marker, i) {
			    return function() {
			  	  infowindow.setContent('<div style="width:100%;height:100%;overflow:hidden">' +
			                '<p>Sensor'+<%=nd.getMac()%>+'</p>' + '<p>Temperature: '+<%=nd.getTemHum(nd.getMac(), "tem")%> +'</p>' +
			                '<p>Humidity: '+<%=nd.getTemHum(nd.getMac(), "hum")%> +'</p>' +
			                '<p><form action="/command" method="get"><button id="getbtn" name="commandMap" value="0002000$" ">Get Temperature/Humidity</button></form></p>'+
			                '<p><button id="showbtn" onclick="" ">Show/Hide Image</button></p>'+
			                '<p><img id="test" height="100" src = "/Support/jiyeon1.jpg" /></p> '+
			                '</div>');
			      //infowindow.setContent(locations[i][0]);
			      infowindow.open(map, marker);
			      map.setZoom(16);
			      map.setCenter(marker.getPosition());
		    	}
		  	})(marker, i));
		  
			google.maps.event.addListener(marker, 'rightclick', (function(marker, i) {
			  return function() {
			    infowindow.setContent(locations[i][0]);
			    infowindow.open(map, marker);
			  }
			})(marker, i)); 
    <%
    	}
    }
    %>
    ////////////////////////////////////////////////////
    
    ////create markers and references
    /* for (i = 0; i < locations.length; i++) {  
      marker = new google.maps.Marker({
        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
        animation: google.maps.Animation.DROP,
        map: map
      });
      
      google.maps.event.addListener(marker, 'click', (function(marker, i) {
          return function() {
        	  infowindow.setContent('<div style="width:100%;height:100%;overflow:hidden">' +
                      '<p>Sensor mac '+'</p>' + '<p>Nhiet Do: temp ' +'</p>' +
                      '<p>Do Am: hum' +'</p>' +
                      '<p><form action="/command" method="get"><button id="getbtn" name="commandMap" value="0002000$" ">Get Temperature/Humidity</button></form></p>'+
                      '<p><button id="showbtn" onclick="" ">Show/Hide Image</button></p>'+
                      '<p><img id="test" height="100" src = "/Support/jiyeon1.jpg" /></p> '+
                      '</div>');
            //infowindow.setContent(locations[i][0]);
            infowindow.open(map, marker);
            map.setZoom(16);
            map.setCenter(marker.getPosition());
          }
      })(marker, i));
      
      google.maps.event.addListener(marker, 'rightclick', (function(marker, i) {
        return function() {
          infowindow.setContent(locations[i][0]);
          infowindow.open(map, marker);
        }
      })(marker, i));
    } */
   
    var marker7 = new google.maps.Marker({
        position: latlng2,
        draggable: true,
        animation: google.maps.Animation.DROP,
        icon: image2,
        map: map,
        title:"C92"
      });
   
    //add Listener click on map
    map.addListener('click', addLatLng);
    
//     map.addListener('click', function(event) {
//         //addMarker(event.latLng);
//         addLatLng();
//         //infowindow.setContent('Anh Duong chua viet');
//       }); 
}
///end load()
 
 function gotoLocation( lat, lng, zoom )
   {/* 
   	 var map = new google.maps.Map(document.getElementById("map_container"),myOptions); */
       map.setCenter( new google.maps.LatLng( lat, lng ) );
       map.setZoom(zoom);
   }
 function Warn() {
        var retVal = confirm("Do you want to continue ?");
        if( retVal == true ){
           alert ("User wants to continue!");
           return true;
        }
        else{
        	alert ("User does not want to continue!");
           return false;
        }
  }
 
//Sets the map on all markers in the array.
 function setMapOnAll(map) {
     for (var i = 0; i < markers.length; i++) {
       markers[i].setMap(map);
     }
   }
//Removes the markers from the map, but keeps them in the array.
 function clearMarkers(i) {
   setMapOnAll(null);
 }
 // Shows any markers currently in the array.
 function showMarkers() {
   setMapOnAll(map);
 }
 //
 function deleteMarkers(i) {
   setMapOnAll(map);
 }
//Adds a marker to the map and push to the array
 function addMarker(location) {
     	marker = new google.maps.Marker({
       	position: location,
       	map: map
     });
     markers.push(marker);
   }
//Deletes all markers in the array by removing references to them.
 function deleteMarkers() {
   clearMarkers();
   markers = [];
 } 
 
 //adds a new point to the Polyline.
 function addLatLng(event) {
     var path = poly.getPath();
     
     // Because path is an MVCArray, we can simply append a new coordinate
     // and it will automatically appear.
     path.push(event.latLng);

     // Add a new marker at the new plotted point on the polyline.
     marker = new google.maps.Marker({
       position: event.latLng,
       title: '#' + path.getLength(),
       map: map       
     });
     markers.push(marker);
   }
 function addMarkerHD(mac, lat, lng, temp, hum)
 {
     infowindow = new google.maps.InfoWindow({
           content:" "
           });
     if (mac<10) mac="0"+mac;
     var marker = new google.maps.Marker({
         position: new google.maps.LatLng( lat, lng),
         map: map,
         optimized: false
       });
     marker.addListener('click', function() {
         map.setZoom(19);
         map.setCenter(marker.getPosition());
       });
     //style="visibility: hidden;"
     google.maps.event.addListener(marker, 'rightclick', function() {
             infowindow.setContent('<div style="width:100%;height:100%;overflow:hidden">' +
                  '<p>Sensor '+ mac +'</p>' + '<p>Nhiet Do: '+ temp +'</p>' +
                  '<p>Do Am: '+ hum +'</p>' +
                  '<p><button id="showbtn" onclick="ShowImage()">Show/Hide Image</button></p>'+
                  '<p><img id="test" height="100" src = "http://lab411s.esy.es/sg/camerasensor_'+mac+'.jpg" /></p> '+
                  '</div>'
                  );
           infowindow.open(map,marker);
           });
     markers.push(marker);
 }
</script>
 <h1 align="center">WSAN LAB411 - Gateway App Engine!</h1>
</head> 

<body id="Header" onload="loadMap()">
<%
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
    if (user != null) {
%>
<p>Hello, <%= user.getNickname() %>! (You can
<a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">sign out</a>.)</p>
<%
    } else {
%>
<p>Hello!
<a href="<%= userService.createLoginURL(request.getRequestURI()) %>">Sign in</a>
to include your name with greetings you post.</p>
<%
    }
%>
	<div><address>Address: Nguyen Hai Duong Lab411</address></div>

	<div class = "tabPage"> <ul>
			<li><a id="Main"  href="gae_application1?id=Main">Main Page</a></li> 
			<li><a id="Map"  href="gae_application1?id=Map">Map</a></li>
			<li><a id="Report" href="gae_application1?id=Report">Reports</a></li>
			<li><a id="About"href="gae_application1?id=About">About</a></li>
		</ul>
	</div>
<div style="height:30px; width:980px">	<button type="button" value="Gotomarker" onclick="Warn()">Gotomarker</button></div>
<div id="map_container" style="height:500px; width:980px">	
</div>
<div><input>Gi vay</div>
</body> 

</html>