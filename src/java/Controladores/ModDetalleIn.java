/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import DAO.DetalleInventarioDAO;
import DAO.ProductoEspDAO;
import Modelos.DetalleInventario;
import Modelos.Producto;
import Modelos.ProductoEsp;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Tapir
 */
public class ModDetalleIn extends HttpServlet {


     
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
           HttpSession ses = request.getSession();
        ProductoEsp objProductoEsp = new ProductoEsp();
        ProductoEspDAO objProductoEspDAO = new ProductoEspDAO();

        objProductoEsp.setId_producto_E(Integer.parseInt(request.getParameter("txtId_producto_E")));
        objProductoEsp.setSerial_producto(request.getParameter("txtSerialProducto"));
        java.sql.Date sqlDate = java.sql.Date.valueOf(request.getParameter("dtpFechaDepreciacion"));
        objProductoEsp.setFecha_depreciacion((java.sql.Date) (sqlDate));

        DetalleInventario objDetalleInventario = new DetalleInventario();
        DetalleInventarioDAO objDetalleInventarioDAO = new DetalleInventarioDAO();
        
        
        objDetalleInventario.setCantidad_producto_inventario(Integer.parseInt(request.getParameter("txtCantidad")));
        objDetalleInventario.setId_ubicacion(Integer.parseInt(request.getParameter("txtId_Ubicacion")));
        objDetalleInventario.setId_producto_E(Integer.parseInt(request.getParameter("txtId_producto_E")));
        
        boolean in = objProductoEspDAO.EditarProductoEsp(objProductoEsp);
        boolean in2 =  objDetalleInventarioDAO.editarDetalleInventario(objDetalleInventario);
       
        
        if (in && in2) {
            response.sendRedirect("ListaDetalleInventario.jsp");
        }
 
       
        
        
        
    }

   

}
