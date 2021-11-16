/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.ConexionDB;
import Interfaces.CRUDTipoUbicacion;
import Modelos.Menu;
import Modelos.TipoUbicacion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author José Pablo
 */
public class TipoUbicacionDAO implements CRUDTipoUbicacion{

    private static String sql_selectAll = "select * from tipo_ubicacion";
    private static String sql_selectTipoUbicacon = "select * from tipo_ubicacion where id_tipo_ubicacion = ?";
    private static String sql_insert = "insert into tipo_ubicacion (id_tipo_ubicacion, nombre_tipo_ubicacion)  VALUES (?,?)";
    private static String sql_delete = "delete from tipo_ubicacion where id_tipo_ubicacion = ?";
    private static String sql_update = "update tipo_ubicacion set nombre_tipo_ubicacion = ? WHERE id_tipo_ubicacion = ?";
    
    private static ConexionDB objConn = ConexionDB.InstanciaConn();
    private ResultSet rs; 
    
    @Override
    public boolean agregarTipoUbicaion(TipoUbicacion objTipoUbicacion) {
        PreparedStatement psI;
        try {
            psI = objConn.getConn().prepareStatement(sql_insert);
            psI.setInt(1, objTipoUbicacion.getId_tipo_ubicacion());
            psI.setString(2, objTipoUbicacion.getNombre_tipo_ubicacion());
          
            
            if (psI.executeUpdate()>0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AreaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean editarTipoUbicacion(TipoUbicacion objTipoUbicacion) {
        PreparedStatement psU;
        try {
            psU = objConn.getConn().prepareStatement(sql_update);            
            
            psU.setString(1, objTipoUbicacion.getNombre_tipo_ubicacion());
            psU.setInt(2, objTipoUbicacion.getId_tipo_ubicacion());
            
            if (psU.executeUpdate()>0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AreaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
            return false;
    }

    @Override
    public TipoUbicacion eliminarTipoUbicacion(TipoUbicacion objTipoUbicacion) {
        PreparedStatement psD;
        try {
            psD = objConn.getConn().prepareStatement(sql_delete);
            psD.setInt(1, objTipoUbicacion.getId_tipo_ubicacion());
            
            if (psD.executeUpdate()>0) {
                return null;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AreaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
         return objTipoUbicacion;
    }

    @Override
    public ArrayList<TipoUbicacion> listaTipoUbicacion() {
        ArrayList<TipoUbicacion> lstTipoUbicacion = new ArrayList<>();
        PreparedStatement psL;
        try {
            psL = objConn.getConn().prepareStatement(sql_selectAll);
            rs = psL.executeQuery();
            while (rs.next()) {                
                TipoUbicacion objTipoUbicacion = new TipoUbicacion();
                
                objTipoUbicacion .setId_tipo_ubicacion(rs.getInt("id_tipo_ubicacion"));
                objTipoUbicacion .setNombre_tipo_ubicacion(rs.getString("nombre_tipo_ubicacion"));
                
                lstTipoUbicacion .add(objTipoUbicacion );
            }
        } catch (SQLException ex) {
            Logger.getLogger(AreaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       return lstTipoUbicacion;
    }
    
    public TipoUbicacion buscarPorId(TipoUbicacion objTipoUbicacion){
    TipoUbicacion tU = new TipoUbicacion();
    PreparedStatement psG;
        try {
            psG = objConn.getConn().prepareStatement(sql_selectTipoUbicacon);
            psG.setInt(1, objTipoUbicacion.getId_tipo_ubicacion());
            rs = psG.executeQuery();
            
            while (rs.next()) {                
                tU.setId_tipo_ubicacion(Integer.parseInt(rs.getString("id_tipo_ubicacion")));
                tU.setNombre_tipo_ubicacion(rs.getString("nombre_tipo_ubicacion"));
                
            }
            return tU;
        } catch (SQLException ex) {
            Logger.getLogger(AreaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    return null;
    }

    @Override
    public List buscar(String texto) {
        List<TipoUbicacion>  lista = new ArrayList<>();
               int texto2 = 0;
        if(texto.equalsIgnoreCase("Administrador")){
            texto2 = 1;
        }else if(texto.equalsIgnoreCase("Operador")){
            texto2 = 2;
        }
        
        String sql_search = "select * from tipo_ubicacion where id_tipo_ubicacion like '%"+texto+"%' or nombre_tipo_ubicacion like '%"+texto+"%'";
        
        PreparedStatement psB;
        try {
            psB = objConn.getConn().prepareStatement(sql_search);
            rs = psB.executeQuery();
        while (rs.next()) {            
            TipoUbicacion tipo = new TipoUbicacion();
            tipo.setId_tipo_ubicacion(rs.getInt("id_tipo_ubicacion"));
            tipo.setNombre_tipo_ubicacion(rs.getString("nombre_tipo_ubicacion"));
           
            lista.add(tipo);
        }
        } catch (SQLException ex) {
            Logger.getLogger(AreaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    
   
    
}
