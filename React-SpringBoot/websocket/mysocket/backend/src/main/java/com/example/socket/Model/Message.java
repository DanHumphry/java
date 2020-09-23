package com.example.socket.Model;

import java.util.Date;

public class Message {

    private String username;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    private String content;
    private Date date;

    public Message(String username, String content, Date date) {
        this.username = username;
        this.content = content;
        this.date = date;
    }

}
