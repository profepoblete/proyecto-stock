/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Modelos.Inventario;
import DAO.InventarioDAO;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Tapir
 */
public class AddInventario extends HttpServlet {   

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
                InventarioDAO objDAO = new InventarioDAO();
                Inventario objInventario = new Inventario();
        
        objInventario.setDescripcion_inventario(request.getParameter("txtDescripcion_inventario"));
        objInventario.setId_area(Integer.parseInt(request.getParameter("ddlCodigo_CCosto_bodega")));     
       
        if (objDAO.agregarInventario(objInventario)) {
            response.sendRedirect("ListaInventario.jsp");
        }else{
            response.sendRedirect("Error.jsp");
        }
    }
 
}
