/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.ConexionDB;
import Modelos.Menu;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Felipe
 */
public class Consultas extends ConexionDB{
        PreparedStatement pst = null;
        ResultSet rs = null;
    public boolean autenticacion(String rut_usuario, String password_usuario){
        
        try {
            String consulta = "select * from usuario where rut_usuario = ? and password_usuario = ?";
            pst = getConn().prepareStatement(consulta);
            pst.setString(1,rut_usuario);
            pst.setString(2,password_usuario);
            rs = pst.executeQuery();
            
            if(rs.next()){
                return true;
            }
        } catch (SQLException e) {
            System.err.println("Error"+e);
        }finally{
            try {
                if(getConn() != null) getConn().close();
                if(pst != null) pst.close();
                if(rs != null) rs.close();
            } catch (SQLException e) {
                System.err.println("Error"+e);
            }
        }
        return false;
    }
    
       
    
}
