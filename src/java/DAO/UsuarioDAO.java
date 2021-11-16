/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.ConexionDB;
import Interfaces.CRUDUsuario;
import Modelos.Menu;
import Modelos.Usuario;
import static java.lang.System.out;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Felipe
 */
public class UsuarioDAO implements CRUDUsuario {

    private static String sql_selectAll = "select * from usuario";
    private static String sql_insert = "insert into usuario (rut_usuario, nombre_usuario, password_usuario,ape_paterno_usuario, ape_materno_usuario, "
            + "celular_usuario, correo_usuario, direccion_usuario, id_tipo_usuario, id_area) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static String sql_delete = "delete from usuario where rut_usuario = ?";
    private static String sql_selectUsuario = "select * from usuario where rut_usuario = ?";//sql_selectProducto
    private static String sql_update = "update usuario set rut_usuario = ?, nombre_usuario = ?, password_usuario = ?, ape_paterno_usuario = ?, ape_materno_usuario = ?, celular_usuario = ?, correo_usuario = ?, direccion_usuario = ?, id_tipo_usuario = ?, id_area = ?  WHERE id_usuario = ?";//agregue el rut usuario para cambiarlo y se ve por el id
    private static String sql_searchO = "select correo_usuario from usuario";

    private static ConexionDB objConn = ConexionDB.InstanciaConn();
    private ResultSet rs;

    @Override
    public boolean agregarUsuario(Usuario objUsuario) {
        try {
            PreparedStatement psI;
            psI = objConn.getConn().prepareStatement(sql_insert);
            psI.setString(1, objUsuario.getRut_usuario());
            psI.setString(2, objUsuario.getNombre_usuario());
            psI.setString(3, objUsuario.getPassword_usuario());
            psI.setString(4, objUsuario.getApe_paterno_usuario());
            psI.setString(5, objUsuario.getApe_materno_usuario());
            psI.setString(6, objUsuario.getCelular_usuario());
            psI.setString(7, objUsuario.getCorreo_usuario());
            psI.setString(8, objUsuario.getDireccion_usuario());
            psI.setInt(9, objUsuario.getId_tipo_usuario());
            psI.setInt(10, objUsuario.getId_area());

            if (psI.executeUpdate() > 0) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }

        return false;

    }

    @Override
    public boolean editarUsuario(Usuario objUsuario) {
        try {
            PreparedStatement psU;

            psU = objConn.getConn().prepareStatement(sql_update);
            
            psU.setString(1, objUsuario.getRut_usuario());//lo agregue para cambiarlo
            psU.setString(2, objUsuario.getNombre_usuario());
            psU.setString(3, objUsuario.getPassword_usuario());
            psU.setString(4, objUsuario.getApe_paterno_usuario());
            psU.setString(5, objUsuario.getApe_materno_usuario());
            psU.setString(6, objUsuario.getCelular_usuario());
            psU.setString(7, objUsuario.getCorreo_usuario());
            psU.setString(8, objUsuario.getDireccion_usuario());
            psU.setInt(9, objUsuario.getId_tipo_usuario());
            psU.setInt(10, objUsuario.getId_area());
            psU.setInt(11, objUsuario.getId_usuario());//antes era el rut

            if (psU.executeUpdate() > 0) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }

        return false;
    }

    @Override
    public Usuario eliminarUsuario(Usuario objUsuario) {
        try {
            PreparedStatement psD;

            psD = objConn.getConn().prepareStatement(sql_delete);
            psD.setString(1, objUsuario.getRut_usuario());
            if (psD.executeUpdate() > 0) {
                return objUsuario;
            }

        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return objUsuario;
    }

    @Override
    public ArrayList<Usuario> listarUsuario() {
        ArrayList<Usuario> lstUsuario = new ArrayList<>();
        try {
            PreparedStatement psL;
            psL = objConn.getConn().prepareStatement(sql_selectAll);
            rs = psL.executeQuery();
            while (rs.next()) {
                Usuario objUsuario = new Usuario();
                objUsuario.setRut_usuario(rs.getString("rut_usuario"));
                objUsuario.setNombre_usuario(rs.getString("nombre_usuario"));
                objUsuario.setPassword_usuario(rs.getString("password_usuario"));
                objUsuario.setApe_paterno_usuario(rs.getString("ape_paterno_usuario"));
                objUsuario.setApe_materno_usuario(rs.getString("ape_materno_usuario"));
                objUsuario.setCelular_usuario(rs.getString("celular_usuario"));
                objUsuario.setCorreo_usuario(rs.getString("correo_usuario"));
                objUsuario.setDireccion_usuario(rs.getString("direccion_usuario"));
                objUsuario.setId_tipo_usuario(rs.getInt("id_tipo_usuario"));
                objUsuario.setId_area(rs.getInt("id_area"));

                lstUsuario.add(objUsuario);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return lstUsuario;
    }

    public Usuario buscarPorId(Usuario objUsuario) {
        try {
            Usuario p = new Usuario();
            PreparedStatement psG;
            psG = objConn.getConn().prepareStatement(sql_selectUsuario);//sql_selectProducto
            psG.setString(1, objUsuario.getRut_usuario());

            rs = psG.executeQuery();

            while (rs.next()) {
                p.setId_usuario(rs.getInt("id_usuario"));//agregado para que salga en la edición
                p.setNombre_usuario(rs.getString("nombre_usuario"));
                p.setPassword_usuario(rs.getString("password_usuario"));
                p.setApe_paterno_usuario(rs.getString("ape_paterno_usuario"));
                p.setApe_materno_usuario(rs.getString("ape_materno_usuario"));
                p.setCelular_usuario(rs.getString("celular_usuario"));
                p.setCorreo_usuario(rs.getString("correo_usuario"));
                p.setDireccion_usuario(rs.getString("direccion_usuario"));
                p.setId_tipo_usuario(rs.getInt("id_tipo_usuario"));
                p.setId_area(rs.getInt("id_area"));
            }

            return p;
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    @Override
    public List buscar(String texto) {
        List<Usuario> lista = new ArrayList<>();
        int texto2 = 0;
        if (texto.equalsIgnoreCase("Administrador")) {
            texto2 = 1;
        } else if (texto.equalsIgnoreCase("Operador")) {
            texto2 = 2;
        }
        String sql_search = "select * from usuario where rut_usuario like '%" + texto + "%' or nombre_usuario like '%" + texto + "%'"
                + "or ape_paterno_usuario like '%" + texto + "%' or ape_materno_usuario like '%" + texto + "%'or celular_usuario like '%" + texto + "%'"
                + "or correo_usuario like '%" + texto + "%'or direccion_usuario like '%" + texto + "%'or id_tipo_usuario like '%" + texto2 + "%'"
                + /*"or codigo_centro_costo like '%" + texto +*/"or id_area like '%" + texto + "%' or password_usuario like '%" + texto + "%' ";

        try {
            PreparedStatement psB;
            psB = objConn.getConn().prepareStatement(sql_search);
            rs = psB.executeQuery();
            while (rs.next()) {
                Usuario u = new Usuario();
                u.setRut_usuario(rs.getString("rut_usuario"));
                u.setNombre_usuario(rs.getString("nombre_usuario"));
                u.setPassword_usuario(rs.getString("password_usuario"));
                u.setApe_paterno_usuario(rs.getString("ape_paterno_usuario"));
                u.setApe_materno_usuario(rs.getString("ape_materno_usuario"));
                u.setCelular_usuario(rs.getString("celular_usuario"));
                u.setCorreo_usuario(rs.getString("correo_usuario"));
                u.setDireccion_usuario(rs.getString("direccion_usuario"));
                u.setId_tipo_usuario(rs.getInt("id_tipo_usuario"));
                u.setId_area(rs.getInt("id_area"));
                lista.add(u);
            }

        } catch (Exception e) {
        }
        return lista;
    }

    public ArrayList<Menu> listaMenuIdPadre(int perfil) {
        ArrayList<Menu> lstMenuIdPadre = new ArrayList<>();
        String query = "SELECT M.ID_MENU, M.NOMBRE_MENU, M.URL_MENU, M.ID_MENU_PADRE FROM MENU M "
                + "JOIN TIPO_MENU TM ON (M.ID_MENU = TM.ID_MENU) "
                + "JOIN TIPO_USUARIO TU ON (TM.ID_TIPO_USUARIO = TU.ID_TIPO_USUARIO) "
                + "WHERE M.ID_MENU_PADRE > 0 AND TM.ID_TIPO_USUARIO = " + perfil + " ORDER BY TM.ID_MENU ASC";
        try {
            PreparedStatement psM;
            psM = objConn.getConn().prepareStatement(query);
            rs = psM.executeQuery();
            while (rs.next()) {
                Menu m = new Menu();
                m.setId_menu(rs.getInt("M.ID_MENU"));
                m.setNombre_menu(rs.getString("M.NOMBRE_MENU"));
                m.setUrl_menu(rs.getString("M.URL_MENU"));
                m.setId_menu_padre(rs.getInt("M.ID_MENU_PADRE"));
                lstMenuIdPadre.add(m);
            }
        } catch (Exception e) {
        }
        return lstMenuIdPadre;
    }

    public ArrayList<Menu> CargarMenuPorRol(int perfil) {
        ArrayList<Menu> lstMenu = new ArrayList<>();
        String query = "SELECT M.ID_MENU, M.NOMBRE_MENU, M.URL_MENU, M.ID_MENU_PADRE FROM MENU M "
                + "JOIN TIPO_MENU TM ON (M.ID_MENU = TM.ID_MENU) "
                + "JOIN TIPO_USUARIO TU ON (TM.ID_TIPO_USUARIO = TU.ID_TIPO_USUARIO) "
                + "WHERE TM.ID_TIPO_USUARIO = " + perfil + " ORDER BY TM.ID_MENU ASC";
        try {
            PreparedStatement psM;
            psM = objConn.getConn().prepareStatement(query);
            rs = psM.executeQuery();
            while (rs.next()) {
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

    //Correo
    
    @Override
    public List<String> correo(){
        List<String> lista = new ArrayList<String>();
        try {
            PreparedStatement psO;
            psO = objConn.getConn().prepareStatement(sql_searchO);
            rs = psO.executeQuery();
            while(rs.next()){
                String a;
                a = rs.getString("correo_usuario");
                lista.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    
}
