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
  </head>
   <!-- <h1 align="center" style="bottom: 100%"><img src="fightGhost.jpg"></h1> --> 
    <h1 align="center">WSAN LAB411 - Gateway App Engine!</h1>
    <script type="text/javascript" src="jquery.js"></script>
        <script type="text/javascript">
        setInterval(
        function ()
        {
        $('dataBox').load('http://localhost:8888/login.jsp').fadeIn("slow");
        }, 1000); // autorefresh the content of the div after
                   //every 1000 milliseconds(1sec)
        </script>
  <body id="page">
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
<table id = "mainTable" align="center">
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
			</table>
		</td>
	</tr>
	<tr>
		<div><address>Nguyen Hai Duong Lab411</address></div>
	</tr>
</table>	
    <table align="center">
      <tr>
      	<script>
      	function btnSend_Click() {
      	  var xhttp = new XMLHttpRequest();
      	  xhttp.onreadystatechange = function() {
      	    if (xhttp.readyState == 4 && xhttp.status == 200) {
      	    document.getElementById("btnSend").innerHTML = xhttp.responseText;
      	    }
      	  };
      	  //xhttp.open("GET", "http://lab411s.esy.es/sg/rx.php?data="+document.getElementById("textArea").value, true);
      	  /* xhttp.open("GET", "http://localhost:8888/Process.jsp?data="+document.getElementById("textArea").value, true);
      	  xhttp.send(); */
      	}
      	</script>
      </tr>
    </table>    
    </body>
    <body>
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
  </body>
</html>