
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import DAO.DetalleInventarioDAO;
import DAO.ProductoEspDAO;
import Modelos.DetalleInventario;
import Modelos.ProductoEsp;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Seba_barria
 */
@WebServlet(name = "UpDetalleIn", urlPatterns = {"/UpDetalleIn"})
public class UpDetalleIn extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpDetalleIn</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpDetalleIn at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession ses = request.getSession();

        //Primero hago los objetos que voy a usar
        DetalleInventario objDetalleInventario = new DetalleInventario();
        DetalleInventarioDAO objDetalleInventarioDAO = new DetalleInventarioDAO();
        ProductoEsp objProductoEsp = new ProductoEsp();
        ProductoEspDAO objProductoEspDAO = new ProductoEspDAO();

        int id_producto = Integer.parseInt(request.getParameter("id_producto"));
        int detalle = Integer.parseInt(request.getParameter("detalle"));
        
        objProductoEsp.setId_producto_E(id_producto);
        objProductoEsp = objProductoEspDAO.BuscarPorIdEsp(objProductoEsp);
        
        
        objDetalleInventario.setId_detalle_inventario(detalle);
        objDetalleInventario = objDetalleInventarioDAO.buscarPorId(objDetalleInventario);
        
        
        int s = objDetalleInventario.getCantidad_producto_inventario();
        
        System.out.println("ACá "+ s);


        ses.setAttribute("objProd", objProductoEsp);
        ses.setAttribute("ObjDetIn", objDetalleInventario);

        response.sendRedirect("ModificarDetalleInventario.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
