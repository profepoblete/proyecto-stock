/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.ConexionDB;
import Interfaces.CRUDProductoEsp;
import Modelos.Menu;
import Modelos.ProductoEsp;
import java.io.File;
import java.io.FileInputStream;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author Sebastián Barría
 */
public class ProductoEspDAO implements CRUDProductoEsp{
    private static String sql_selectALLEsp = "select * from producto_especifico";
    private static String sql_InsertEsp = "insert into producto_especifico( id_producto, serial_producto,fecha_creacion,fecha_depreciacion) values (?,?,?,?)";
    private static String sql_selectProductoEsp = "select * from producto_especifico where id_producto_E = ?";
    private static String sql_updateEsp = "update producto_especifico set serial_producto = ?, fecha_depreciacion = ? where id_producto_E = ?";
    private static String sql_deleteEsp = "delete from producto_especifico where id_producto_E = ?";
    private static String sqlUltimo = "select * from producto_especifico where id_producto_E = (select max(id_producto_E) from producto_especifico)";
    private static String sql_checkAlerta = "select * from producto_especifico where alerta = true and enviado = false";
    
    private static ConexionDB objConn = ConexionDB.InstanciaConn();
    private ResultSet rs;
    

    @Override
    public ProductoEsp EliminarProductoEsp (ProductoEsp ObjProductoEsp){
        try {
            PreparedStatement PsD;
            
            PsD = objConn.getConn().prepareStatement(sql_deleteEsp);
            PsD.setInt(1, ObjProductoEsp.getId_producto_E());
            if (PsD.executeUpdate() > 0) {
                return ObjProductoEsp;
            }    
            
        } catch (SQLException ex) {
            Logger.getLogger(ProductoEspDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return ObjProductoEsp;
    
    }
    
    public ProductoEsp BuscarPorIdEsp (ProductoEsp ObjProductoEsp){
        try {
            ProductoEsp p = new ProductoEsp();
            PreparedStatement PsG;
            PsG = objConn.getConn().prepareStatement(sql_selectProductoEsp);
            PsG.setInt(1, ObjProductoEsp.getId_producto_E());
            
            
            rs = PsG.executeQuery();
            
            while (rs.next()){
            p.setId_producto_E(rs.getInt("id_producto_E"));
            p.setId_producto(rs.getInt("id_producto"));
            p.setSerial_producto(rs.getString("serial_producto"));
            p.setFecha_depreciacion(rs.getDate("fecha_depreciacion"));
            
            
            }
            
        return p;
        } catch (SQLException ex) {
            Logger.getLogger(ProductoEspDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        
        
    }
    
       public ProductoEsp UltimoId (){
        try {
            ProductoEsp p = new ProductoEsp();
            PreparedStatement PsG;
            PsG = objConn.getConn().prepareStatement(sqlUltimo);            
            
            
            rs = PsG.executeQuery();
            
            while (rs.next()){
            p.setId_producto_E(rs.getInt("id_producto_E"));
            p.setId_producto(rs.getInt("id_producto"));
            p.setSerial_producto(rs.getString("serial_producto"));
            p.setFecha_depreciacion(rs.getDate("fecha_depreciacion"));
            
            
            }
            
        return p;
        } catch (SQLException ex) {
            Logger.getLogger(ProductoEspDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    @Override
    public boolean AgregarProductoEsp(ProductoEsp ObjProductoEsp) {
        try {
            PreparedStatement PsI;
            PsI = objConn.getConn().prepareStatement(sql_InsertEsp);
            PsI.setInt(1, ObjProductoEsp.getId_producto());
            PsI.setString(2, ObjProductoEsp.getSerial_producto());
            PsI.setDate(3, ObjProductoEsp.getFecha_creacion());
            PsI.setDate(4, ObjProductoEsp.getFecha_depreciacion());
            System.out.println(""+PsI.executeUpdate());
            
            if (PsI.executeUpdate() > 0 ){
                return true;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(ProductoEspDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return false;
    }

    @Override
    public boolean EditarProductoEsp(ProductoEsp ObjProductoEsp) {
                try {
            PreparedStatement PsU;
            
            PsU = objConn.getConn().prepareStatement(sql_updateEsp);
            PsU.setString(1, ObjProductoEsp.getSerial_producto());
            PsU.setDate(2,ObjProductoEsp.getFecha_depreciacion());
            
            PsU.setInt(3, ObjProductoEsp.getId_producto_E());
            
            if (PsU.executeUpdate()> 0) {
                return true;
            }
        } catch (SQLException ex) {
            System.out.println(ex.toString());
            Logger.getLogger(ProductoEspDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return false;
    }

    @Override
    public ArrayList<ProductoEsp> ListarProductoEsp() {
        ArrayList<ProductoEsp> lstProductoEsps = new ArrayList<>();
        try {
          PreparedStatement PsL;
            PsL = objConn.getConn().prepareStatement(sql_selectALLEsp);
            rs = PsL.executeQuery();  
            while(rs.next()){
                ProductoEsp ObjProductoEsp = new ProductoEsp();
                
                ObjProductoEsp.setId_producto_E(rs.getInt("id_producto_E"));
                ObjProductoEsp.setId_producto(rs.getInt("id_producto"));
                ObjProductoEsp.setSerial_producto(rs.getString("serial_producto"));
                ObjProductoEsp.setFecha_creacion(rs.getDate("fecha_creacion"));
                ObjProductoEsp.setFecha_depreciacion(rs.getDate("fecha_depreciacion"));
                
                
                lstProductoEsps.add(ObjProductoEsp);
            }
            
            
            
        } catch (SQLException ex) {
            Logger.getLogger(ProductoEspDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lstProductoEsps;
    }

    @Override
    public List BuscarProductoEsp(String textoEsp) {
            List<ProductoEsp> listaEsp = new ArrayList<>();
        String sql_search = "SELECT * FROM producto_especifico WHERE "
                + "id_producto_E like '%" + textoEsp + "%' or id_producto like '%" + textoEsp + "%'"
                + " or serial_producto like '%" + textoEsp + "%'"
                + " or fecha_depreciacion like '%" + textoEsp + "%'";

        try {
            PreparedStatement PsB;
            PsB = objConn.getConn().prepareStatement(sql_search);
            rs = PsB.executeQuery();
            while (rs.next()) {
                ProductoEsp p = new ProductoEsp();
            p.setId_producto_E(rs.getInt("id_producto_E"));
            p.setId_producto(rs.getInt("id_producto"));
            p.setSerial_producto(rs.getString("serial_producto"));
            p.setFecha_depreciacion(rs.getDate("fecha_depreciacion"));

                listaEsp.add(p);
            }

        } catch (SQLException e) {
        }
        return listaEsp;
    }
    
    
    //Correos
       @Override
    public boolean CheckAlerta(){
        ArrayList<ProductoEsp> lstProductoEsp = new ArrayList<>();
        try {
          PreparedStatement Psk;
            Psk = objConn.getConn().prepareStatement(sql_checkAlerta);
            rs = Psk.executeQuery();  
            while(rs.next()){
                ProductoEsp ObjProductoEsp = new ProductoEsp();
                
                ObjProductoEsp.setId_producto_E(rs.getInt("id_producto_E"));
                ObjProductoEsp.setId_producto(rs.getInt("id_producto"));
                ObjProductoEsp.setSerial_producto(rs.getString("serial_producto"));
                ObjProductoEsp.setFecha_depreciacion(rs.getDate("fecha_depreciacion"));
                
                
                lstProductoEsp.add(ObjProductoEsp);
            }
            if(lstProductoEsp.isEmpty()){
                return false;
            }else{
                return true;
            }
            
            
        } catch (SQLException ex) {
            Logger.getLogger(ProductoEspDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return true;
    }
    
    @Override 
    public ArrayList<ProductoEsp> ProductosDepre(){
        ArrayList<ProductoEsp> lstProductoEs = new ArrayList<>();
        try { 
            PreparedStatement PsZ;
            PsZ = objConn.getConn().prepareStatement(sql_checkAlerta);
            rs = PsZ.executeQuery();
            while(rs.next()){
                ProductoEsp ObjProductoEsp = new ProductoEsp();
                
                ObjProductoEsp.setId_producto_E(rs.getInt("id_producto_E"));
                ObjProductoEsp.setId_producto(rs.getInt("id_producto"));
                ObjProductoEsp.setSerial_producto(rs.getString("serial_producto"));
                ObjProductoEsp.setFecha_depreciacion(rs.getDate("fecha_depreciacion"));
                
                
                lstProductoEs.add(ObjProductoEsp);                
            }
        } catch (SQLException ex) {
        Logger.getLogger(ProductoEspDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       
        return lstProductoEs;
    }
    
}
