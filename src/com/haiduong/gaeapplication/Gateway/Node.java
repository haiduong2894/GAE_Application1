package com.haiduong.gaeapplication.Gateway;

import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.haiduong.gaeapplication.DataSensor;
import com.haiduong.gaeapplication.PMF;

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Node {
	@PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    private Long id;
	/// <summary>
    /// Dia chi mac cua cac node (sensor va actor)
    /// </summary>
	@Persistent
    private String Mac = null;

    /// <summary>
    /// Dia chi IP cua cac node(sensor va actor)
    /// </summary>
	@Persistent
    private String Ip = null;

	@Persistent
    private boolean active;
	
    @Persistent
    private double lat;
    
    @Persistent
    private double lng;
    
    @Persistent
    private String region;

    public Node(String mac, String ip, boolean active,double lat, double lng, String region){
    	this.Mac = mac;
    	this.Ip = ip;
    	this.active = active;
        this.lat = lat;
        this.lng = lng;
        this.region =region;
    }
    
    public String getMac(){
    	return this.Mac;
    }
    public String getIp(){
    	return this.Ip;
    }
    
    public void setMac(String mac){
    	this.Mac = mac;
    }
    public void setIp(String ip){
    	this.Ip = ip;
    }
    
    public boolean getActive(){
    	return active;
    }
    public void setActive(boolean act){
    	this.active = act;
    }
    
    public void setLat(double lat){
    	this.lat = lat;
    }
    public double getLat(){
    	return lat;
    }
    public void setLng(double lng){
    	this.lng = lng;
    }
    
    public double getLng(){
    	return lng;
    }
    public String getRegion(){
    	return region;
    }
    
    public void setRegion(String region){
    	this.region = region;
    } 
    
    public float getTemHum(String mac, String kind){
    	PersistenceManager pm = PMF.get().getPersistenceManager();
	    String query = "select from " + DataSensor.class.getName();
	    List<DataSensor> dts = (List<DataSensor>) pm.newQuery(query).execute();
	    for (DataSensor dt : dts){
	    	if(dt.getMac().equals(mac)) {
	    		if(kind.equals("tem")){
		    		return dt.getTemp();
	    		}
	    		else 
	    			return dt.getHumid();
	    	}    							
	    }
	    return 0;
    }
}
