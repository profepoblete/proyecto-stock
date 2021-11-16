<%-- 
    Document   : AlertaStock
    Created on : 22-04-2021, 0:07:05
    Author     : Tapir
--%>

        <%@page import="DAO.UbicacionDAO"%>
<%@page import="Modelos.Ubicacion"%>
<%@page import="Modelos.DetalleInventario"%>
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
        <%@page import="DAO.DetalleInventarioDAO"%>
        <%@page import="Modelos.DetalleInventario"%>
        
        
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
            DetalleInventarioDAO objDAODetalle = new DetalleInventarioDAO();
            String objCorreo;        
            List<String>Correo_u = objDAOUsuario.correo();
            ArrayList<DetalleInventario> detalleLista = objDAODetalle.listadoStock();
            DetalleInventario inv = null;
            DetalleInventario inv2 = new DetalleInventario();
            
            int variableAux = 0;
            
            System.out.println(objDAODetalle.checkStock());
            System.out.println(detalleLista);
            
            String txt = "Listado de Productos \n";
            
            if (objDAODetalle.checkStock()) {
             
                try{
                MimeMessage message = new MimeMessage(sessionh);
                message.setFrom(new InternetAddress("ivarasstock@gmail.com")); 
                for (int i = 0; i < Correo_u.size(); i++) {
                objCorreo = Correo_u.get(i);
                message.addRecipient(Message.RecipientType.TO,new InternetAddress(objCorreo));    
                }
                message.setSubject("Productos sin stock ");
                for (int x = 0; x < detalleLista.size(); x++){
                    Producto productoGenerico = new Producto();
                    ProductoDAO productoGenericoDAO = new ProductoDAO();
                    ProductoEspDAO objDAOProductoEsp = new ProductoEspDAO();
                    ProductoEsp objProductoEsp = new ProductoEsp();
                    Ubicacion ubicacion = new Ubicacion();
                    UbicacionDAO ubicaciondao = new UbicacionDAO();
                    
                    
                    
                    inv = detalleLista.get(x);
                    variableAux = inv.getId_detalle_inventario();
                    
                    System.out.println("Variable AUX "+variableAux);
                    inv2.setId_detalle_inventario(variableAux);
                    
                    System.out.println("Esto es inv2 get id_detalle"+ inv2.getId_detalle_inventario());
                    inv2 = objDAODetalle.buscarPorId(inv2);
                    System.out.println("Inv2 producto: "+ inv2.getId_producto_E());
                    
                    ubicacion.setId_ubicacion(inv2.getId_ubicacion());
                    ubicacion =  ubicaciondao.buscarPorId(ubicacion);
                    objProductoEsp.setId_producto_E(inv2.getId_producto_E());
                    objProductoEsp = objDAOProductoEsp.BuscarPorIdEsp(objProductoEsp);
                    productoGenerico.setId_producto(objProductoEsp.getId_producto());
                    productoGenerico = productoGenericoDAO.buscarPorId(productoGenerico);
                    
                    System.out.println("Esto es el nombre de producto  "+ productoGenerico.getNombre_producto());
                            
                    txt = txt + " id_producto: "+ objProductoEsp.getId_producto_E() +" Nombre : "+productoGenerico.getNombre_producto() +" serial: " + objProductoEsp.getSerial_producto() +"\n" 
                            +" Stock Actual: " + inv2.getCantidad_producto_inventario()+" Stock mínimo: "+ productoGenerico.getStock_minimo() + " Ubicación: " + ubicacion.getNombre_ubicacion()+  "\n"+"\n" ;
                    
                    System.out.println("Esto es el txt: "+ txt);
                            
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
            
//            ProductoEsp productoet = null;            
//            objCorreo = null;
//            String txt = "Listado de Productos \n";
//            if(objDAOProductoEsp.CheckAlerta() == true){      
//            try{
//                MimeMessage message = new MimeMessage(sessionh);
//                message.setFrom(new InternetAddress("ivarasstock@gmail.com")); 
//                for (int i = 0; i < Correo_u.size(); i++) {
//                objCorreo = Correo_u.get(i);
//                message.addRecipient(Message.RecipientType.TO,new InternetAddress(objCorreo));    
//                }
//                message.setSubject("Productos en depreciación");
//                for (int x = 0; x < productoEs.size(); x++){
//                    productoet = productoEs.get(x);
//                    int y = productoet.getId_producto();
//                    txt = txt + " id_producto: "+ y + " serial: " + productoet.getSerial_producto() + " fecha depreciacion: " + productoet.getFecha_depreciacion()+"\n";
//                }
//                message.setText(txt);
//                Transport t = sessionh.getTransport("smtp");
//                t.connect("smtp.gmail.com","ivarasstock", "duoc2020");
//                t.sendMessage(message, message.getAllRecipients());
//                        // Cierre.
//                t.close();
//
//                }                
//                catch (Exception e){
//                e.printStackTrace();
//                    }    
//                
//            }
%>