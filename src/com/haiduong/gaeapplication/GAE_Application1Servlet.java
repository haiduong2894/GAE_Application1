package com.haiduong.gaeapplication;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Date;

import javax.jdo.PersistenceManager;
import javax.jdo.PersistenceManagerFactory;
import javax.servlet.http.*;

import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.mysql.jdbc.Connection;


@SuppressWarnings("serial")
public class GAE_Application1Servlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/plain");
		resp.getWriter().println("Hello, world");
		resp.getWriter().println("Nguyen Hai DUong");
		///connect to database
		/*try{
			Class.forName("com.mysql.jdbc.Driver");
			resp.getWriter().println("Driver found");
		}
		catch(ClassNotFoundException e){
			resp.getWriter().println("Driver not found: " +e);
		}
		String url = "jdbc:mysql://localhost:3306/rfidreader";
		String user = "root";
		String password = "";
		
		java.sql.Connection conn = null;
		try{
			conn = DriverManager.getConnection(url,user,password);
			resp.getWriter().println("Connected to mySql");
		}
		catch(SQLException e){
			resp.getWriter().println("Cannot connect: " +e);
		}*/
		
		/*UserService userService = UserServiceFactory.getUserService();
		com.google.appengine.api.users.User user = userService.getCurrentUser();  */// Find out who the user is.
		
		
		/*String str = req.getRequestURI();
		String guestbookName = req.getParameter("/demo");
		
			resp.getWriter().println("guestbookName:"+guestbookName+"\r\nreq:"+str);
			resp.getWriter().println("UserService:"+userService.getClass()+"\r\nUser:"+user);
		
		
		String poster = req.getParameter("poster");
		String content = req.getParameter("content");
		Date date = new Date();
		
		Greeting greeting = new Greeting(user, content, date);
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
			pm.makePersistent(greeting);
		} 
		finally {
			pm.close();
		}*/
		
		/*GAE_Application1Entry entry = new GAE_Application1Entry();
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		pm.makePersistent(entry);
		pm.close();*/
		//resp.sendRedirect("/guestbook.jsp");
	}
}
