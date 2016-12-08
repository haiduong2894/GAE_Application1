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
	