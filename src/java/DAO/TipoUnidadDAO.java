/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.ConexionDB;
import Interfaces.CRUDTipoUnidad;
import Modelos.TipoUnidad;
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
public class TipoUnidadDAO implements CRUDTipoUnidad{
    private static String sql_selectAll = "select * from tipo_unidad";
    private static String sql_insert = "insert into tipo_unidad (id_tipo_unidad, nombre_unidad) values(?, ?)";
    private static String sql_delete = "delete from tipo_unidad where id_tipo_unidad = ?";
    private static String sql_selectTipo_unidad = "select * from tipo_unidad where id_tipo_unidad = ?";
    private static String sql_update = "update tipo_unidad set nombre_unidad = ? where id_tipo_unidad = ?";
    
    private static ConexionDB objConn = ConexionDB.InstanciaConn();
    private ResultSet rs;
    
    @Override
    public boolean agregarTipoUnidad(TipoUnidad objTipoUnidad) {
        try {
        PreparedStatement psI;      
        psI = objConn.getConn().prepareStatement(sql_insert);
        psI.setInt(1, objTipoUnidad.getId_tipo_unidad());
        psI.setString(2, objTipoUnidad.getNombre_unidad());
        
        if(psI.executeUpdate()>0){
                return true;    
            }
        
        } catch (SQLException ex) {
            Logger.getLogger(TipoUnidadDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
         
        return false;
    }

    @Override
    public boolean editarTipoUnidad(TipoUnidad objTipoUnidad) {
        try {
            PreparedStatement psU;
            
            psU = objConn.getConn().prepareStatement(sql_update);
            
            psU.setString(1, objTipoUnidad.getNombre_unidad());
            
            psU.setInt(2, objTipoUnidad.getId_tipo_unidad());  
            
            if(psU.executeUpdate()>0){
                return true;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(TipoUnidadDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        
        return false; 
    }

    @Override
    public TipoUnidad eliminarTipoUnidad(TipoUnidad objTipoUnidad) {
        try {
            PreparedStatement psD;
            
            psD = objConn.getConn().prepareStatement(sql_delete);
            psD.setInt(1, objTipoUnidad.getId_tipo_unidad());
            if(psD.executeUpdate()>0){
                return objTipoUnidad;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(TipoUnidadDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return objTipoUnidad;
    }

    @Override
    public ArrayList<TipoUnidad> listarTipoUnidad() {
        ArrayList<TipoUnidad> lstTipoUnidad = new ArrayList<>();
        try{
            PreparedStatement psL;
            psL = objConn.getConn().prepareStatement(sql_selectAll);
            rs = psL.executeQuery();
            while(rs.next()){
                TipoUnidad objTipoUnidad = new TipoUnidad();
                objTipoUnidad.setId_tipo_unidad(rs.getInt("id_tipo_unidad"));
                objTipoUnidad.setNombre_unidad(rs.getString("nombre_unidad"));

                
                lstTipoUnidad.add(objTipoUnidad);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TipoUnidadDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return lstTipoUnidad;    
    }

    @Override
    public List buscar(String texto) {
        List<TipoUnidad> lista = new ArrayList<>();
      String sql_search = "select * from tipo_unidad where id_tipo_unidad like '%"+texto+"%' or nombre_unidad like '%"+texto+"%'";
      
      try {
            PreparedStatement psB;
            psB = objConn.getConn().prepareStatement(sql_search);
            rs = psB.executeQuery();
            while(rs.next()){
                TipoUnidad u = new TipoUnidad();
                u.setId_tipo_unidad(rs.getInt("id_tipo_unidad"));
                u.setNombre_unidad(rs.getString("nombre_unidad"));

                lista.add(u);
            }
            
        } catch (SQLException e) {
        }
        return lista;
    }
    
    public TipoUnidad buscarPorId(TipoUnidad objTipoUnidad) {
        try {
            TipoUnidad p = new TipoUnidad();
            PreparedStatement psG;
            psG = objConn.getConn().prepareStatement(sql_selectTipo_unidad);
            psG.setInt(1, objTipoUnidad.getId_tipo_unidad());

            rs = psG.executeQuery();

            while (rs.next()) {
                p.setNombre_unidad(rs.getString("nombre_unidad"));
            }
            return p;
        } catch (SQLException ex) {
            Logger.getLogger(TipoUnidadDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }

    } 

}
