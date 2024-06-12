/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import context.DBContext;
import controller.LoginController;
import entity.Account;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
public class AccountDAO {

    Connection conn;//ket noi voi database
    PreparedStatement ps;//thuc thi cau lenh sql
    ResultSet rs;// luu gia tri lay tu database

    //dùng để login, nếu trả về 1 account thì đăng nhập thành công
    //ngược lại, nếu trả về null thì đăng nhập không thành công
    public Account login(String user, String pass) {
        String query = "select * from account\n"
                + " where acc_id = ?\n"
                + "and [password] = ?";
        try {
            conn = new DBContext().connect();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7));
            }
        } catch (Exception e) {
        }
        return null;
    }

    //kiểm tra xem tài khoản đăng nhập có phải là admin hay không?
    public boolean isAdminExist(String username) {
        Account a = accountExist(username);
        if (a.getIsAdmin() == 1) {
            return true;
        }
        return false;
    }

    //dùng để đăng ký tài khoản mới
    //insert dữ liệu vào db
    public void singup(String account, String pass, String name, String phone, String address, String gender) {
        String query = "insert into account\n"
                + "values(?, ?, ?, ?,  ?, ?,0)";
        try {
            conn = new DBContext().connect();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, account);
            ps.setString(2, hashPasswordMD5(pass));
            ps.setString(3, name);
            ps.setString(4, phone);
            ps.setString(5, address);
            ps.setString(6, gender);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    //kiểm tra xem tài khoản có tồn tại hay không?
    //trả về true thì tồn tại, ngược lại thì không tồn tại
    public boolean checkAccountExist(String user) {
        String query = "select * from account\n"
                + "where acc_id = ?";
        try {
            conn = new DBContext().connect();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public String hashPasswordMD5(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");

            byte[] passwordBytes = password.getBytes();
            byte[] hashBytes = md.digest(passwordBytes);
            StringBuilder sb = new StringBuilder();
            for (byte b : hashBytes) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();

        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(LoginController.class
                    .getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    //dùng để lấy thông tin của account
    public Account accountExist(String user) {
        String query = "select * from account\n"
                + "where acc_id = ?";
        try {
            conn = new DBContext().connect();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7));
            }
        } catch (Exception e) {
        }
        return null;
    }

    //dùng cho forgot password
    public boolean checkProfile(String user, String name, String phone, String address, String gender) {
        AccountDAO dao = new AccountDAO();
        boolean c = dao.checkAccountExist(user);
        Account a = dao.accountExist(user);
        boolean isValid;
        //không tồn tại
        if (!c) {
            return false;
        } else {
            //trùng khớp
            if (name.equalsIgnoreCase(a.getAcc_name()) && user.equals(a.getAcc_id()) && address.equalsIgnoreCase(a.getAddress())
                    && phone.equals(a.getPhone()) && gender.equalsIgnoreCase(a.getGender())) {
                isValid = true;
            } else {//không trừng khớp
                isValid = false;
            }
        }
        return isValid;
    }

    //dùng cho forgot password
    public void updatePassword(String user, String password) {
        String query = "UPDATE account\n"
                + "SET password=?\n"
                + "WHERE acc_id = ?;";
        try {
            conn = new DBContext().connect();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, hashPasswordMD5(password));
            ps.setString(2, user);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateProfile(String id, String name, String phone, String address, String gender) {
        String query = "UPDATE account\n"
                + "SET acc_name=?, acc_phone=?  , acc_address=?, gender=? \n"
                + "WHERE acc_id = ?";
        try {
            conn = new DBContext().connect();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, phone);
            ps.setString(3, address);
            ps.setString(4, gender);
            ps.setString(5, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public boolean changePassword(String username, String oldPass, String pass, String repass) {

        return false;
    }

    public static void main(String[] args) {
        AccountDAO dao = new AccountDAO();
//        dao.updateProfile("user08", "hhaha", "1212121212", "st", "abc");
//        dao.updateProfile("user08", "OK", "11122233", "ST", "Male");
//            dao.updatePassword("user02", "1");

        System.out.println(java.time.LocalDate.now());
        System.out.println(java.time.LocalTime.now());
    }
}
