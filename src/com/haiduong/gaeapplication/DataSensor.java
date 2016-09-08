package com.haiduong.gaeapplication;

import java.util.Date;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.users.User;

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class DataSensor extends Message{ 
    @Persistent
    private String mac;
    
    @Persistent
    private String ip;
    
    @Persistent
    private float temp;
    
    @Persistent
    private float humid;
    
    @Persistent
    private int status;
    
    public DataSensor(User author, String content, Date date, String mac, String ip, float temp, float humid, int status) {
    	super(author, content, date);
        this.mac = mac;
        this.ip = ip;
        this.temp = temp;
        this.humid = humid;
        this.status = status;
    }
    
    public String getMac() {
        return mac;
    }
    public String getIp() {
        return ip;
    }
    public float getTemp() {
        return temp;
    }
    public float getHumid() {
        return humid;
    }
    public int getStatus(){
    	return status;
    }
    public void setMac(String mac) {
        this.mac = mac;
    }
    
    public void setIp(String ip) {
        this.ip = ip;
    }
    
    public void setTemp(float temp) {
        this.temp = temp;
    }
    
    public void setHumid(float humid) {
        this.humid = humid;
    }
    
    public void setStatus(int status){
    	this.status = status;
    }
    
    /*public Long getId() {
        return id;
    }

    public User getAuthor() {
        return author;
    }

    public String getContent() {
        return content;
    }

    public Date getDate() {
        return date;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setDate(Date date) {
        this.date = date;
    }*/
}
