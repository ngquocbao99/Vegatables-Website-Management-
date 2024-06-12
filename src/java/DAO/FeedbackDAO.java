/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import context.DBContext;
import entity.Feedback;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class FeedbackDAO {

    Connection conn;//ket noi voi database
    PreparedStatement ps;//thuc thi cau lenh sql
    ResultSet rs;// luu gia tri lay tu database

    LocalDate date = java.time.LocalDate.now();
    LocalTime time = java.time.LocalTime.now();

    public void addFeedback(String fb_id, String content, Date date, Time time, String username) {
        String query = "INSERT INTO feedback \n"
                + "VALUES (?, ?, ?,?,?)";
        try {
            conn = new DBContext().connect();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, fb_id);
            ps.setString(2, content);
            ps.setDate(3, date);
            ps.setTime(4, time);
            ps.setString(5, username);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Feedback> getAllFeedbacks() {
        List<Feedback> listF = new ArrayList<>();
        String query = "select * from feedback";// test ben SQL
        try {
            conn = DBContext.connect();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                listF.add(new Feedback(rs.getString(1),
                        rs.getString(2),
                        rs.getDate(3),
                        rs.getTime(4),
                        rs.getString(5)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listF;
    }

    public List<Feedback> getFeedbackByID(String aid) {
        List<Feedback> listF1 = new ArrayList<>();
        String query = "select * from feedback where acc_id =?";// test ben SQL
        try {
            conn = DBContext.connect();
            ps = conn.prepareStatement(query);
            ps.setString(1, aid);
            rs = ps.executeQuery();
            while (rs.next()) {
                listF1.add(new Feedback(rs.getString(1),
                        rs.getString(2),
                        rs.getDate(3),
                        rs.getTime(4),
                        rs.getString(5)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listF1;
    }

    public void deleteFeedback(String fid) {
        String sql = "Delete from feedback where fb_id=?";
        try {
            conn = new DBContext().connect();
            ps = conn.prepareStatement(sql);
            ps.setString(1, fid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
}
