package com.haiduong.gaeapplication.Gateway;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

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

    public Node(String mac, String ip, boolean active){
    	this.Mac = mac;
    	this.Ip = ip;
    	this.active = active;
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
}
