<%@page import="com.haiduong.gaeapplication.DataSensor"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.haiduong.gaeapplication.PMF" %>

<html>
<body>
	<%
		UserService userService = UserServiceFactory.getUserService();
	    User user = userService.getCurrentUser();
		//response.setIntHeader("Refresh", 1);
	   	PersistenceManager pm = PMF.get().getPersistenceManager();
	    //String query = "select from " + DataSensor.class.getName() + " order by date desc range 0,10";
	    String query = "select from " + DataSensor.class.getName();
	    List<DataSensor> dataSensors = (List<DataSensor>) pm.newQuery(query).execute();
	%>
	<table border="1" id="tableData">
		<tr colspan="2" style="font-weight:bold;"><td>ID</td><td>Date Time</td><td>IP</td><td>MAC</td><td>Temperature(*C)</td><td>Humidity(%)</td></tr>
		<% for (DataSensor data : dataSensors) {
				  if(data.getStatus().equals("01")){
		%>
				
					<tr><td><%=data.getId() %></td><td><%=data.getDate() %></td><td><%=data.getIp() %></td><td><%=data.getMac() %></td><td><%=data.getTemp() %></td><td><%=data.getHumid() %></td></tr>
		<%			}
		 	    }
		pm.close();
	%>   
		    	
	</table> 
 
</body>
</html>