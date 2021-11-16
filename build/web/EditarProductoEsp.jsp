<%@page import="Modelos.ProductoEsp"%>
<%@page import="Modelos.Producto"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Conexion.ConexionDB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAO.ProductoDAO"%>
<%@page import="Modelos.Producto"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Conexion.ConexionDB"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Tipo Producto</title>
        <link href="css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.24.1/feather.min.js" crossorigin="anonymous"></script>

        <%
        HttpSession objsesion = request.getSession();

        String rol = (String) objsesion.getAttribute("rol");

        ConexionDB objCone = new ConexionDB();

        Producto objPro = (Producto) objsesion.getAttribute("objPro");
        String id_producto = (String) objsesion.getAttribute("id_producto");
        objPro.setId_producto(Integer.parseInt(id_producto));
        int aux = objPro.getTipo_producto();        
        System.out.println("Esto es el aux:"+ aux);
        String aux2 = null;
        
            if (aux==1) {
                    aux2 = "False";
                } else {
                    aux2= "True";
                };


            String IdProducto = request.getParameter("id_producto");

        %>

    </head>

    <body class="nav-fixed">
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
                                            <div class="h3 text-primary font-weight-300 mb-0">Ingresar Producto especifico</div>

                                        </div>
                                        <hr class="m-0" />
                                        <div class="justify-content-center" style="text-align: center;" id="divAlert"></div>
                                        <div class="card-body p-3">
                                            <form action="AddProductoEsp" id="AddProductoEsp" method="POST" autocomplete="off" accept-charset="ISO-8859-1">

                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="media mb-1" for="inputFirstName"><i data-feather="user-x"></i> Codigo Producto generico</label>
                                                        <div class="form-group"id="fg_id_producto">
                                                            <input readonly="True" class="form-control py-4" id="txtId_producto" name="txtId_producto" type="" value="<%out.print(IdProducto);%>"/>
                                                    </div>
                                                </div>
                                            </div> 
                                            <div class="col-md-12">
                                                <div class="form-group ">
                                                    <label class="media mb-1" for="inputFirstName"><i data-feather="user-x"></i> Serial Producto</label>
                                                    <div class="form-group"id="fg_id_producto">
                                                        <input class="form-control py-4" id="txtSerialProducto" name="txtSerialProducto" type="number" placeholder="000000000"/>
                                                    </div>
                                                </div>
                                            </div>   

                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="media mb-1" for="inputFirstName">Fecha de depreciación </label>
                                                    <div class="form-group"id="fg_id_producto">
                                                        <input class="form-control py-4" id="dtpFechaDepreciacion"  name="dtpFechaDepreciacion" type="date" placeholder="YYYY-MM-DD"/>
                                                    </div>
                                                </div>

                                                <div class="col-md-12">
                                                    <div class="form-group ">
                                                        <label class="media mb-1" for="txtCantidad"> Cantidad a agregar</label>
                                                        <div class="form-group"id="fg_id_producto">
                                                            <input class="form-control" id="txtCantidad" name="txtCantidad" type="number" value="1" min="1" max="100"/>
                                                        </div>
                                                    </div>
                                                </div>   

                                            </div>                                                
                                            <div class="col-md-12">
                                                <div class="form-group ">
                                                    <label class="media mb-1" for="txtId_inventario"> Seleccione Inventario </label>
                                                    <div class="form-group"id="fg_id_producto">
                                                        <select class="form-control" id="txtId_inventario" name="txtId_inventario">
                                                            <%                                                            try {
                                                                    objCone.getConn();
                                                                    String query = "SELECT id_inventario, descripcion_inventario from inventario";
                                                                    PreparedStatement psI;
                                                                    ResultSet rs;
                                                                    psI = objCone.getConn().prepareStatement(query);
                                                                    rs = psI.executeQuery();
                                                                    while (rs.next()) {
                                                                        out.println("<option value = " + rs.getInt(1) + ">" + rs.getString(2) + "</option>");
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
                                                                        out.println("<option value = " + rs.getInt(1) + ">" + rs.getString(2) + "</option>");
                                                                    }
                                                                } catch (Exception e) {
                                                                }
                                                            %>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>                                               

                                            <div class="form-group mt-4 mb-0">
                                                <button class="btn btn-primary btn-block" type="submit">Registrar Tipo Producto</button>
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
