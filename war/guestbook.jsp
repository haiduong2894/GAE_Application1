<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@ page import="java.util.List" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.haiduong.gaeapplication.Greeting" %>
<%@ page import="com.haiduong.gaeapplication.PMF" %>

<html>
  <body>

<%
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
    /* if (user != null) { */
%>  
<p>Hello, <%= userService.toString() %> ! (You can
<%--<a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">sign out</a>.)</p> --%>
<%-- <%
    } else {
%>
<p>Hello!
<a href="<%= userService.createLoginURL(request.getRequestURI()) %>">Sign in</a>
to include your name with greetings you post.</p>
<%
    }
%>

<%
    PersistenceManager pm = PMF.get().getPersistenceManager();
    String query = "select from " + Greeting.class.getName() + " order by date desc range 0,5";
    List<Greeting> greetings = (List<Greeting>) pm.newQuery(query).execute();
    if (greetings.isEmpty()) {
%>
<p>The guestbook has no messages.</p>
<%
    } else {
        for (Greeting g : greetings) {
            if (g.getAuthor() == null) {
%>
<p>An anonymous person wrote:</p>
<%
            } else {
%>
<p><b><%= g.getAuthor().getNickname() %></b> wrote:</p>
<%
            }
%>
<blockquote><%= g.getContent() %></blockquote>
<%
        }
    }
    pm.close();
%>
 --%>
    <form action="/sign" method="get">
    	<input type="text" name="id">
		<input type="text" name="data">
    <div><input type="submit" value="Post Greeting" /></div>
    </form>
	<form action="/gae_application1" method="get">
      <div><input type="submit" value="Post Greeting" /></div>
    </form>
  </body>
</html>