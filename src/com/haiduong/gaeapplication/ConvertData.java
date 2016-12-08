package com.haiduong.gaeapplication;

import java.util.Date;

import javax.jdo.PersistenceManager;
import javax.servlet.http.HttpServletRequest;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.haiduong.gaeapplication.Gateway.Node;

public class ConvertData {
	HttpServletRequest req;
	String mac, ip,stateSensor;
	float temp, humi, ener;
	UserService userService = UserServiceFactory.getUserService();
	User user = userService.getCurrentUser();
	PersistenceManager pm = PMF.get().getPersistenceManager();
	String id = null, data = null, header = null;
	Date date;
	final int MIN_MACSensor = 32, MAX_MACSensor = 96;
	/// <summary>
    /// Tao doi tuong sensor
    /// </summary>
    //private Sensor sensor = new Sensor();

    /// <summary>
    /// Tao doi tuong actor
    /// </summary>
    //private Actor actor = new Actor();

    /// <summary>
    /// Tao doi tuong van
    /// </summary>
    //private Van van = new Van();

	/// <summary>
    /// Kiem tra la sensor (true) hay actor (false)
    /// </summary>
    public boolean checkSensor = false;
    
	//constructor
	public ConvertData(HttpServletRequest req){
		this.req = req;
		id = req.getParameter("id");
		date = new Date();
		data = req.getParameter("data");
		header = req.getParameter("data").substring(0,3);
		System.out.println("Id:"+id+"\r\nData:"+data);
	}
	
	//message when node join to network 
	public void convertDataJoinNetwork(){
		try{
	        //db = new Database();
			//System.out.println(Gateway_Shared.checkNodeExist("32"));
			//System.out.println(Gateway_Shared.checkActive("32"));
	        mac = data.substring(7, 9);
	        int mac_int = Integer.valueOf(mac, 16).intValue();
	        ip = data.substring(3, 7);
	        String message = date +": Sensor " + mac+" with Ip:" + ip + " has joined network!";
	        Greeting greeting = new Greeting(user, message, date);
	        Node nodes = new Node(mac, ip, true, -1, -1,"01");
			try {
				pm.makePersistent(nodes);
				pm.makePersistent(greeting);
			} 
			catch(Exception ex) {System.out.println(ex.toString());}
	        if (mac_int == 0 || mac_int == 177)
	        {
	            //checkSensor = false;
	            /*Node.Mac = mac;
	            Node.Ip = ip;
	            if (db.CheckActor(mac) == "true")
	            {
	                db.setNetworkIpActor(mac, ip);
	                db.setStatusActor(mac, true);
	            }
	            else
	            {
	                db.setNodeActor(mac, ip, true);
	            } */
	        }
	        else if ((mac_int > 32) && mac_int< 96)
	        {
	            //checkSensor = true;
	            /*Node.Mac = mac;
	            Node.Ip = ip;
	            if (db.CheckSensorBC(mac) == "true")
	            {
	                db.setNetworkIpSensorBC(sensor.Mac, sensor.Ip);
	                db.setStatusSensorBC(sensor.Mac, true);
	            }
	            else
	            {
	                db.setSensor_bc(sensor.Mac, sensor.Ip, true);
	            }*/
	        }
	        else
	        {
	            //checkSensor = true;
	            /*Node.Mac = mac;
	            Node.Ip = ip;*/
	            /*if (db.CheckSensor(mac) == "true")
	            {
	                db.setNetworkIpSensor(sensor.Mac, sensor.Ip);
	                db.setActiveSensor(sensor.Mac, true);
	            }
	            else
	            {
	                db.setNodeSensor(sensor.Mac, sensor.Ip, true);
	            }*/
	        }
	    }
	    catch (Exception ex){}
	}
	
	//humidity-temperature message
	public void convertDataRD(){
		try{
			//conv. convertDataJoinNetwork();
	        String mac = data.substring(7, 9);
	        String ip = data.substring(3,7);
			String hexd = data.substring(9, 13);
	        int td = Integer.valueOf(hexd, 16).intValue();
	        hexd = data.substring(13, 17);
	        int rhd = Integer.valueOf(hexd, 16).intValue();
	        hexd = data.substring(17, 21);
	        int rpd = Integer.valueOf(hexd, 16).intValue();
	        float rpd1 = ((float)rpd / (float)4096);
	        float rh_lind;// rh_lin:  Humidity linear 
	        temp = (float)(td * 0.01 - 39.6);                  				//calc. temperature from ticks to [deg Cel]	
	        rh_lind = (float)(0.0367 * rhd - 0.0000015955 * rhd * rhd - 2.0468);     	//calc. humidity from ticks to [%RH]
	        humi = (float)((temp - 25) * (0.01 + 0.00008 * rhd) + rh_lind);   		//calc. temperature compensated humidity [%RH]
	        ener = (float)(0.78 / rpd1);                                 //calc. power of zigbee
	        if (humi > 100) humi = 100;       				//cut if the value is outside of
	        if (humi < 0.1) humi = 0;
	
	        /*Sensor.temperature = temp;
	        Sensor.humidity = humi;
	        Sensor.energy = ener;*/
	        
			DataSensor dataSensor = new DataSensor(user, data, date, mac, ip, temp, humi, "01");
			pm.makePersistent(dataSensor);			
		}
		catch(Exception ex) {System.out.println(ex.toString());}
	}
	
	//position messages
	public void convertDataPS(){
		try{
	        String mac = data.substring(7, 9);
	        String ip = data.substring(3,7);
	        String lat = data.substring(9,19);
	        String lng = data.substring(19,29);
	        
	        double lat_d = Double.parseDouble(lat);
	        double lng_d = Double.parseDouble(lng);
	        
	        String message = date +": Update position sensor " + mac+" with Latitude:" + lat + "    Longitude:" + lng;
	        Greeting greeting = new Greeting(user, message, date);
	        pm.makePersistent(greeting);
	        if(Gateway_Shared.checkNodeExist(mac)) Gateway_Shared.updatePosition(mac,lat_d,lng_d);
	        else {
	        	Node nod = new Node(mac, ip, true, lat_d, lng_d, "01");
				pm.makePersistent(nod);
	        }			
		}
		catch(Exception ex) {System.out.println(ex.toString());}
	}
		
	//convert state update messages
	public void convertStateSensor(){
		try
        {
            mac = data.substring(7, 9);
            stateSensor = data.substring(9, 11);
			if (stateSensor.equals("02"))
	        {
	            String msg = "(" + date + "):Warning fire risk at node " + mac;
	            Greeting greeting = new Greeting(user, msg, date);
				try {
					pm.makePersistent(greeting);
				} 
				catch(Exception ex) {System.out.println(ex.toString());}
	
	        }
	        else if (stateSensor.equals("03"))
	        {
	            String msg = "(" + date + "):Low Energy at node " + mac;
	            Greeting greeting = new Greeting(user, msg, date);
				try {
					pm.makePersistent(greeting);
				} 
				catch(Exception ex) {System.out.println(ex.toString());}
	        }
	        else
	        {
	            String msg = "(" + date + "): Detected intrusion at node" + mac;
	            Greeting greeting = new Greeting(user, msg, date);
				try {
					pm.makePersistent(greeting);
				} 
				catch(Exception ex) {System.out.println(ex.toString());}
	        }
        }
        catch (Exception ex){}
	}
	
	//convert sleep message
	public void convertInformationSleep(){
        mac = data.substring(3,5);
		Gateway_Shared.changeActivationNode(mac, false);
		String msg = "(" + date + "):" + mac +" in sleep mode";
        Greeting greeting = new Greeting(user, msg, date);
		try {
			pm.makePersistent(greeting);
		} 
		catch(Exception ex) {}
	}
}
