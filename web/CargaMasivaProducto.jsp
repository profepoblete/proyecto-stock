<%@page import="java.util.Iterator"%>
<%@page import="Modelos.Producto"%>
<%@page import="DAO.ProductoDAO"%>
<%@page import="java.util.ArrayList"%>
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
        <title>Carga de productos</title>
        <link href="css/validacion.css" rel="stylesheet" />
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="js/validacion.js" type="text/javascript"></script>

        <link href="css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.24.1/feather.min.js" crossorigin="anonymous"></script>
    </head>
    <%
        HttpSession objsesion = request.getSession();

        String mensaje = (String) objsesion.getAttribute("divError");

        objsesion.removeAttribute("divError");
        
        ArrayList<String> validados = (ArrayList<String>) request.getAttribute("listaErrores");
        String messageExito = (String) request.getAttribute("Exito");

        ConexionDB objCone = new ConexionDB();
        ProductoDAO objProductoDAO = new ProductoDAO();
        ArrayList<Producto> lstProducto = objProductoDAO.listarProducto();
        Iterator<Producto> iter = lstProducto.iterator();
        Producto objProducto = null;
        while(iter.hasNext()){
        objProducto = iter.next();
        System.out.println(objProducto.getId_producto() + " " + objProducto.getNombre_producto());
        
        }
    %>
        while (iter.hasNext()) {
            objProducto = iter.next();
            System.out.println(objProducto.getId_producto() + " " + objProducto.getNombre_producto());
        }

        
    %> 
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
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="bg-primary-soft card-header justify-content-center">
                                    <div class="bg-primary-soft">
                                    <h2>Carga masiva de productos</h2>
                                        <div class="text-center">
    <%
        Integer areaInt = (Integer)objsesion.getAttribute("area");
        String area = String.valueOf(areaInt);
        String rol = (String) objsesion.getAttribute("rol");
            objCone.getConn();
            PreparedStatement pst;
            ResultSet rs = null;
String sql ="select \n" +
"concat(area.nombre_area, ' ID = ',format(area.id_area,0)) area,\n" +
"concat(inventario.descripcion_inventario, ' ID = ',format(inventario.id_inventario,0)) inventario\n" +
"from inventario\n" +
"left JOIN area on area.id_area = inventario.id_area\n" +
"where area.id_area = ?";
            pst = objCone.getConn().prepareStatement(sql);
            pst.setString(1, area);
            rs = pst.executeQuery();
            while(rs.next()){
            String valor_area =  rs.getString(1);
            String valor_inventario = rs.getString(2);
            System.out.println("los valores del area e inventario son: "+valor_area + " y " + valor_inventario);
            out.println("<h3>Area: "+valor_area +"</h3>" + "<h3>Inventario: " + valor_inventario+"</h3>");
            }
    %>
                                        </div>
                                        </div>
                                    </div>
                                    <div class="justify-content-center" style="text-align: center;" id="divAlert"></div>
                                    <div class="card-body">
                                            <div class="">
                                                <h3>Buscar ID producto</h3>
                                              <label for="txtBuscar">Buscar codigo producto </label>
                                              <input id="txtBuscar" class="form-control mb-10">
                                            </div>
                                             <div class="">
                                                <h3>Buscar ID Ubicacion</h3>
                                              <label for="txtBuscarUbi">Buscar codigo ubicacion </label>
                                              <input id="txtBuscarUbi" class="form-control mb-10">
                                            </div>
                                        <form class="my-10" action="CargaMasivaProducto" id="frmCargaMasivaProducto" method="post" 
                                              autocomplete="off" accept-charset="ISO-8859-1" enctype="multipart/form-data">
                                            <h3>Carga archivo</h3>
                                            <div class="form-row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="inputFirstName"><i data-feather="file-text"></i> Ingrese el documento</label>
                                                        <div class="form-group"id="fg_descripcion_producto">
                                                            <input type="file" class="form-control" name="inputFile" id="inputFile" accept=".csv"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="justify-content-center" style="text-align: center;" id="divAlert">
                                                <%if (mensaje != null) {
                                                        out.print(mensaje);
                                                    }%>
                                            </div>
                                            <div class="form-group mt-4 mb-0">
                                                <button class="btn btn-primary btn-block" 
                                                        type="submit"
                                                        >Ingresar documento</button>
                                            </div>

                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Modal-->
                    <div class="container my-4">                         
                        <% if (validados != null) {
                                out.println("<div class='alert alert-danger text-center' role='alert'>Hubo uno o m�s errores al intentar cargar el archivo  </div>");
                                out.println("<button data-toggle='modal' data-target='#Modal' class='btn btn-danger btn-lg btn-block'>Ver errores</button>");
                            }
                        %>
                        <%
                            if (messageExito != null) {
                                out.println("<div class='alert alert-success text-center' role='alert'>"+messageExito + "</div>");

                            }
                        %>
                    </div>
                    <div class="modal fade" id="Modal" tabindex="-1" role="dialog" aria-labelledby="ModalTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="ModalTitle">Errores</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <ul class="list-group">

                                        <%
                                            if (validados != null) {

                                                for (String elem : validados) {
                                                    out.println("<li class='list-group-item list-group-item-danger'>" + elem + "</li>");

                                                }
                                            }
                                        %>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                <jsp:include page="Footer.jsp"></jsp:include>
            </div>
        </div>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js" type="text/javascript"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/datatables-demo.js"></script>
        <script src="js/validacion.js" type="text/javascript"></script>
    </body>
</html>
