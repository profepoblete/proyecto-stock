<%-- 
    Document   : ModificarDetalleInventario
    Created on : 13-04-2021, 17:56:38
    Author     : Tapir
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="Modelos.DetalleInventario"%>
<%@page import="Modelos.ProductoEsp"%>
<%@page import="Modelos.Producto"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Conexion.ConexionDB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAO.ProductoDAO"%>
<%@page import="DAO.DetalleInventarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Detalle Inventario</title>
        <link href="css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.24.1/feather.min.js" crossorigin="anonymous"></script>
    </head>
          <%
              //Se inicializa la sesion y la conexion
            HttpSession objsesion = request.getSession();
            ConexionDB objCone = new ConexionDB();
            
            ProductoEsp objProd = (ProductoEsp) objsesion.getAttribute("objProd");
//            DetalleInventario ObjDetIn = (DetalleInventario) objsesion.getAttribute("ObjDetIn");
            DetalleInventario ObjDetIn = new DetalleInventario();
            DetalleInventarioDAO ObjDetInDAO = new DetalleInventarioDAO();
            ObjDetIn.setId_producto_E(objProd.getId_producto_E());
            ObjDetIn = ObjDetInDAO.buscarPorProductoE(ObjDetIn);
            
        
            
            System.out.println("Inventario  "+ " "+ ObjDetIn.getId_inventario());
            System.out.println("Ubicacion  "+ " "+ ObjDetIn.getId_ubicacion());
            
            
            
                       
           



            
            
            
            
//            //parseamos la fecha a String (Para dejarlo en el value del input)
//            Date fecha = producto.getFecha_depreciacion();
//            DateFormat dateFormat  = new SimpleDateFormat("yyyy-mm-dd");
//            String formateado = dateFormat.format(fecha);
            
            
            




        %>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>
            <div id="layoutSidenav">
                <div id="layoutSidenav_nav">
                <jsp:include page="Menu.jsp"></jsp:include>
                </div>
                <div id="layoutSidenav_content">
                    <main>
                        <div class="container">
                            <div class="row justify-content-center">
                                <!-- Create Organization-->
                                <div class="col-xl-5 col-lg-6 col-md-8 col-sm-11">
                                    <div class="card mt-5">
                                        <div class="card-body p-5 text-center">
                                            <div class="icons-org-create align-items-center mx-auto"><i class="icon-users" data-feather="users"></i><i class="icon-plus fas fa-plus"></i></div>
                                            <div class="h3 text-primary font-weight-300 mb-0">Modificar Producto especifico</div>

                                        </div>
                                        <hr class="m-0" />
                                        <div class="justify-content-center" style="text-align: center;" id="divAlert"></div>
                                        <div class="card-body p-3">
                                            <form action="ModDetalleIn" id="AddProductoEsp" method="POST" autocomplete="off" accept-charset="ISO-8859-1">

                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="media mb-1" for="inputFirstName"><i data-feather="user-x"></i> Codigo Producto generico</label>
                                                        <div class="form-group"id="fg_id_producto">
                                                                <input readonly="True" class="form-control py-4" id="txtId_producto" name="txtId_producto" type="" value="<%=objProd.getId_producto()%>"/>
                                                    </div>
                                                </div>
                                            </div> 
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="media mb-1" for="inputFirstName"><i data-feather="user-x"></i> Codigo Producto Especifico </label>
                                                        <div class="form-group"id="fg_id_producto">
                                                            <input readonly="True" class="form-control py-4" id="txtId_producto_E" name="txtId_producto_E" type="" value="<%=objProd.getId_producto_E()%>"/>
                                                    </div>
                                                </div>
                                            </div> 
                                            <div class="col-md-12">
                                                <div class="form-group ">
                                                    <label class="media mb-1" for="inputFirstName"><i data-feather="user-x"></i> Serial Producto</label>
                                                    <div class="form-group"id="fg_id_producto">
                                                        <input class="form-control py-4" id="txtSerialProducto" name="txtSerialProducto" type="number" placeholder="000000000" value="<%=objProd.getSerial_producto()%>"/>
                                                    </div>
                                                </div>
                                            </div>   

                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="media mb-1" for="inputFirstName">Fecha de depreciación </label>
                                                    <div class="form-group"id="fg_id_producto">
                                                        <input class="form-control py-4" id="dtpFechaDepreciacion"  name="dtpFechaDepreciacion" type="date" placeholder="YYYY-MM-DD" value="<%=objProd.getFecha_depreciacion()%>"/>
                                                    </div>
                                                </div>

                                                <div class="col-md-12">
                                                    <div class="form-group ">
                                                        <label class="media mb-1" for="txtCantidad"> Cantidad a agregar</label>
                                                        <div class="form-group"id="fg_id_producto">
                                                            <input class="form-control" id="txtCantidad" name="txtCantidad" type="number" value="<%= ObjDetIn.getCantidad_producto_inventario() %>" min="1" max="100" />
                                                        </div>
                                                    </div>
                                                </div>   

                                            </div>                                                
                                            <div class="col-md-12">
                                                <div class="form-group ">
                                                    <label class="media mb-1" for="txtId_inventario"> Seleccione Inventario </label>
                                                    <div class="form-group"id="fg_id_producto">
                                                        <select class="form-control" id="txtId_inventario" name="txtId_inventario" readonly>
                                                            <%   try {
                                                                    objCone.getConn();
                                                                    String query = "SELECT id_inventario, descripcion_inventario from inventario";
                                                                    PreparedStatement psI;
                                                                    ResultSet rs;
                                                                    psI = objCone.getConn().prepareStatement(query);
                                                                    rs = psI.executeQuery();
                                                                    while (rs.next()) {
                                                                        if (rs.getInt(1) == ObjDetIn.getId_inventario()) {
                                                                            out.println("<option value = " + rs.getInt(1) + " selected>" + rs.getString(2) + "</option>");
                                                                        }
                                                                    }
                                                                } catch (Exception e) {
                                                                }
                                                            %>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div> 
                                            <div class="col-md-12">
                                                <div class="form-group ">
                                                    <label class="media mb-1" for="txtId_Ubicacion"> Seleccione Ubicacion </label>
                                                    <div class="form-group"id="fg_id_producto">
                                                        <select class="form-control" id="txtId_Ubicacion" name="txtId_Ubicacion">
                                                            <%                                                            try {
                                                                    objCone.getConn();
                                                                    String query = "SELECT id_ubicacion, nombre_ubicacion from ubicacion";
                                                                    PreparedStatement psI;
                                                                    ResultSet rs;
                                                                    psI = objCone.getConn().prepareStatement(query);
                                                                    rs = psI.executeQuery();
                                                                    while (rs.next()) {
                                                                        if (rs.getInt(1) == ObjDetIn.getId_ubicacion()) {
                                                                            out.println("<option value = " + rs.getInt(1) + " selected>" + rs.getString(2)+ "</option>");
                                                                        } else {
                                                                            out.println("<option value = " + rs.getInt(1) + ">" + rs.getString(2) + " "  + "</option>");
                                                                        }
                                                                    }
                                                                } catch (Exception e) {
                                                                }
                                                            %>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>                                               

                                            <div class="form-group mt-4 mb-0">
                                                <button class="btn btn-primary btn-block" type="submit">Modificar Tipo Producto</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                <jsp:include page="Footer.jsp"></jsp:include>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/datatables-demo.js"></script>
        <script src="js/validacion.js" type="text/javascript"></script>
    </body>
</html>
