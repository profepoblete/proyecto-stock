/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.ConexionDB;
import Interfaces.CRUDProducto;
import Modelos.Menu;
import Modelos.Producto;
import java.io.File;
import java.io.FileInputStream;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Felipe
 */
public class ProductoDAO implements CRUDProducto {

    private static String sql_selectAll = "select * from producto_generico";
    private static String sql_insert = "insert into producto_generico ( nombre_producto, descripcion_producto, "
            + " valor_producto, marca_producto,"
            + " stock_minimo, id_proveedor , tipo_producto ,id_subtipo_producto, id_tipo_unidad)"
            + "  values (?,?,?,?,?,?,?,?,?)";
    private static String sql_delete = "delete from producto_generico where id_producto = ?";
    private static String sql_selectProducto = "select * from producto_generico where (id_producto = ?) or (UPPER(nombre_producto) LIKE UPPER('%?%')) ";
    private static String sql_update = "update producto_generico set nombre_producto = ?, descripcion_producto = ?,"
            + " valor_producto = ?, marca_producto = ?,"
            + " stock_minimo = ?, id_proveedor = ?,tipo_producto = ?, id_subtipo_producto = ?, id_tipo_unidad = ? where id_producto = ?";

    private static ConexionDB objConn = ConexionDB.InstanciaConn();
    private ResultSet rs;

    @Override
    public boolean agregarProducto(Producto objProducto) {
        try {
            PreparedStatement psI;
            psI = objConn.getConn().prepareStatement(sql_insert);
//            psI.setInt(1, objProducto.getId_producto());
            psI.setString(1, objProducto.getNombre_producto());
            psI.setString(2, objProducto.getDescripcion_producto());
            psI.setInt(3, objProducto.getValor_producto());
            psI.setString(4, objProducto.getMarca_producto());
            psI.setInt(5, objProducto.getStock_minimo());
            psI.setInt(6, objProducto.getId_proveedor());
            psI.setInt(7, objProducto.getTipo_producto());
            psI.setInt(8, objProducto.getId_subtipo_producto());
            psI.setInt(9, objProducto.getId_tipo_unidad());

            if (psI.executeUpdate() > 0) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return false;

    }

    @Override
    public boolean editarProducto(Producto objProducto) {
        try {
            PreparedStatement psU;

            psU = objConn.getConn().prepareStatement(sql_update);

            psU.setString(1, objProducto.getNombre_producto());
            psU.setString(2, objProducto.getDescripcion_producto());
            psU.setInt(3, objProducto.getValor_producto());
            psU.setString(4, objProducto.getMarca_producto());
            psU.setInt(5, objProducto.getStock_minimo());
            
            psU.setInt(6, objProducto.getId_proveedor());
            psU.setInt(7, objProducto.getTipo_producto());
            psU.setInt(8, objProducto.getId_subtipo_producto());
            psU.setInt(9, objProducto.getId_tipo_unidad());
            
            psU.setInt(10, objProducto.getId_producto());


            if (psU.executeUpdate() > 0) {
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
    public Producto eliminarProducto(Producto objProducto) {
        try {
            PreparedStatement psD;

            psD = objConn.getConn().prepareStatement(sql_delete);
            psD.setInt(1, objProducto.getId_producto());
            if (psD.executeUpdate() > 0) {
                return objProducto;
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return objProducto;
    }

    @Override
    public ArrayList<Producto> listarProducto() {
        ArrayList<Producto> lstProducto = new ArrayList<>();
        try {
            PreparedStatement psL;
            psL = objConn.getConn().prepareStatement(sql_selectAll);
            rs = psL.executeQuery();
            while (rs.next()) {
                Producto objProducto = new Producto();
                objProducto.setId_producto(rs.getInt("id_producto"));
                objProducto.setNombre_producto(rs.getString("nombre_producto"));
                objProducto.setDescripcion_producto(rs.getString("descripcion_producto"));
                objProducto.setValor_producto(rs.getInt("valor_producto"));
                objProducto.setMarca_producto(rs.getString("marca_producto"));
                objProducto.setStock_minimo(rs.getInt("stock_minimo"));
                objProducto.setId_proveedor(rs.getInt("id_proveedor"));                
                objProducto.setTipo_producto(rs.getInt("tipo_producto"));
                objProducto.setId_subtipo_producto(rs.getInt("id_subtipo_producto"));
                objProducto.setId_tipo_unidad(rs.getInt("id_tipo_unidad"));

                lstProducto.add(objProducto);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return lstProducto;
    }

    public Producto buscarPorId(Producto objProducto) {
        try {
            Producto p = new Producto();
            PreparedStatement psG;
            psG = objConn.getConn().prepareStatement(sql_selectProducto);
            psG.setInt(1, objProducto.getId_producto());

            rs = psG.executeQuery();

            while (rs.next()) {
                p.setId_producto(rs.getInt("id_producto"));
                p.setNombre_producto(rs.getString("nombre_producto"));
                p.setDescripcion_producto(rs.getString("descripcion_producto"));
                p.setValor_producto(rs.getInt("valor_producto"));
                p.setMarca_producto(rs.getString("marca_producto"));
                p.setStock_minimo(rs.getInt("stock_minimo"));

                p.setId_proveedor(rs.getInt("id_proveedor"));
                p.setId_subtipo_producto(rs.getInt("id_subtipo_producto"));
                p.setId_tipo_unidad(rs.getInt("id_tipo_unidad"));
                
            }

            return p;
        } catch (SQLException ex) {
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    @Override
    public List buscar(String texto) {
        List<Producto> lista = new ArrayList<>();
        String sql_search = "SELECT * FROM producto_generico WHERE  "
                + "id_producto like '%" + texto + "%' or UPPER(nombre_producto) like UPPER('%" + texto + "%')"
                + "or descripcion_producto like '%" + texto + "%' or valor_producto like '%" + texto + "%' or marca_producto like '%" + texto +"%'"
                + "or stock_minimo like '%" + texto + "%' or id_proveedor like '%" + texto + "%' or tipo_producto like '%" + texto + "%' or id_subtipo_producto like '%" + texto + "%'"
                + "or id_tipo_unidad like '%" + texto + "%'";

        try {
            PreparedStatement psB;
            psB = objConn.getConn().prepareStatement(sql_search);
            rs = psB.executeQuery();
            while (rs.next()) {
                Producto p = new Producto();
                p.setId_producto(rs.getInt("id_producto"));
                p.setNombre_producto(rs.getString("nombre_producto"));
                p.setDescripcion_producto(rs.getString("descripcion_producto"));
                p.setValor_producto(rs.getInt("valor_producto"));
                p.setMarca_producto(rs.getString("marca_producto"));
                p.setStock_minimo(rs.getInt("stock_minimo"));
                p.setId_proveedor(rs.getInt("id_proveedor"));
                p.setTipo_producto(rs.getInt("tipo_producto"));
                p.setId_subtipo_producto(rs.getInt("id_subtipo_producto"));
                p.setId_tipo_unidad(rs.getInt("id_tipo_unidad"));

                lista.add(p);
            }

        } catch (SQLException e) {
        }
        return lista;
    }
    
   

}