/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Seba_barria
 */
public class AutoCompletar extends Conexion.ConexionDB{
    
    
    public ArrayList<String> getNamesProductos(String findName){
    
        ArrayList<String> objAutocompletar = new ArrayList<>();
        
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try {
            String sql = "select CONCAT(nombre_producto,'   ','     ID PRODUCTO = ', FORMAT(id_producto, 0)) \"nombre_producto\" from producto_generico where nombre_producto like ? limit 10";
            pst = getConn().prepareStatement(sql);
            pst.setString(1, findName+"%");
            rs = pst.executeQuery();
            while (rs.next()){
                objAutocompletar.add(rs.getString("nombre_producto"));
            }
        } catch (Exception e) {
        }finally{
            try {
                if(getConn() != null)getConn().close();
                if(rs != null)rs.close();
                if(pst != null) pst.close();
            } catch (SQLException e) {
            }        
        }    
        return objAutocompletar;
    }
    public ArrayList<String> GetNamesUbicacion(String FindUbi, String area_respuesta){

            ArrayList<String> objAutocompletar = new ArrayList<>();

            PreparedStatement pst = null;
            ResultSet rs = null;

            try {
                String sql = "SELECT CONCAT(ubicacion.nombre_ubicacion,'   ','     ID UBICACION = ', FORMAT(ubicacion.id_ubicacion, 0)) \"nombre_ubicacion\" from \n" +
                "ubicacion LEFT join detalle_inventario on detalle_inventario.id_ubicacion = ubicacion.id_ubicacion\n" +
                "LEFT join inventario on inventario.id_inventario = detalle_inventario.id_inventario\n" +
                "LEFT JOIN usuario on usuario.id_area = inventario.id_area\n" +
                "WHERE ubicacion.nombre_ubicacion like ? and usuario.id_area = ? \n" +
                "GROUP BY ubicacion.id_ubicacion\n" +
                "limit 10";
                pst = getConn().prepareStatement(sql);
                pst.setString(1, FindUbi+"%");
                pst.setString(2, area_respuesta);
                rs = pst.executeQuery();
                while (rs.next()){
                    objAutocompletar.add(rs.getString("nombre_ubicacion"));
                }
            } catch (Exception e) {
            }finally{
                try {
                    if(getConn() != null)getConn().close();
                    if(rs != null)rs.close();
                    if(pst != null) pst.close();
                } catch (SQLException e) {
                }        
            }    
            return objAutocompletar;
        }   
    public ArrayList<String> GetNamesInventario(String FindInv, String area_respuesta){

            ArrayList<String> objAutocompletar = new ArrayList<>();

            PreparedStatement pst = null;
            ResultSet rs = null;

            try {
                String sql = "select CONCAT(inventario.descripcion_inventario,'   ','     ID INVENTARIO = ', FORMAT(inventario.id_inventario, 0)) \"descripcion_inventario\"\n" +
"from inventario left join area on area.id_area = inventario.id_area JOIN usuario on usuario.id_area = inventario.id_area WHERE inventario.descripcion_inventario like ? and usuario.id_area = ? limit 10";
                pst = getConn().prepareStatement(sql);
                pst.setString(1, FindInv+"%");
                pst.setString(2, area_respuesta);
                rs = pst.executeQuery();
                while (rs.next()){
                    objAutocompletar.add(rs.getString("descripcion_inventario"));
                    
                }
            } catch (Exception e) {
            }finally{
                try {
                    if(getConn() != null)getConn().close();
                    if(rs != null)rs.close();
                    if(pst != null) pst.close();
                } catch (SQLException e) {
                }        
            }    
            return objAutocompletar;
        }   
}
