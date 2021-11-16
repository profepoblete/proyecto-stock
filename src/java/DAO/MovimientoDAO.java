/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.ConexionDB;
import Interfaces.CRUDMovimiento;
import Modelos.Movimiento;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Tapir
 */
public class MovimientoDAO implements CRUDMovimiento {

    //SQL
    private static String select = "Select * from movimiento";
            
    private static ConexionDB objConn = ConexionDB.InstanciaConn();
    private ResultSet rs;

    @Override
    public ArrayList<Movimiento> listarMovimiento() {
        ArrayList<Movimiento> lstMenu = new ArrayList<>();
        try {
            PreparedStatement psL;
            psL = objConn.getConn().prepareStatement(select);
            rs = psL.executeQuery();
            while (rs.next()) {
                Movimiento objMovimiento = new Movimiento();
                objMovimiento.setId_movimiento(rs.getInt("id_movimiento"));
                objMovimiento.setFecha_movimiento(rs.getDate("fecha_movimiento"));
                objMovimiento.setId_ubicacion_original(rs.getInt("id_ubicacion_original"));
                objMovimiento.setId_ubicacion_nuevo(rs.getInt("id_ubicacion_nuevo"));
                objMovimiento.setId_producto_e(rs.getInt("id_producto_e"));

                lstMenu.add(objMovimiento);
            }
        } catch (SQLException ex) {
            Logger.getLogger(MenuDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return lstMenu;
    }

}
