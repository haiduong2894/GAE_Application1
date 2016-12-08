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
<%@ page import="com.haiduong.gaeapplication.Gateway_Shared" %>

<html>
   <%
   // Get current time
   Calendar calendar = new GregorianCalendar();
   String am_pm;
   int hour = calendar.get(Calendar.HOUR);
   int minute = calendar.get(Calendar.MINUTE);
   int second = calendar.get(Calendar.SECOND);
   if(calendar.get(Calendar.AM_PM) == 0)
      am_pm = "AM";
   else
      am_pm = "PM";
   String CT = hour+":"+ minute +":"+ second +" "+ am_pm;
%>     
 <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <link type="text/css" rel="stylesheet" href="login.css">
    <title>HaiDuong</title>    
   <!-- <h1 align="center" style="bottom: 100%"><img src="fightGhost.jpg"></h1> --> 
    <h1 align="center">WSAN LAB411 - Gateway App Engine!</h1>
 </head>
    
<body id="Header">
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
	<div id="address"><address>Address: Nguyen Hai Duong Lab411 <%=   CT%></address></div>
	<section>
       <div tabindex="0">
         <button>Main</button>
         <p>Main
         
         </p>
       </div>
       <div tabindex="0">
         <button>Map</button>
         <p>Map
         
         </p>
       </div>
       <div tabindex="0">
         <button>Report</button>
         <p>Report
         
         </p>
       </div>
       <div tabindex="0">
         <button>About</button>
         <p>About Content</p>
       </div>
    </section>
	<div class = "tabPage"> <ul>
			<jsp:include page="login.jsp" flush="true" />
		</ul>
	</div>
	<div id = "MainPage">	
		<table align="center">
			<tr>
		        <td >Available Servlets:</td>        
		      </tr>
		      <tr>
		        <td><a href="gae_application1">GAE_Application1</a></td>
		      </tr>
			<tr>
				<td width="35%"><div id="dataBox"></div>
				</td>
				<td >	
					<table>
						<tr><select id="tableMode">Mode<option>All</option><option>Sensor</option><option>IP</option><option>Date</option><option>Temperature</option><option>Humidity</option></select></tr>
						<tr><td width="70%"><div id="tableNodeInfo"></div></td></tr>
						<tr><div id="containerHD">
						    	<details>
						        	<summary>Menu 1</summary>
						            <a href="#">Submenu A</a>
						            <a href="#">Submenu B</a>
						        </details>
						        <details>
						        	<summary>Menu 2</summary>
						            <a href="#">Submenu A</a>
						            <a href="#">Submenu B</a>
						            <a href="#">Submenu C</a>
						        </details>
						    </div>
    					</tr>
					</table>
				</td>
			</tr>
		</table>	
	    <table align="center">
	    <tr>
	    <td align="left"><form action="/command" method="get">
					<div><input type="text" name="command" >
					<input type="submit" value="Send To Gateway"></div>
			</form>
			</td>
	    	<td>
		    	<form action="/command" method="get">
		    		<div><input type="text" name="command">
		    			<input type="submit" value="Send command to Webserver" /> </div>
		    	</form>
	    	</td>
	    	<td align="right">
			    <form action="/sign" method="get">
			      <div align="center"><input type="text" name="data" >
							<input type="submit" value="Post Greeting"></div>
			    </form>
		    </td>   
	    </tr>
	   </table>
	    
		<script type="text/javascript"
	    src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
		<script>
		     $(document).ready(
		            function() {
		                setInterval(function() {
		                    var randomnumber = Math.floor(Math.random() * 100);
		                    $('#dataBox').load("dataReceived.jsp").fadeIn("fast");
		                    $('#tableNodeInfo').load("tableNodeInfo.jsp").fadeIn("fast"); 
		                }, 200);
		            }); 
		</script>
	</div>
<div>
	<script>
				$(document).ready( function() {					
				    $("#Main").on("click", function() {
				        $('#MainPage').load("tabMainPage.jsp");
				    });
				    /* $("#Map").on("click", loadmap()); */
				    $("#Report").on("click", function() {
				        $('#MainPage').load("tableNodeInfo.jsp");
				    });
				    $("#About").on("click", function() {
				        $('#MainPage').load("tabAbout.jsp");
				    });
	</script>
</div>
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
    var map = new google.maps.Map(document.getElementById("MainPage"),myOptions);
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
</body>
</html> 
