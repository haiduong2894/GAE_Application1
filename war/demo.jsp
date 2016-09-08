<%@ page import="java.io.*,java.util.*" %>

<html>
	<body>
	
	<table>
		<tr>
		    <form action="/sign" method="get">
		      <div align="center"><input type="text" name="content" >
						<input type="submit" value="Post Greeting"></div>
		    </form>
		</tr>
	<tr>
		<form action="/main.jsp" method="POST">
    	<input type="text" name="id">
		<input type="text" name="data">
    <div><input type="submit" value="Post Greeting" /></div>
    <%
   // Set refresh, autoload time as 5 seconds
   //response.setIntHeader("Refresh", 1);
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
   out.println("Current Time: " + CT + "\n");
%>
    		</form>
    	</tr>
    </table>
	</body>
</html>

