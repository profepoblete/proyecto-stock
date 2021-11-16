/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.ConexionDB;
import Interfaces.CRUDTipoUsuario;
import Modelos.TipoUsuario;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Diego
 */
public class TipoUsuarioDAO implements CRUDTipoUsuario{
    private static String sql_selectAll = "select * from tipo_usuario";
    private static String sql_insert = "insert into tipo_usuario (id_tipo_usuario, categoria_tipo_usuario) values(?, ?)";
    private static String sql_delete = "delete from tipo_usuario where id_tipo_usuario = ?";
    private static String sql_selectTipoUsuario = "select * from tipo_usuario where id_tipo_usuario = ?";
    private static String sql_update = "update tipo_usuario set categoria_tipo_usuario = ? where id_tipo_usuario = ?";
    
    private static ConexionDB objConn = ConexionDB.InstanciaConn();
    private ResultSet rs;    

    @Override
    public boolean agregarTipoUsuario(TipoUsuario objTipoUsuario) {
        try {
        PreparedStatement psI;      
        psI = objConn.getConn().prepareStatement(sql_insert);
        psI.setInt(1, objTipoUsuario.getId_tipo_usuario());
        psI.setString(2, objTipoUsuario.getCategoria_tipo_usuario());
        
        if(psI.executeUpdate()>0){
                return true;    
            }
        
        } catch (SQLException ex) {
            Logger.getLogger(TipoUsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
         
        return false;
    }

    @Override
    public boolean editarTipoUsuario(TipoUsuario objTipoUsuario) {
                try {
            PreparedStatement psU;
            
            psU = objConn.getConn().prepareStatement(sql_update);
            
            psU.setString(1, objTipoUsuario.getCategoria_tipo_usuario());
            psU.setInt(2, objTipoUsuario.getId_tipo_usuario());
            
            if(psU.executeUpdate()>0){
                return true;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(TipoUsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        
        return false;
    }

    @Override
    public TipoUsuario eliminarTipoUsuario(TipoUsuario objTipoUsuario) {
        try {
            PreparedStatement psD;
            
            psD = objConn.getConn().prepareStatement(sql_delete);
            psD.setInt(1, objTipoUsuario.getId_tipo_usuario());
            if(psD.executeUpdate()>0){
                return objTipoUsuario;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(TipoUsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return objTipoUsuario;
    }

    @Override
    public ArrayList<TipoUsuario> listarTipoUsuario() {
        ArrayList<TipoUsuario> lstTipoUsuario = new ArrayList<>();
        try{
            PreparedStatement psL;
            psL = objConn.getConn().prepareStatement(sql_selectAll);
            rs = psL.executeQuery();
            while(rs.next()){
                TipoUsuario objTipoUsuario = new TipoUsuario();
                objTipoUsuario.setId_tipo_usuario(rs.getInt("id_tipo_usuario"));
                objTipoUsuario.setCategoria_tipo_usuario(rs.getString("categoria_tipo_usuario"));
                
                lstTipoUsuario.add(objTipoUsuario);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TipoUsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return lstTipoUsuario;   
    }
    
    public List buscar(String texto) {
        List<TipoUsuario> lista = new ArrayList<>();
        String sql_search = "select * from tipo_usuario where categoria_tipo_usuario like '%"+texto+"%'";
        
        try {
            PreparedStatement psB;
            psB = objConn.getConn().prepareStatement(sql_search);
            rs = psB.executeQuery();
            while(rs.next()){
                TipoUsuario tu = new TipoUsuario();
                tu.setId_tipo_usuario(rs.getInt("id_tipo_usuario"));
                tu.setCategoria_tipo_usuario(rs.getString("categoria_tipo_usuario"));
                lista.add(tu);
            }
            
        } catch (Exception e) {
        }
        return lista;
    }
    
    public TipoUsuario buscarTipoUsuarioPorId(TipoUsuario objTipoUsuario){
        try {
            TipoUsuario tp = new TipoUsuario();
            PreparedStatement psG;
            psG = objConn.getConn().prepareStatement(sql_selectTipoUsuario);
            psG.setInt(1, objTipoUsuario.getId_tipo_usuario());
            
            rs = psG.executeQuery();
            
            while(rs.next()){
                tp.setId_tipo_usuario(rs.getInt("id_tipo_usuario"));
                tp.setCategoria_tipo_usuario(rs.getString("categoria_tipo_usuario"));
            }
            
            return tp;
        } catch (SQLException ex) {
            Logger.getLogger(TipoUsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
}
