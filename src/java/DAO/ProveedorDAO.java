/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.ConexionDB;
import Interfaces.CRUDProveedor;
import Modelos.Menu;
import Modelos.Proveedor;
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
public class ProveedorDAO implements CRUDProveedor{

    private static String sql_selectAll = "select * from proveedor";
    private static String sql_selectProveedor = "select * from proveedor where rut_proveedor = ?";
    private static String sql_insert = "insert into proveedor (rut_proveedor, nombre_proveedor, razonSocial_proveedor, correo_proveedor, direccion_proveedor, fono_proveedor, id_comuna) VALUES(?,?,?,?,?,?,?)"; //borre "estado_proveedor" que venia despues del fono y un ",?" *y* el "id_proveedor" que es auto + ",?"
    private static String sql_delete = "delete from proveedor WHERE id_proveedor = ?";
    private static String sql_update = "update proveedor set rut_proveedor = ?, nombre_proveedor = ?,razonSocial_proveedor = ?,correo_proveedor = ? ,direccion_proveedor = ?,fono_proveedor = ?, id_comuna = ? WHERE id_proveedor = ?"; //borre "estado_proveedor = ?" despues del fono
    
    private static ConexionDB objConn = ConexionDB.InstanciaConn();
    private ResultSet rs;  
    
    @Override
    public boolean agregarProveedor(Proveedor objProveedor) {
    PreparedStatement psI;
        try {
            psI = objConn.getConn().prepareStatement(sql_insert);
            //psI.setInt(1, objProveedor.getId_proveedor());
            psI.setString(1, objProveedor.getRut_proveedor());
            psI.setString(2, objProveedor.getNombre_proveedor());
            psI.setString(3, objProveedor.getRazon_social_proveedor());
            psI.setString(4, objProveedor.getCorreo_proveedor());
            psI.setString(5, objProveedor.getDireccion_proveedor());
            psI.setString(6, objProveedor.getFono_proveedor());
            //psI.setString(8, objProveedor.getEstado_proveedor());
            psI.setInt(7, objProveedor.getId_comuna());
            
            if (psI.executeUpdate()>0) {
                return true;
            }
            
            
        } catch (SQLException ex) {
            Logger.getLogger(ProveedorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean editarProveedor(Proveedor objProveedor) {
        PreparedStatement psU;
        try {
            psU = objConn.getConn().prepareStatement(sql_update);
            psU.setString(1, objProveedor.getRut_proveedor());
            psU.setString(2, objProveedor.getNombre_proveedor());
            psU.setString(3, objProveedor.getRazon_social_proveedor());
            psU.setString(4, objProveedor.getCorreo_proveedor());
            psU.setString(5, objProveedor.getDireccion_proveedor());
            psU.setString(6, objProveedor.getFono_proveedor());
            //psU.setString(7, objProveedor.getEstado_proveedor()); este era 7 y el de abajo 8
            psU.setInt(7, objProveedor.getId_comuna());// el de abajo era 9 
            psU.setInt(8, objProveedor.getId_proveedor());
            
            if (psU.executeUpdate()>0) {
                return true;
            }
            
            
        } catch (SQLException ex) {
            Logger.getLogger(ProveedorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public Proveedor eliminarProveedor(Proveedor objProveedor) {
       PreparedStatement psD;
        try {
            psD = objConn.getConn().prepareStatement(sql_delete);
            psD.setInt(1, objProveedor.getId_proveedor());
                        
            if (psD.executeUpdate()>0) {
                return null;
            }
            
            
        } catch (SQLException ex) {
            Logger.getLogger(ProveedorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return objProveedor;
    }

    @Override
    public ArrayList<Proveedor> listarProveedor() {
        ArrayList<Proveedor> lstProveedor = new ArrayList<>();
        PreparedStatement psL;           
        try {
             psL = objConn.getConn().prepareStatement(sql_selectAll );
            rs = psL.executeQuery();            
            while (rs.next()) {
                Proveedor objProveedor = new Proveedor();         
                
                objProveedor.setId_proveedor(rs.getInt("id_proveedor"));
                objProveedor.setRut_proveedor(rs.getString("rut_proveedor"));
                objProveedor.setNombre_proveedor(rs.getString("nombre_proveedor"));
                objProveedor.setRazon_social_proveedor(rs.getString("razonSocial_proveedor"));
                objProveedor.setCorreo_proveedor(rs.getString("correo_proveedor"));
                objProveedor.setDireccion_proveedor(rs.getString("direccion_proveedor"));
                objProveedor.setFono_proveedor(rs.getString("fono_proveedor"));
                //objProveedor.setEstado_proveedor(rs.getString("estado_proveedor")); se muricio
                objProveedor.setId_comuna(rs.getInt("id_comuna"));
                
                lstProveedor.add(objProveedor);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProveedorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lstProveedor;
    }

    @Override
    public List buscar(String texto) {
        List<Proveedor> lista = new ArrayList<>();
        int texto2 = 0;
        if(texto.equalsIgnoreCase("Administrador")){
            texto2 = 1;
        }else if(texto.equalsIgnoreCase("Operador")){
            texto2 = 2;
        }
        String sql_search = "SELECT * FROM `proveedor` WHERE id_proveedor like '%"+texto+"%' or rut_proveedor like '%"+texto+"%' or nombre_proveedor like '%"+texto+"%' or "
                + "razonSocial_proveedor like '%"+texto+"%' or correo_proveedor like '%"+texto+"%' or direccion_proveedor like '%"+texto+"%' or "
                + "fono_proveedor like '%"+texto+/*"%' or estado_proveedor like '%"+texto+*/"%' or id_comuna like '%"+texto+"%'";
        
        try {
            
            PreparedStatement psB;
            psB = objConn.getConn().prepareStatement(sql_search);
            rs = psB.executeQuery();
            while(rs.next()){
                Proveedor p = new Proveedor();
                p.setId_proveedor(rs.getInt("id_proveedor"));
                p.setRut_proveedor(rs.getString("rut_proveedor"));
                p.setNombre_proveedor(rs.getString("nombre_proveedor"));
                p.setRazon_social_proveedor(rs.getString("razonSocial_proveedor"));
                p.setCorreo_proveedor(rs.getString("correo_proveedor"));
                p.setDireccion_proveedor(rs.getString("direccion_proveedor"));
                p.setFono_proveedor(rs.getString("fono_proveedor"));
                //p.setEstado_proveedor(rs.getString("estado_proveedor"));
                p.setId_comuna(rs.getInt("id_comuna"));
                lista.add(p);
            }
            
        } catch (Exception e) {
        }
        return lista;
    }
    
    public Proveedor buscarPorId(Proveedor objProveedor){
     try {
            Proveedor p = new Proveedor();           
            PreparedStatement psG;
            psG = objConn.getConn().prepareStatement(sql_selectProveedor);            
            psG.setString(1, objProveedor.getRut_proveedor());
            rs = psG.executeQuery();
            
            while (rs.next()) {              
                p.setId_proveedor(rs.getInt("id_proveedor"));
                p.setRut_proveedor(rs.getString("rut_proveedor"));
                p.setNombre_proveedor(rs.getString("nombre_proveedor"));
                p.setRazon_social_proveedor(rs.getString("razonSocial_proveedor"));
                p.setCorreo_proveedor(rs.getString("correo_proveedor"));
                p.setDireccion_proveedor(rs.getString("direccion_proveedor"));
                p.setFono_proveedor(rs.getString("fono_proveedor"));
                //p.setEstado_proveedor(rs.getString("estado_proveedor"));
                p.setId_comuna(rs.getInt("id_comuna"));
            }
            return p;
        } catch (SQLException ex) {
            Logger.getLogger(ProveedorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
}  

 public ArrayList<Menu> CargarMenuPorRol(int perfil){
        ArrayList<Menu> lstMenu = new ArrayList<>();
        String query = "SELECT M.ID_MENU, M.NOMBRE_MENU, M.URL_MENU, M.ID_MENU_PADRE FROM MENU M "
                + "JOIN TIPO_MENU TM ON (M.ID_MENU = TM.ID_MENU)"
                + "JOIN TIPO_USUARIO TU ON (TM.ID_TIPO_USUARIO = TU.ID_TIPO_USUARIO)"
                + "WHERE TM.ID_TIPO_USUARIO = " + perfil;
        try {
            PreparedStatement psM;
            psM = objConn.getConn().prepareStatement(query);
            rs = psM.executeQuery();
            while(rs.next()){
                Menu m = new Menu();
                m.setId_menu(rs.getInt("M.ID_MENU"));
                m.setNombre_menu(rs.getString("M.NOMBRE_MENU"));
                m.setUrl_menu(rs.getString("M.URL_MENU"));
                m.setId_menu_padre(rs.getInt("M.ID_MENU_PADRE"));
                lstMenu.add(m);
            }
        } catch (Exception e) {
        }
        return lstMenu;
    }
}
