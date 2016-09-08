<%@page import="java.net.URL"%>
<%@page import="com.google.appengine.repackaged.com.google.api.client.http.HttpRequest"%>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
	<head>
		<title>Using GET Method to Read Form Data</title>
	</head>
	<body>
	 
	<%
		String id = request.getParameter("id");
		String data = request.getParameter("data");
		String url = "/sign?id="+id+"data="+data;
	%>
	
		<% //response.setIntHeader("refresh", 5);
			
		%>
		<center>
		<h1>Using GET Method to Read Form Data</h1>
		<ul>
			<li><p><b>First Name:</b>
			  	<%= request.getParameter("id")%>
				</p></li>
				
				<li><p><b>Last Name:</b>
			   	<%= request.getParameter("data")%>
			   	</p></li>
			   	
			   	<li><p><b>URI:</b>
			   	<%=request.getRequestURL() %>
				</p></li>
		</ul>
		<h2>Demo button with click reference to send data to Class through web.xml</h2>		
		<form action="/sign" method="get">
			<input type="text" name="id" value=<%=request.getParameter("id") %>>
			<input type="text" name="data" value=<%=request.getParameter("data") %>>
			<div><input type="submit" value="Send to SignGuestbookServlet"></div>
		</form> 

	</body>
</html>