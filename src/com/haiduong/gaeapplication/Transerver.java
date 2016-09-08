package com.haiduong.gaeapplication;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;

import javax.jdo.PersistenceManager;
import javax.servlet.http.*;

import com.google.appengine.api.datastore.Entity;

@SuppressWarnings("serial")
public class Transerver extends HttpServlet{
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException{
		String cmd = req.getParameter("command");
		System.out.println("Command to gateway : " + cmd);
		Date date = new Date();
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Command command = new Command(date,cmd);
		pm.makePersistent(command);
		/*cmd = cmd.replace(" ", "%20");
		System.out.println(cmd);
		
		String url = "http://localhost/sg/rx.php?data=" + cmd;
		HttpURLConnection con = null;
		try{
			URL obj = new URL(url);
			con = (HttpURLConnection) obj.openConnection();
			// optional default is GET
			con.setRequestMethod("GET");
			}
		catch(IllegalArgumentException e){System.out.println("ko gui duoc");}
		finally {
			//int responseCode = con.getResponseCode();
			System.out.println("\nSending 'GET' request to URL : " + url);
			//System.out.println("Response Code : " + responseCode);

			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();

			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();
		}
*/
		resp.sendRedirect("/login.jsp");
	}
	
	
}
