/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;
import DAO.DetalleInventarioDAO;
import Modelos.DetalleInventario;
import DAO.ProductoEspDAO;
import Modelos.ProductoEsp;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sebastián Barría
 */
@WebServlet(name = "AddProductoEsp", urlPatterns = {"/AddProductoEsp"})
public class AddProductoEsp extends HttpServlet {

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
            out.println("<title>Servlet AddProductoEsp</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProductoEsp at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductoEspDAO  objProductoEspDAO = new ProductoEspDAO();
        ProductoEsp objProductoEsp = new ProductoEsp();
        ProductoEsp ultimoID = new ProductoEsp();
        DetalleInventarioDAO objDetalleDAO = new DetalleInventarioDAO();
        DetalleInventario objDetalle = new DetalleInventario();
        
        
        
        
        objProductoEsp.setId_producto(Integer.parseInt(request.getParameter("txtId_producto")));
//        objProductoEsp.setId_producto_E(Integer.parseInt(request.getParameter("txtId_producto_E")));
        objProductoEsp.setSerial_producto(request.getParameter("txtSerialProducto"));
        java.sql.Date sqlDate = java.sql.Date.valueOf(request.getParameter("dtpFechaDepreciacion"));
        objProductoEsp.setFecha_depreciacion((java.sql.Date) (sqlDate));
//        

        // Lineas agregadas - Fecha creacion
        java.sql.Date sqlDate2 = new java.sql.Date(System.currentTimeMillis());
        objProductoEsp.setFecha_creacion((java.sql.Date) (sqlDate2));


        if(objProductoEspDAO.AgregarProductoEsp(objProductoEsp)){
            
             ultimoID = objProductoEspDAO.UltimoId();
             
             objDetalle.setCantidad_producto_inventario(Integer.parseInt(request.getParameter("txtCantidad")));
             objDetalle.setId_inventario(Integer.parseInt(request.getParameter("txtId_inventario")));
             objDetalle.setId_ubicacion(Integer.parseInt(request.getParameter("txtId_Ubicacion")));
             objDetalle.setId_producto_E(ultimoID.getId_producto_E());
             
             if (objDetalleDAO.agregarDetalleInventario(objDetalle)) {
                    response.sendRedirect("ListaDetalleInventario.jsp");
            } else {
                 response.sendRedirect("Index.jsp");
             }
           
        } else{
            response.sendRedirect("Index.jsp");
        }

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

    private void UtilToSqlConversion(Date startDate) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
