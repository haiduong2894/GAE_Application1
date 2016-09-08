package com.haiduong.gaeapplication;

import com.haiduong.gaeapplication.Gateway.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.logging.Logger;

import javax.jdo.PersistenceManager;
import javax.servlet.http.*;

import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@SuppressWarnings("serial")
public class SignGuestbookServlet extends HttpServlet {
	private static final Logger log = Logger.getLogger(SignGuestbookServlet.class.getName());
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException{
		PrintWriter outText = resp.getWriter();
		UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();
		String id = req.getParameter("id");
		Date date = new Date();
		String data = req.getParameter("data");
		String header = req.getParameter("data").substring(0,2);
		ConvertData conv = new ConvertData(req); 
		outText.println("Id:"+id+"\r\nData:"+data);
		outText.println("User:"+user);
		System.out.println("Id:"+id+"\r\nData:"+data);
		PersistenceManager pm = PMF.get().getPersistenceManager();
		
		switch (header){
		///////////////////////////////////////////////////////////
		case "RD":
			conv.convertDataRD();
			break;
		case "AD":
			conv.convertDataRD();
			break;
		case "JN":
			try{
				conv.convertDataJoinNetwork();
			}
			catch(Exception ex){}
			break;
		case "SN":
			conv.convertStateSensor();
			break;
		case "VL":
			conv.convertInformationSleep();
			break;
		///////////////////////////////////////////////////////////////////////
		default:			
			System.out.println("NguyenHaiDuongDefault");
			Greeting greeting = new Greeting(user, data, date);
			try {
				pm.makePersistent(greeting);
			} 
			catch(Exception ex) {System.out.println(ex.toString());}
			break;
		}
		
		//Sau Switch
		pm.close();
		resp.sendRedirect("/login.jsp");
	}
	
	/*public boolean checkStatus(int mac){
		PersistenceManager pm = PMF.get().getPersistenceManager();
		//List<object> obj = pm.getObjectsById(mac, 32);
	}*/
}
