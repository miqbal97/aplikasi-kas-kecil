/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Config;

import java.sql.*;
import javax.swing.JOptionPane;

/**
 *
 * @author Muhammad Iqbal
 */
public class koneksi {
    
    public String _status = null;
    
    public static final int ERROR_MESSAGE = 0,
                            INFORMATION_MESSAGE = 1,
                            WARNING_MESSAGE = 2,
                            QUESTION_MESSAGE = 3;
    
    protected Connection conn;
    protected Statement stmt;   

    protected String _host_ = "jdbc:mysql://localhost/kas_kecil",
                     _user_ = "root",
                     _pass_ = "";
    
    
    
    public koneksi() {
        
        try {
            
            conn = DriverManager.getConnection(_host_, _user_, _pass_);
            
            stmt = conn.createStatement();
            
            System.out.println("Koneksi Berhasil");
            
            this._status = "Connected";
            
        } catch(SQLException err) {
            
            this._status = "Disconnected";
            
            JOptionPane.showMessageDialog(null, err.getMessage());
        }
    }
    
    public Connection getConnection(){
        return this.conn;
    }
    
    
    public ResultSet runQuery(String _QUERY_) throws SQLException {

        return stmt.executeQuery(_QUERY_);
    }
    

    public int runQueryUpdate(String _QUERY_) throws SQLException {

        return stmt.executeUpdate(_QUERY_);
    }
    
    
    public static String get_date_with_format(String _format){
        
        java.util.Date _date = new java.util.Date();
        java.text.SimpleDateFormat _date_format = new java.text.SimpleDateFormat(_format);
        
        return _date_format.format(_date);
    }
    
    
    public static String get_date_with_format(String _format, java.util.Date _date){
        
        java.text.SimpleDateFormat _date_format = new java.text.SimpleDateFormat(_format);
        
        return _date_format.format(_date);
    }
    

    public static void popup_message(Object _message){
        javax.swing.JOptionPane.showMessageDialog(null, _message);
    }
    
    
    public static void popup_message(String _title, Object _message, int _message_type){
        javax.swing.JOptionPane.showMessageDialog(null, _message, _title, _message_type);
    }
    
    
    public static void print(Object _message){
        System.out.println(_message);
    }
}

