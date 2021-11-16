/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conexion;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Felipe
 */
public class Consultas extends ConexionDB{
    public boolean autenticacion(String rut_usuario, String password_usuario){
        PreparedStatement pst = null;
        ResultSet rs = null;
        
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
