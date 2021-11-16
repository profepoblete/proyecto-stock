/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;


import Conexion.ConexionDB;
import Interfaces.CRUDInventario;
import Modelos.Inventario;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *s
 * @author Tapir
 */
public class InventarioDAO implements CRUDInventario{ // agregue abstract 
    
    //Variables
    private static String sql_selectAllNoFilter = "select * from inventario";
    private static String sql_selectAll = "select * from inventario where id_area = ?";
    private static String sql_selectBodega = "select * from inventario where id_inventario = ?";
    private static String sql_insert = "insert into inventario ( descripcion_inventario, id_area) values (?,?)";
    private static String sql_delete = "delete from inventario where id_inventario = ?";
    private static String sql_update = "update inventario set descripcion_inventario=?, id_area = ? where id_inventario = ?";

    private static ConexionDB objConn = ConexionDB.InstanciaConn();
    private ResultSet rs; 

    @Override
    public boolean agregarInventario(Inventario objInventario) {
        PreparedStatement psI;
        try {
            psI = objConn.getConn().prepareStatement(sql_insert);
            psI.setString(1, objInventario.getDescripcion_inventario());
            psI.setInt(2, objInventario.getId_area());           
            
            if (psI.executeUpdate()>0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AreaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean editarInventario(Inventario objInventario) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Inventario eliminarInventario(Inventario objInventario) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public ArrayList<Inventario> listaInventario(int area) {
         ArrayList<Inventario> lstInventario = new ArrayList<>();
        PreparedStatement psL;
        try {
            psL = objConn.getConn().prepareStatement(sql_selectAll);
            psL.setInt(1,area);
            rs = psL.executeQuery();
            while (rs.next()) {                
                Inventario objInventario = new Inventario();
                
                objInventario.setId_inventario(rs.getInt("id_inventario"));
                objInventario.setFecha_inventario(rs.getDate("fecha_inventario"));
                objInventario.setDescripcion_inventario(rs.getString("descripcion_inventario"));
                objInventario.setId_area(rs.getInt("id_area"));
                lstInventario.add(objInventario);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AreaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       return lstInventario;
    }

    @Override
    public List buscar(String texto) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public Inventario buscarxid(Inventario objInventario) {
        try {
            Inventario obj = new Inventario();
            PreparedStatement psG;
            psG = objConn.getConn().prepareStatement(sql_selectBodega);
            psG.setInt(1, objInventario.getId_inventario());
            
            rs = psG.executeQuery();
            
            while(rs.next()){
               
                obj.setId_area(rs.getInt("id_area"));
                obj.setDescripcion_inventario(rs.getString("Descripcion_inventario"));
                obj.setFecha_inventario(rs.getDate("Fecha_inventario"));
                obj.setId_inventario(rs.getInt("Id_inventario"));

            }
            
            return obj;
        } catch (SQLException ex) {
            Logger.getLogger(UbicacionDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    @Override
    public ArrayList<Inventario> listaInventario() {
        ArrayList<Inventario> lstInventario = new ArrayList<>();
        PreparedStatement psL;
        try {
            psL = objConn.getConn().prepareStatement(sql_selectAllNoFilter);
            rs = psL.executeQuery();
            while (rs.next()) {                
                Inventario objInventario = new Inventario();
                
                objInventario.setId_inventario(rs.getInt("id_inventario"));
                objInventario.setFecha_inventario(rs.getDate("fecha_inventario"));
                objInventario.setDescripcion_inventario(rs.getString("descripcion_inventario"));
                objInventario.setId_area(rs.getInt("id_area"));
                lstInventario.add(objInventario);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AreaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lstInventario;
    }
    
}
