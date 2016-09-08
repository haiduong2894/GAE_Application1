package com.haiduong.gaeapplication;

import java.util.List;

import javax.jdo.PersistenceManager;

import com.haiduong.gaeapplication.Gateway.Node;
import com.sun.java.swing.plaf.windows.resources.windows;

public class Gateway_Shared {
	public static String getStatus(String mac){
		PersistenceManager pm = PMF.get().getPersistenceManager();
	    String query = "select from " + DataSensor.class.getName();
	    List<DataSensor> dataSensors = (List<DataSensor>) pm.newQuery(query).execute();
	    for (DataSensor dt : dataSensors){
	    	if(dt.getMac().equals(mac)) 
	    		return dt.getStatus();	    							
	    }
		return null;
	}
	
	public static void changeStatus(String mac, String status){
		PersistenceManager pm = PMF.get().getPersistenceManager();
	    String query = "select from " + DataSensor.class.getName();
	    List<DataSensor> dataSensors = (List<DataSensor>) pm.newQuery(query).execute();
	    for (DataSensor dt : dataSensors){
	    	if(dt.getMac().equals(mac)) 
	    		dt.setStatus(status);    							
	    }
	}
	public boolean checkNodeExist(String mac){
		PersistenceManager pm = PMF.get().getPersistenceManager();
		String query = "select from " + Node.class.getName();
	    List<Node> nodes = (List<Node>) pm.newQuery(query).execute();
	    for (Node nd : nodes){
	    	if(nd.getMac().equals(mac)) return true;    							
	    }
	    return false;
	}
	
	public static void changeActivationNode(String mac, boolean status){
		PersistenceManager pm = PMF.get().getPersistenceManager();
	    String query = "select from " + Node.class.getName();
	    List<Node> nodes = (List<Node>) pm.newQuery(query).execute();
	    for (Node nd : nodes){
	    	if(nd.getMac().equals(mac)) {
	    		nd.setActive(status);
	    	}    							
	    }	    
	}	
}
