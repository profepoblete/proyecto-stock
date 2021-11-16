        <%@page import="java.util.Properties"%>
        <%@page import="javax.mail.Message"%>
        <%@page import="javax.mail.Session"%>
        <%@page import="javax.mail.Transport"%>
        <%@page import="javax.mail.internet.InternetAddress"%>
        <%@page import="javax.mail.internet.MimeMessage"%>
        <%@page import="Modelos.CentroCosto"%>
        <%@page import="java.util.Iterator"%>
        <%@page import="java.util.ArrayList"%>
        <%@page import="DAO.CentroCostoDAO"%>
        <%@page import="Modelos.Usuario"%>
        <%@page import="DAO.UsuarioDAO"%>
        <%@page import="java.util.List"%>
        <%@page import="DAO.ProductoEspDAO"%>
        <%@page import="Modelos.ProductoEsp"%>
        <%@page import="DAO.ProductoDAO"%>
        <%@page import="Modelos.Producto"%>
        
<%        
                    
            // Propiedades de la conexión
            Properties props = new Properties();
            props.setProperty("mail.smtp.host", "smtp.gmail.com");
            props.setProperty("mail.smtp.starttls.enable", "true");
            props.setProperty("mail.smtp.port", "587");
            props.setProperty("mail.smtp.user", "ivarasstock@gmail.com");
            props.setProperty("mail.smtp.auth", "true");
            
            // Preparamos la sesion
            Session sessionh = Session.getDefaultInstance(props); 
           
            UsuarioDAO objDAOUsuario = new UsuarioDAO();
            ProductoEspDAO objDAOProductoEsp = new ProductoEspDAO();
            String objCorreo;        
            List<String>Correo_u = objDAOUsuario.correo();
            ArrayList<ProductoEsp> productoEs = objDAOProductoEsp.ProductosDepre();
            
            ProductoEsp productoet = null;            
            objCorreo = null;
            String txt = "Listado de Productos \n";
            if(objDAOProductoEsp.CheckAlerta() == true){      
            try{
                MimeMessage message = new MimeMessage(sessionh);
                message.setFrom(new InternetAddress("ivarasstock@gmail.com")); 
                for (int i = 0; i < Correo_u.size(); i++) {
                objCorreo = Correo_u.get(i);
                message.addRecipient(Message.RecipientType.TO,new InternetAddress(objCorreo));    
                }
                message.setSubject("Productos en depreciación");
                for (int x = 0; x < productoEs.size(); x++){
                    productoet = productoEs.get(x);
                    int y = productoet.getId_producto();
                    txt = txt + " id_producto: "+ y + " serial: " + productoet.getSerial_producto() + " fecha depreciacion: " + productoet.getFecha_depreciacion()+"\n";
                }
                message.setText(txt);
                Transport t = sessionh.getTransport("smtp");
                t.connect("smtp.gmail.com","ivarasstock", "duoc2020");
                t.sendMessage(message, message.getAllRecipients());
                        // Cierre.
                t.close();

                }                
                catch (Exception e){
                e.printStackTrace();
                    }    
                
            }
%>