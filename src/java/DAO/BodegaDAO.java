/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.ConexionDB;
import Interfaces.CRUDBodega;
import Modelos.Bodega;
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
public class BodegaDAO implements CRUDBodega{

    private static String sql_selectAll = "select * from inventario";
    private static String sql_selectBodega = "select * from bodega where codigo_bodega = ?";
    private static String sql_insert = "insert into bodega (codigo_bodega, volumen_bodega, ubicacion_bodega, codigo_centro_costo) values (?,?,?,?)";
    private static String sql_delete = "delete from bodega where codigo_bodega = ?";
    private static String sql_update = "update bodega set volumen_bodega= ?, ubicacion_bodega= ?, codigo_centro_costo = ? where codigo_bodega = ?";
    
     private static ConexionDB objConn = ConexionDB.InstanciaConn();
    private ResultSet rs; 
    @Override
    public boolean agregarbodega(Bodega objBodega) {
       PreparedStatement psI;
        try {
            psI = objConn.getConn().prepareStatement(sql_insert);
            psI.setString(1, objBodega.getCodigo_bodega());
            psI.setInt(2, objBodega.getVolumen_bodega());
            psI.setString(3, objBodega.getUbicacion_bodega());
            psI.setString(4, objBodega.getCodigo_centro_costo());
            
            if (psI.executeUpdate()>0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AreaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean editarBodega(Bodega objBodega) {
       PreparedStatement psU;
        try {
            psU = objConn.getConn().prepareStatement(sql_update);                        
            psU.setInt(1, objBodega.getVolumen_bodega());
            psU.setString(2, objBodega.getUbicacion_bodega());
            psU.setString(3, objBodega.getCodigo_centro_costo());
            psU.setString(4, objBodega.getCodigo_bodega());
            
            if (psU.executeUpdate()>0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AreaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
            return false;
    }

    @Override
    public Bodega eliminarBodega(Bodega objBodega) {
         PreparedStatement psD;
        try {
            psD = objConn.getConn().prepareStatement(sql_delete);
            psD.setString(1, objBodega.getCodigo_bodega());
            
            if (psD.executeUpdate()>0) {
                return null;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AreaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
         return objBodega;
    }

    @Override
    public ArrayList<Modelos.Bodega> listaBodega() {
           ArrayList<Bodega> lstBodega = new ArrayList<>();
        PreparedStatement psL;
        try {
            psL = objConn.getConn().prepareStatement(sql_selectAll);
            rs = psL.executeQuery();
            while (rs.next()) {                
                Bodega objBodega = new Bodega();
                
                objBodega.setCodigo_bodega(rs.getString("codigo_bodega"));
                objBodega.setVolumen_bodega(rs.getInt("volumen_bodega"));
                objBodega.setUbicacion_bodega(rs.getString("ubicacion_bodega"));
                objBodega.setCodigo_centro_costo(rs.getString("codigo_centro_costo"));
                lstBodega.add(objBodega);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AreaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       return lstBodega;
    }

    @Override
    public List buscar(String texto) {
        List<Bodega>  lista = new ArrayList<>();
               int texto2 = 0;
        if(texto.equalsIgnoreCase("Administrador")){
            texto2 = 1;
        }else if(texto.equalsIgnoreCase("Operador")){
            texto2 = 2;
        }
        
        String sql_search = "select * from bodega where codigo_bodega like '%"+texto+"%' or volumen_bodega like '%"+texto+"%' or ubicacion_bodega like '%"+texto+"%' or codigo_centro_costo like '%"+texto+"%'";
        
        PreparedStatement psB;
        try {
            psB = objConn.getConn().prepareStatement(sql_search);
            rs = psB.executeQuery();
        while (rs.next()) {            
            Bodega b = new Bodega();
            b.setCodigo_bodega(rs.getString("codigo_bodega"));
            b.setVolumen_bodega(rs.getInt("volumen_bodega"));
            b.setUbicacion_bodega(rs.getString("ubicacion_bodega"));
            b.setCodigo_centro_costo(rs.getString("codigo_centro_costo"));
            lista.add(b);
        }
        } catch (SQLException ex) {
            Logger.getLogger(AreaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    
    public Bodega buscarPorId(Bodega objBodega){
    Bodega b = new Bodega();
    PreparedStatement psG;
        try {
            psG = objConn.getConn().prepareStatement(sql_selectBodega);
            psG.setString(1, objBodega.getCodigo_bodega());
            rs = psG.executeQuery();
            
            while (rs.next()) {                
                b.setCodigo_bodega(rs.getString("codigo_bodega"));
                b.setVolumen_bodega(rs.getInt("volumen_bodega"));
                b.setUbicacion_bodega(rs.getString("ubicacion_bodega"));
                b.setCodigo_centro_costo(rs.getString("codigo_centro_costo"));
            }
            return b;
        } catch (SQLException ex) {
            Logger.getLogger(AreaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    return null;
    }
    
}
