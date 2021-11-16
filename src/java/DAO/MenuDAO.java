/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.ConexionDB;
import Interfaces.CRUDMenu;
import Modelos.Menu;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Diego
 */
public class MenuDAO implements CRUDMenu{
    private static String sql_selectAll = "select * from menu";
    private static String sql_insert = "insert into menu (id_menu, nombre_menu, url_menu, id_menu_padre) values(?, ?, ?, ?)";
    private static String sql_delete = "delete from menu where id_menu = ?";
    private static String sql_selectMenu = "select * from menu where id_menu = ?";
    private static String sql_update = "update menu set nombre_menu = ?, url_menu = ?, id_menu_padre = ? where id_menu = ?";
    
    private static ConexionDB objConn = ConexionDB.InstanciaConn();
    private ResultSet rs;

    @Override
    public boolean agregarMenu(Menu objMenu) {
        try {
        PreparedStatement psI;      
        psI = objConn.getConn().prepareStatement(sql_insert);
        psI.setInt(1, objMenu.getId_menu());
        psI.setString(2, objMenu.getNombre_menu());
        psI.setString(3, objMenu.getUrl_menu());
        if(objMenu.getId_menu_padre()==1){
            psI.setNull(4, java.sql.Types.INTEGER);
        }else{
            psI.setInt(4, objMenu.getId_menu_padre());
        }
        
        
        if(psI.executeUpdate()>0){
                return true;    
            }
        
        } catch (SQLException ex) {
            Logger.getLogger(MenuDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
         
        return false;
    }

    @Override
    public boolean editarMenu(Menu objMenu) {
        try{
            PreparedStatement psU;
            
            psU = objConn.getConn().prepareStatement(sql_update);
            
            psU.setString(1, objMenu.getNombre_menu());
            psU.setString(2, objMenu.getUrl_menu());
            if(objMenu.getId_menu_padre()==1){
                psU.setNull(3, java.sql.Types.INTEGER);
            }else{
                psU.setInt(3, objMenu.getId_menu_padre());
            }
            psU.setInt(4, objMenu.getId_menu());
            
            
            if(psU.executeUpdate()>0){
                return true;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(MenuDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        
        return false;
    }

    @Override
    public Menu eliminarMenu(Menu objMenu) {
        try {
            
            PreparedStatement psD;
            
            psD = objConn.getConn().prepareStatement(sql_delete);
            psD.setInt(1, objMenu.getId_menu());
            if(psD.executeUpdate()>0){
                return objMenu;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(MenuDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return objMenu;
    }

    @Override
    public ArrayList<Menu> listarMenu() {
        ArrayList<Menu> lstMenu = new ArrayList<>();
        try{
            PreparedStatement psL;
            psL = objConn.getConn().prepareStatement(sql_selectAll);
            rs = psL.executeQuery();
            while(rs.next()){
                Menu objMenu = new Menu();
                objMenu.setId_menu(rs.getInt("id_menu"));
                objMenu.setNombre_menu(rs.getString("nombre_menu"));
                objMenu.setUrl_menu(rs.getString("url_menu"));
                objMenu.setId_menu_padre(rs.getInt("id_menu_padre"));
                
                lstMenu.add(objMenu);
            }
        } catch (SQLException ex) {
            Logger.getLogger(MenuDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return lstMenu;
    }
    
    public Menu buscarMenuPorId(Menu objMenu){
        try {
            Menu m = new Menu();
            PreparedStatement psG;
            psG = objConn.getConn().prepareStatement(sql_selectMenu);
            psG.setInt(1, objMenu.getId_menu());
            
            rs = psG.executeQuery();
            
            while(rs.next()){
                m.setId_menu(rs.getInt("id_menu"));
                m.setNombre_menu(rs.getString("nombre_menu"));
                m.setUrl_menu(rs.getString("url_menu"));
                m.setId_menu_padre(rs.getInt("id_menu_padre"));
            }
            
            return m;
        } catch (SQLException ex) {
            Logger.getLogger(MenuDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    public ArrayList buscar(String texto) {
        if(texto.equalsIgnoreCase("No Aplica")){
            texto = "";
        }
        ArrayList<Menu> lista = new ArrayList<>();
        String sql_search = "select * from menu where nombre_menu like '%"+texto+"%' or url_menu like '%"+texto+"%'";
        
        try {
            PreparedStatement psB;
            psB = objConn.getConn().prepareStatement(sql_search);
            rs = psB.executeQuery();
            while(rs.next()){
                Menu m = new Menu();
                m.setId_menu(rs.getInt("id_menu"));
                m.setNombre_menu(rs.getString("nombre_menu"));
                m.setUrl_menu(rs.getString("url_menu"));
                m.setId_menu_padre(rs.getInt("id_menu_padre"));
                lista.add(m);
            }
            
        } catch (Exception e) {
        }
        return lista;
    }
    
}
