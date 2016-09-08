package com.haiduong.gaeapplication;

import java.util.Date;

import javax.jdo.PersistenceManager;
import javax.servlet.http.HttpServletRequest;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.haiduong.gaeapplication.Gateway.Actor;
import com.haiduong.gaeapplication.Gateway.Node;
import com.haiduong.gaeapplication.Gateway.Sensor;

public class ConvertData {
	HttpServletRequest req;
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
	
	public void convertDataJoinNetwork(){
		try{
			String mac = null;
	        String ip = null;
	        //db = new Database();
	        mac = data.substring(7, 9);
	        int mac_int = Integer.valueOf(mac, 16).intValue();
	        ip = data.substring(3, 7);
	        String message = date +": Sensor " + mac+" with Ip:" + ip + " has joined network!";
	        Greeting greeting = new Greeting(user, message, date);
	        DataSensor dataSensor = new DataSensor(user, data, date, mac, ip, 0, 0, "01");
			try {
				pm.makePersistent(dataSensor);
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
	            Node.Mac = mac;
	            Node.Ip = ip;
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
	
	public void convertDataRD(){
		try{
			//conv. convertDataJoinNetwork();
			float humi = 0;
	        float temp = 0;
	        float ener = 0;
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
	
	        Sensor.temperature = temp;
	        Sensor.humidity = humi;
	        Sensor.energy = ener;
	        
			DataSensor dataSensor = new DataSensor(user, data, date, mac, ip, temp, humi, "01");
			pm.makePersistent(dataSensor);			
		}
		catch(Exception ex) {System.out.println(ex.toString());}
	}
}
