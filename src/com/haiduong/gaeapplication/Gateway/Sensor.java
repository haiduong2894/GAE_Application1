package com.haiduong.gaeapplication.Gateway;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Sensor extends Node {
	@PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    private Long id;
	/// <summary>
    /// Nhiet do cua sensor
    /// </summary>
	@Persistent
	private float temperature;

    /// <summary>
    /// Do am cua sensor
    /// </summary>
	@Persistent
   private float humidity;

    /// <summary>
    /// Nang luong cua sensor
    /// </summary>
	@Persistent
    private float energy;
	
	@Persistent
	private String domain;

    /// <summary>
    /// Trang thai cua sensor
    /// </summary>
    
    public Sensor(String mac, String ip,boolean active, float lat, float lng, String region, float temp, float humid, float ener){
    	super(mac, ip, active, lat, lng, region);
    	this.temperature = temp;
    	this.humidity = humid;
    	this.energy = ener;    		
    	
    }
    
    public float getTemp(){
    	return temperature;
    }
    public void setTemp(float temp) {
        this.temperature = temp;
    }
    
    public float getHumid(){
    	return humidity;
    }
    public void setHumid(float humid) {
        this.temperature = humid;
    }
    
    public float getEner(){
    	return energy;
    }
    public void setEner(float ener) {
        this.energy = ener;
    }
    
    public String getDomain(){
    	return domain;
    }
    public void setMac(String domain) {
        this.domain = domain;
    }
    /// <summary>
    /// Tao lenh lay du lieu nhiet do, do am cac sensor
    /// </summary>
    /// <param name="ip"></param>
    /// <returns></returns>
    public String CommandSensor(String ip)
    {
        try
        {
            return ip + "000$";
        }
        catch (Exception ex)
        {
            System.out.println(ex);
            return null;
        }
    }
    
    
  /// <summary>
    /// mang luu cac doan du lieu anh
    /// </summary>
    public String[] arrayStringImage = new String[100];

    /// <summary>
    /// Chup xong anh se chuyen sang true
    /// </summary>
    public static boolean takePhotoDone = false;

    public static String img_path = null;

}
