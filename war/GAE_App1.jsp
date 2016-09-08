<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.jdo.PersistenceManager"%>
<%@page import="javax.jdo.Query"%>
<%@page import="com.haiduong.gaeapplication.*"%> 

<%-- <!DOCTYPE html>
<%@page import="com.sun.xml.internal.bind.v2.schemagen.xmlschema.List"%>
<%@page import="com.haiduong.gaeapplication.GAE_Application1Entry"%>
<%@page import="javax.jdo.PersistenceManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.haiduong.gaeapplication.PMF"%>
<%@page import="com.google.appengine.labs.repackaged.com.google.common.collect.Multiset.Entry"%> --%>
<html>
    <head>
    <style type="text/css">
    	.main {margin: 0px 25px 25px 25px; width:600px;}
    	.headerMenu {text-align: right; width: 100%;}
    	.entryList, .entry {border:2px coral solid; padding: 5px; margin-bottom: 20px;}
    	.entry {height: 7cm;}
    	.signin {text-align: center;}
    	.postedby {margin-left: 15px; margin-bottom: 10px;}
    	h2 {margin:0px;}
    	h3 {margin:0px 0px 10px 0px; font-size: 1cm;}
    </style>
    </head>
    <body>
    	<div class="main">
    		<div class="header">    		
        		<h1>Hello World!</h1>
    		</div>
    	</div>
    	<h2> New Entry HD</h2>
    	<div class="entry">
    		<form action="/GAE_Application1" method="post">
    			<table>
    				<tr>
    					<td>Post:</td>
    					<td><textarea rows="3" cols="70"></textarea></td>
    				</tr>
    				<tr>
    					<td>Your name:</td>
    					<td><input name="poster" type="text" value=""></td>
    				</tr>
    			</table>
    			<div>
    				<input type="submit" value="Create">
    			</div>
    		</form>
    	</div>
    	<h2>Entries</h2>
    	<div class="entryList">
    		<%-- <%
    		List<GAE_Application1Entry> entries = new ArrayList();
    		
    		PersistenceManager pm = PMF.get().getPersistenceManager();
    		Query query = pm.newQuery("SELECT FROM "+GAE_Application1Entry.class.getName());
    		entries = (List<GAE_Application1Entry>) query.execute();
    		%>
    		
    		<%
    			
    		%> --%>
    	</div>


		<table border="1">
		    <thead>
		        <tr>
		            <th>Index</th>
		            <th>Name</th>
		            <th>Email</th>
		        </tr>
		    </thead>
		    <tbody>
		        <tr>
		            <td>1</td>
		            <td>Nguyen Hai Duong</td>
		            <td>haiduongbket@gmail.com</td>
		        </tr>
		        <tr>
		            <td>2</td>
		            <td>Duong Hai Nguyen</td>
		            <td>haiduong2894@gmail.com</td>
		        </tr>
		        <tr>
		            <td>3</td>
		            <td>Bolder</td>
		            <td><form name="HD" action="GAE_App1.jsp">
		                    <select name=”subject_id”>
		                    	<option name="the nao y">theo tao</option>
		                    	<option name="khong tin duoc">the nao day
		                    </select>
		                    <select name="Hai duong"> Nguyen Hai Duong</select>
		                           <!-- <input type="text" name="submit" value="submit" /> -->
		                </form></td>
		        </tr>
		    </tbody>
		    <tr>
		    	<td> <button onClick="#">Connect</button></td> 
		    	<td> <label id="lblConnect">Not connected!</label> </td>
			</tr>
		    <tr>
		    	<td> <button onClick="#" value="btnSend">Send</button></td>
		    	<td> <textarea rows="6" cols="40"></textarea> </td>
			</tr>
		</table>
    </body>
</html>