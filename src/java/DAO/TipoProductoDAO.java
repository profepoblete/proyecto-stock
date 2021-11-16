/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.ConexionDB;
import Interfaces.CRUDTipoProducto;
import Modelos.TipoProducto;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Felipe
 */
public class TipoProductoDAO implements CRUDTipoProducto {
    private static String sql_selectAll = "select * from subtipo_producto";
    private static String sql_insert = "insert into subtipo_producto (	id_subtipo_producto, categoria_tipo_producto) values(?, ?)";
    private static String sql_delete = "delete from subtipo_producto where 	id_subtipo_producto = ?";
    private static String sql_selectTipo_producto = "select * from subtipo_producto where 	id_subtipo_producto = ?";
    private static String sql_update = "update subtipo_producto set categoria_tipo_producto = ? where 	id_subtipo_producto = ?";
    
    private static ConexionDB objConn = ConexionDB.InstanciaConn();
    private ResultSet rs;
    
    @Override
    public boolean agregarTipoProducto(TipoProducto objTipoProducto) {
        try {
        PreparedStatement psI;      
        psI = objConn.getConn().prepareStatement(sql_insert);
        psI.setInt(1, objTipoProducto.getId_tipo_producto());
        psI.setString(2, objTipoProducto.getCategoria_tipo_producto());
        
        if(psI.executeUpdate()>0){
                return true;    
            }
        
        } catch (SQLException ex) {
            Logger.getLogger(TipoProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
         
        return false;
        
        
    }

    @Override
    public boolean editarTipoProducto(TipoProducto objTipoProducto) {
        try {
            PreparedStatement psU;
            
            psU = objConn.getConn().prepareStatement(sql_update);
            
            psU.setString(1, objTipoProducto.getCategoria_tipo_producto());
            
            psU.setInt(2, objTipoProducto.getId_tipo_producto());
            
            if(psU.executeUpdate()>0){
                return true;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(TipoProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        
        return false; 
    }

    @Override
    public TipoProducto eliminarTipoProducto(TipoProducto objTipoProducto) {
        try {
            PreparedStatement psD;
            
            psD = objConn.getConn().prepareStatement(sql_delete);
            psD.setInt(1, objTipoProducto.getId_tipo_producto());
            if(psD.executeUpdate()>0){
                return objTipoProducto;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(TipoProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return objTipoProducto;
    }

    @Override
    public ArrayList<TipoProducto> listarTipoProducto() {
        ArrayList<TipoProducto> lstTipoProducto = new ArrayList<>();
        try{
            PreparedStatement psL;
            psL = objConn.getConn().prepareStatement(sql_selectAll);
            rs = psL.executeQuery();
            while(rs.next()){
                TipoProducto objTipoProducto = new TipoProducto();
                objTipoProducto.setId_tipo_producto(rs.getInt("id_subtipo_producto"));
                objTipoProducto.setCategoria_tipo_producto(rs.getString("categoria_tipo_producto"));

                
                lstTipoProducto.add(objTipoProducto);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TipoProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return lstTipoProducto;    
    }

    @Override
    public List buscar(String texto) {
      List<TipoProducto> lista = new ArrayList<>();
      String sql_search = "SELECT * FROM tipo_producto WHERE id_subtipo_producto like '%"+texto+"%' or categoria_tipo_producto like '%"+texto+"%'";
      
      try {
            PreparedStatement psB;
            psB = objConn.getConn().prepareStatement(sql_search);
            rs = psB.executeQuery();
            while(rs.next()){
                TipoProducto u = new TipoProducto();
                u.setId_tipo_producto(rs.getInt("id_subtipo_producto"));
                u.setCategoria_tipo_producto(rs.getString("categoria_tipo_producto"));

                lista.add(u);
            }
            
        } catch (SQLException e) {
        }
        return lista;
    }
    
    
    
    public TipoProducto buscarPorId(TipoProducto objTipoProducto) {
        try {
            TipoProducto p = new TipoProducto();
            PreparedStatement psG;
            psG = objConn.getConn().prepareStatement(sql_selectTipo_producto);
            psG.setInt(1, objTipoProducto.getId_tipo_producto());

            rs = psG.executeQuery();

            while (rs.next()) {
                p.setCategoria_tipo_producto(rs.getString("categoria_tipo_producto"));
            }
            return p;
        } catch (SQLException ex) {
            Logger.getLogger(TipoProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }

    }

}
