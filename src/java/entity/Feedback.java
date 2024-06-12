/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author ADMIN
 */
public class Feedback {
    private String fb_id;
    private String fb_content;
    private Date  fb_date;
    private Time fb_time;
    private String acc_id;

    public Feedback() {
    }

    public Feedback(String fb_id, String fb_content, Date fb_date, Time fb_time, String acc_id) {
        this.fb_id = fb_id;
        this.fb_content = fb_content;
        this.fb_date = fb_date;
        this.fb_time = fb_time;
        this.acc_id = acc_id;
    }

    public String getFb_id() {
        return fb_id;
    }

    public void setFb_id(String fb_id) {
        this.fb_id = fb_id;
    }

    public String getFb_content() {
        return fb_content;
    }

    public void setFb_content(String fb_content) {
        this.fb_content = fb_content;
    }

    public Date getFb_date() {
        return fb_date;
    }

    public void setFb_date(Date fb_date) {
        this.fb_date = fb_date;
    }

    public Time getFb_time() {
        return fb_time;
    }

    public void setFb_time(Time fb_time) {
        this.fb_time = fb_time;
    }

    public String getAcc_id() {
        return acc_id;
    }

    public void setAcc_id(String acc_id) {
        this.acc_id = acc_id;
    }
    
    
    
    
}
