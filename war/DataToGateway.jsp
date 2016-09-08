<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.haiduong.gaeapplication.Command" %>
<%@ page import="com.haiduong.gaeapplication.PMF" %>

	<%
		//UserService userService = UserServiceFactory.getUserService();
	    //User user = userService.getCurrentUser();
		//response.setIntHeader("Refresh", 1);
	    PersistenceManager pm = PMF.get().getPersistenceManager();
	    String query = "select from " + Command.class.getName();
	    List<Command> commands = (List<Command>) pm.newQuery(query).execute();
	    for (Command cmd : commands) {
	%>
	<%= cmd.getCommand() %>
	<%    
		pm.deletePersistent(cmd);
	    }
	    pm.close();
	%>   

