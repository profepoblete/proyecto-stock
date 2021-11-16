/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import DAO.CentroCostoDAO;
import static com.sun.xml.internal.ws.spi.db.BindingContextFactory.LOGGER;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.logging.Level;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author starg
 */
@WebServlet(name = "CargaMasivaCecos", urlPatterns = {"/CargaMasivaCecos"})
@MultipartConfig
public class CargaMasivaCecos extends HttpServlet {

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
            out.println("<title>Servlet CargaMasivaCecos</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CargaMasivaCecos at " + request.getContextPath() + "</h1>");
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
        System.out.println("Servlet!");
        
        HttpSession objsesion = request.getSession(true);
        
        
        
        // Creamos un camino donde guardar el archivo
        String path = System.getProperty("user.dir");
        System.out.println(path);
        Part filePart = request.getPart("inputFile");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        System.out.println(fileName);
        
        //Verificamos que el archivo tenga extensión xlsx
        if(fileName.substring(fileName.length()-4).equals("xlsx"))
        {
            CentroCostoDAO dao = new CentroCostoDAO();
            
            String camino = path+"\\"+fileName;
            
            System.out.println(path+"\\"+fileName);
            OutputStream out = null;
            InputStream filecontent = null;
            
            //Guardamos el archivo para poder abrirlo desde el DAO
            try {
                out = new FileOutputStream(new File(path + File.separator + fileName));
                filecontent = filePart.getInputStream();
                
                int read = 0;
                final byte[] bytes = new byte[1024];
                
                while ((read = filecontent.read(bytes)) != -1) {
                    out.write(bytes, 0, read);
                }
                System.out.println("New file " + fileName + " created at " + path);
                LOGGER.log(Level.INFO, "File{0}being uploaded to {1}",
                        new Object[]{fileName, path});
            }
            catch (FileNotFoundException fne) {
                System.out.println("You either did not specify a file to upload or are "
                        + "trying to upload a file to a protected or nonexistent "
                        + "location.");
                System.out.println("ERROR: " + fne.getMessage());
                
                LOGGER.log(Level.SEVERE, "Problems during file upload. Error: {0}",
                        new Object[]{fne.getMessage()});
                response.sendRedirect("error.jsp");
            }
            finally {
                if (out != null) {
                    out.close();
                }
                if (filecontent != null) {
                    filecontent.close();
                }
            }
            
            if(dao.insercionMasiva(camino))
            {
                Path ubicacion = FileSystems.getDefault().getPath(camino);
                Files.delete(ubicacion);
                objsesion.setAttribute("divError", "Se ha ingresado el archivo con éxito");
                response.sendRedirect("CargaMasivaCecos.jsp");
            }
            else
            {
                Path ubicacion = FileSystems.getDefault().getPath(camino);
                Files.delete(ubicacion);
                objsesion.setAttribute("divError", "Ha habido un error al ingresar el archivo, revise el formato del archivo.");
                response.sendRedirect("CargaMasivaCecos.jsp");
            }
        }
        else
        {
            objsesion.setAttribute("divError", "Debe usar un archivo con extension xsls");
            response.sendRedirect("CargaMasivaCecos.jsp");
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
