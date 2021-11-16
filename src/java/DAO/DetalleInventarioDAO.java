/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.ConexionDB;
import Interfaces.CRUDDetalleInventario;
import Modelos.DetalleInventario;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Tapir
 */
public class DetalleInventarioDAO implements CRUDDetalleInventario {

    //Variables
    private static String sql_selectAll = "select * from detalle_inventario";
    private static String sql_selectId = "select * from detalle_inventario where id_detalle_inventario = ?";
    private static String sql_selectIdProducto = "select * from detalle_inventario where id_producto_E = ?";
    private static String sql_insert = "insert into detalle_inventario ( cantidad_producto_inventario, id_ubicacion, id_inventario, id_producto_E,guia_despacho,n_compra) values (?,?,?,?,?,?)";
    private static String sql_delete = "delete from detalle_inventario where id_detalle_inventario = ?";
    private static String sql_update = "update detalle_inventario set cantidad_producto_inventario = ?, id_ubicacion = ?  where id_producto_E = ?";
    private static String sql_diferencia = "select di.id_detalle_inventario as id,(di.cantidad_producto_inventario - p.stock_minimo) as diferencia  from detalle_inventario di join producto_especifico pe on ( di.id_producto_E = pe.id_producto_E) join producto_generico p on(p.id_producto=pe.id_producto);";

    private static ConexionDB objConn = ConexionDB.InstanciaConn();
    private ResultSet rs;

    @Override
    public boolean agregarDetalleInventario(DetalleInventario objDetalleInventario) {
        PreparedStatement psI;
        try {
            psI = objConn.getConn().prepareStatement(sql_insert);
            psI.setInt(1, objDetalleInventario.getCantidad_producto_inventario());
            psI.setInt(2, objDetalleInventario.getId_ubicacion());
            psI.setInt(3, objDetalleInventario.getId_inventario());
            psI.setInt(4, objDetalleInventario.getId_producto_E());
            psI.setInt(5, objDetalleInventario.getGuia_despacho());
            psI.setInt(6, objDetalleInventario.getN_compra());

            if (psI.executeUpdate() > 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AreaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean editarDetalleInventario(DetalleInventario objDetalleInventario) {
        try {
            
            PreparedStatement PsU;
            
            PsU = objConn.getConn().prepareStatement(sql_update);
            PsU.setInt(1,objDetalleInventario.getCantidad_producto_inventario());
            PsU.setInt(2, objDetalleInventario.getId_ubicacion());           
            PsU.setInt(3, objDetalleInventario.getId_producto_E());
            
            if(PsU.executeUpdate()>0){
                return true;
            }
            
        } catch (SQLException ex) {
            System.out.println(ex.toString());
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }

        return false;
    }

    @Override
    public DetalleInventario eliminarDetalleInventario(DetalleInventario objDetalleInventario) {
        try {
            PreparedStatement PsD;
            
            PsD = objConn.getConn().prepareStatement(sql_delete);
            PsD.setInt(1, objDetalleInventario.getId_producto_E());
            if (PsD.executeUpdate() > 0) {
                return objDetalleInventario;
            }    
            
        } catch (SQLException ex) {
            Logger.getLogger(ProductoEspDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return objDetalleInventario;
    }

    
    
    
    public DetalleInventario buscarPorId(DetalleInventario objDetalleInventario) {

      try {
            DetalleInventario obj = new DetalleInventario();
            PreparedStatement psG;
            psG = objConn.getConn().prepareStatement(sql_selectId);
            psG.setInt(1, objDetalleInventario.getId_detalle_inventario());
            
            rs = psG.executeQuery();
            
            while(rs.next()){
               
                obj.setCantidad_producto_inventario(rs.getInt("cantidad_producto_inventario"));
                obj.setId_inventario(rs.getInt("id_inventario"));
                obj.setId_ubicacion(rs.getInt("id_ubicacion"));
                obj.setId_producto_E(rs.getInt("id_producto_E"));

            }
            
            return obj;
        } catch (SQLException ex) {
            System.out.println(ex);
            return null;
        }

    }
    
    public DetalleInventario buscarPorProductoE(DetalleInventario objDetalleInventario) {

     try {
            DetalleInventario obj = new DetalleInventario();
            PreparedStatement psG;
            psG = objConn.getConn().prepareStatement(sql_selectIdProducto);
            psG.setInt(1, objDetalleInventario.getId_producto_E());
            
            rs = psG.executeQuery();
            
            while(rs.next()){
               
                obj.setId_detalle_inventario(rs.getInt("id_detalle_inventario"));
                obj.setCantidad_producto_inventario(rs.getInt("cantidad_producto_inventario"));
                obj.setId_inventario(rs.getInt("id_inventario"));
                obj.setId_ubicacion(rs.getInt("id_ubicacion"));

            }
            
            return obj;
        } catch (SQLException ex) {
            Logger.getLogger(UbicacionDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }

    }
    
    

    @Override
    public ArrayList<DetalleInventario> listaDetalleInventario() {
        ArrayList<DetalleInventario> lista = new ArrayList<>();
        
        PreparedStatement PsL;
        try {
            PsL = objConn.getConn().prepareStatement(sql_selectAll);
            rs = PsL.executeQuery();
            while (rs.next()) {
                DetalleInventario ObjDetalle = new DetalleInventario();

                ObjDetalle.setId_detalle_inventario(rs.getInt("id_detalle_inventario"));
                ObjDetalle.setCantidad_producto_inventario(rs.getInt("cantidad_producto_inventario"));
                ObjDetalle.setId_ubicacion(rs.getInt("id_ubicacion"));
                ObjDetalle.setId_inventario(rs.getInt("id_inventario"));
                ObjDetalle.setId_producto_E(rs.getInt("id_producto_E"));

                lista.add(ObjDetalle);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return lista;
    }

    @Override
    public List buscar(String texto) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    //Correo
    
    public ArrayList<DetalleInventario> listadoStock(){
        
         ArrayList<DetalleInventario> lista = new ArrayList<>();
         PreparedStatement PsL;
         
         try {
            PsL = objConn.getConn().prepareStatement(sql_diferencia);
            rs = PsL.executeQuery();
            
             while (rs.next()) {
                  DetalleInventario ObjDetalle = new DetalleInventario();
                 if (rs.getInt("diferencia")<=0) {
                     ObjDetalle.setId_detalle_inventario(rs.getInt("id"));
                     
                     lista.add(ObjDetalle);
                 }
                 
             }
        } catch (Exception e) {
        }
    
         return lista;
    }
    
    
    public boolean checkStock(){
        
        DetalleInventarioDAO detalleDAO = new DetalleInventarioDAO(); 
        ArrayList<DetalleInventario> lista = detalleDAO.listadoStock();        
        
        if (lista.isEmpty()) {
            return false;
        } else {
            return true;
        }
        
        
    }
}
