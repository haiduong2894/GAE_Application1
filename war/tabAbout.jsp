<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<html>
<head>
<title>Map</title>
<link type="text/css" rel="stylesheet" href="login.css">
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
			<li><a id="About"href="gae_application1?id=Game">Game Map</a></li>
		</ul>
	</div>	
		<h1 align="center">Embedded Networking Laboratory</h1>
		<h2 align="center">C9 - 411 School of Electronics and Telecommunications</h2>
		<h4>Topic: Nghien cuu phat trien he thong quan ly bao ve rung su dung mang ad-hoc khong day da chang. </h4>
		<h4>Group: HWSAN </h4>
		<div id="MainPage"></div>
	</body>
</html>