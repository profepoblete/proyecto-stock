/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import DAO.ProveedorDAO;
import Modelos.Proveedor;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author José Pablo
 */
@WebServlet(name = "AddProveedor", urlPatterns = {"/AddProveedor"})
public class AddProveedor extends HttpServlet {

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
            out.println("<title>Servlet AddProveedor</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProveedor at " + request.getContextPath() + "</h1>");
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
        ProveedorDAO objDAO = new ProveedorDAO();
        Proveedor objProveedor = new Proveedor();
        
        //objProveedor.setId_proveedor(Integer.parseInt(request.getParameter("txtId_proveedor")));
        objProveedor.setRut_proveedor(request.getParameter("txtRut_Proveedor"));
        objProveedor.setNombre_proveedor(request.getParameter("txtNombre_Proveedor"));
        objProveedor.setRazon_social_proveedor(request.getParameter("txtRazonSocial_Proveedor"));
        objProveedor.setCorreo_proveedor((request.getParameter("txtCorreo_Proveedor")));
        objProveedor.setDireccion_proveedor((request.getParameter("txtDireccion_Proveedor")));
        objProveedor.setFono_proveedor(request.getParameter("txtFono_Proveedor"));
        //objProveedor.setEstado_proveedor(request.getParameter("txtEstado_Proveedor"));
        objProveedor.setId_comuna(Integer.parseInt(request.getParameter("txtId_comuna")));
        
        if(objDAO.agregarProveedor(objProveedor)){
                response.sendRedirect("ListaProveedor.jsp");
            }
            else
            {
                response.sendRedirect("Error.jsp");
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

}
