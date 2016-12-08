<%@page import="javax.swing.table.TableModel"%>
<%@page import="java.awt.Window"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.haiduong.gaeapplication.Greeting" %>
<%@ page import="com.haiduong.gaeapplication.PMF" %>

<html>
<head>
<title>Map</title>
<link type="text/css" rel="stylesheet" href="login.css">
<style type="text/css">
div#map_container{
	width:100%;
	height:350px;
}
</style>
<script type="text/javascript"
   src="http://maps.googleapis.com/maps/api/js?sensor=false&language=vi&key=AIzaSyCygRXb-HJURc5BaMAcdBXrf_q1va_Q2pc"></script>

<script type="text/javascript">
  function loadMap() {
	  var lat = 21.005792, longi = 105.8415023;
    var latlng = new google.maps.LatLng(lat, longi);
    var latlng2 = new google.maps.LatLng(21.005389, 105.8416928);
    var myOptions = {
      zoom: 16,
      center: latlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(document.getElementById("map_container"),myOptions);
    var image = {
    	    url: "/Support/Arrow-Down.ico",
  		  size: new google.maps.Size(71, 71),
		  origin: new google.maps.Point(0, 0),
		  anchor: new google.maps.Point(17, 34),
		  scaledSize: new google.maps.Size(30, 30) 
    	  };
    var image2 = {
    		  url: "/Support/Alert.ico",
    		  size: new google.maps.Size(71, 71),
    		  origin: new google.maps.Point(0, 0),
    		  anchor: new google.maps.Point(17, 34),
    		  scaledSize: new google.maps.Size(35, 35)
    		};
    var marker = new google.maps.Marker({
      position: latlng,
      map: map,
      title:"C9!",
    });
   
    var marker2 = new google.maps.Marker({
        position: latlng2,
        draggable: true,
        animation: google.maps.Animation.DROP,
        icon: image2,
        map: map,
        title:"C92"
      });

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
<div id="map_container" style="height:500px; width:980px">
	
</div>
</body> 

</html>