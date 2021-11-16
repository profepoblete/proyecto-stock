  /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.ConexionDB;
import Interfaces.CRUDTipoMenu;
import Modelos.Menu;
import Modelos.TipoMenu;
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
public class TipoMenuDAO implements CRUDTipoMenu{
    private static String sql_selectAll = "select * from tipo_menu";
    private static String sql_insert = "insert into tipo_menu (id_tipo_menu, id_menu, id_tipo_usuario) values(?, ?, ?)";
    private static String sql_delete = "delete from tipo_menu where id_tipo_menu = ?";
    private static String sql_selectTipoMenu = "select * from tipo_menu where id_tipo_usuario = ? order by id_menu";
    private static String sql_update = "update tipo_menu set id_menu = ?, id_tipo_usuario = ? where id_tipo_menu = ?";

    private static ConexionDB objConn = ConexionDB.InstanciaConn();
    private ResultSet rs;
    
    @Override
    public boolean agregarTipoMenu(TipoMenu objTipoMenu) {
        try {
        PreparedStatement psI;      
        psI = objConn.getConn().prepareStatement(sql_insert);
        psI.setInt(1, objTipoMenu.getId_tipo_menu());
        psI.setInt(2, objTipoMenu.getId_menu());
        psI.setInt(3, objTipoMenu.getId_tipo_usuario());
        
        if(psI.executeUpdate()>0){
                return true;    
            }
        
        } catch (SQLException ex) {
            Logger.getLogger(TipoMenuDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
         
        return false;
    }

    @Override
    public boolean editarTipoMenu(TipoMenu objTipoMenu) {
        try{
            PreparedStatement psU;
            
            psU = objConn.getConn().prepareStatement(sql_update);
            
            psU.setInt(1, objTipoMenu.getId_menu());
            psU.setInt(2, objTipoMenu.getId_tipo_usuario());
            psU.setInt(3, objTipoMenu.getId_tipo_menu());
            
            if(psU.executeUpdate()>0){
                return true;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(TipoMenuDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        
        return false;
    }

    @Override
    public TipoMenu eliminarTipoMenu(TipoMenu objTipoMenu) {
        try {
            
            PreparedStatement psD;
            
            psD = objConn.getConn().prepareStatement(sql_delete);
            psD.setInt(1, objTipoMenu.getId_tipo_menu());
            if(psD.executeUpdate()>0){
                return objTipoMenu;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(TipoMenuDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return objTipoMenu;
    }

    @Override
    public ArrayList<TipoMenu> listarTipoMenu() {
        ArrayList<TipoMenu> lstTipoMenu = new ArrayList<>();
        try{
            PreparedStatement psL;
            psL = objConn.getConn().prepareStatement(sql_selectAll);
            rs = psL.executeQuery();
            while(rs.next()){
                TipoMenu objTipoMenu = new TipoMenu();
                objTipoMenu.setId_tipo_menu(rs.getInt("id_tipo_menu"));
                objTipoMenu.setId_menu(rs.getInt("id_menu"));
                objTipoMenu.setId_tipo_usuario(rs.getInt("id_tipo_usuario"));
                
                lstTipoMenu.add(objTipoMenu);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TipoMenuDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return lstTipoMenu;
    }
    
    public ArrayList<TipoMenu> buscarTipoMenuPorId(TipoMenu objTipoMenu){
        ArrayList<TipoMenu> lstTipoMenuXUsuario = new ArrayList<>();
        try {
            PreparedStatement psG;
            psG = objConn.getConn().prepareStatement(sql_selectTipoMenu);
            psG.setInt(1, objTipoMenu.getId_tipo_usuario());
            
            rs = psG.executeQuery();
            
            while(rs.next()){
                TipoMenu tm = new TipoMenu();
                tm.setId_tipo_menu(rs.getInt("id_tipo_menu"));
                tm.setId_menu(rs.getInt("id_menu"));
                tm.setId_tipo_usuario(rs.getInt("id_tipo_usuario"));
                lstTipoMenuXUsuario.add(tm);
            }
            
            return lstTipoMenuXUsuario;
        } catch (SQLException ex) {
            Logger.getLogger(TipoMenuDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    public List buscar(String texto) {
        List<TipoMenu> lista = new ArrayList<>();
        ArrayList<TipoMenu> lstTipoMenu = listarTipoMenu();
        TipoMenu objTipoMenu = new TipoMenu();
        Menu objMenu2 = new Menu();
        MenuDAO objMenuDAO = new MenuDAO();
        int idTexto = 0;
        for (TipoMenu tipoMenu : lstTipoMenu) {
            int id = tipoMenu.getId_menu();
            objMenu2.setId_menu(id);
            objMenu2 = objMenuDAO.buscarMenuPorId(objMenu2);
            if(texto.equalsIgnoreCase(objMenu2.getNombre_menu())){
                idTexto = objMenu2.getId_menu();
                String sql_search = "select * from tipo_menu where id_menu like '%"+idTexto+"%'";
                try {
                    PreparedStatement psB;
                    psB = objConn.getConn().prepareStatement(sql_search);
                    rs = psB.executeQuery();
                    while(rs.next()){
                        TipoMenu tm = new TipoMenu();
                        tm.setId_tipo_menu(rs.getInt("id_tipo_menu"));
                        tm.setId_menu(rs.getInt("id_menu"));
                        tm.setId_tipo_usuario(rs.getInt("id_tipo_usuario"));
                        lista.add(tm);
                    }

                } catch (Exception e) {
                }
            }
        }
        
        return lista;
    }
}
