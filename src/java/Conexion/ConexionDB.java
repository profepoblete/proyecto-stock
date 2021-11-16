/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Felipe
 */
public class ConexionDB {
    public static ConexionDB InstConn;
    private Connection conn;
    
    public ConexionDB() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto_stock?zeroDateTimeBehavior=convertToNull", "root", "");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConexionDB.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ConexionDB.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
    public synchronized static ConexionDB InstanciaConn() {
        if (InstConn == null) {
            InstConn = new ConexionDB();
        }

        return InstConn;
    }

    public Connection getConn() {
        return conn;
    }

    public void Cerrar() {
        InstConn = null;
    }
    

}
