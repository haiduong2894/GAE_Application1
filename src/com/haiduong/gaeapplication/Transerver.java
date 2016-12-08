package com.haiduong.gaeapplication;

import java.io.IOException;
import java.util.Date;
import java.util.logging.Logger;

import javax.jdo.PersistenceManager;
import javax.servlet.http.*;


@SuppressWarnings("serial")
public class Transerver extends HttpServlet{
private static final Logger log = Logger.getLogger(SignGuestbookServlet.class.getName());
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException{
		try{
			String cmd = req.getParameter("command");
			String cmdMap = req.getParameter("commandMap");
			Date date = new Date();
			PersistenceManager pm = PMF.get().getPersistenceManager();
			Command command = new Command(date,cmd);
			Command commandMap = new Command(date,cmdMap);
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

			System.out.println("Command to gateway : " + cmd);
			System.out.println("CommandMap to gateway : " + cmdMap);
			if(cmd.equals(null)) {
				pm.makePersistent(commandMap);
				pm.close();
				resp.sendRedirect("/tabMap.jsp");
			}
			else {
				pm.makePersistent(command);
				pm.close();
				resp.sendRedirect("/login.jsp");
			}
		}
		catch (Exception ex) {resp.sendRedirect("/login.jsp");}
	}
	
	
}
