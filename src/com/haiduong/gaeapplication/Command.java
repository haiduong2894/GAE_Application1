package com.haiduong.gaeapplication;

import java.util.Date;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.users.User;

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Command {
	@PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    private Long id;

    @Persistent
    private User author;

    @Persistent
    private String command;
    
    @Persistent
    private Date date;
    
    public Command(Date date, String command){
    	this.date = date;
    	this.command = command;
    }
    
    public Long getId() {
        return id;
    }

    public User getAuthor() {
        return author;
    }

    public String getCommand() {
        return command;
    }
    
    public Date getDate() {
        return date;
    }
    public void setAuthor(User author) {
        this.author = author;
    }

    public void setCommand(String command) {
        this.command = command;
    }
    public void setDate(Date date) {
        this.date = date;
    }
}
