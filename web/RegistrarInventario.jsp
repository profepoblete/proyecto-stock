<%-- 
    Document   : RegistrarInventario
    Created on : 11-04-2021, 14:15:56
    Author     : Tapir
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Conexion.ConexionDB"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de Inventarios</title>
       <link href="css/styles.css" rel="stylesheet" />
        <link href="css/validacion.css" rel="stylesheet" />
        <script src="js/validacion.js" type="text/javascript"></script>
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.24.1/feather.min.js" crossorigin="anonymous"></script>
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
                                        <div class="h3 text-primary font-weight-300 mb-0">Ingresar Inventario</div>
                                    </div>
                                    <div class="justify-content-center" style="text-align: center;" id="divAlert"></div>
                                    <div class="justify-content-center" style="text-align: center;" id="divAlertLargo"></div>
                                    <div class="justify-content-center" style="text-align: center;" id="divAlertNum"></div>
                                          
                                    <hr class="m-0" />
                                    <div class="card-body p-5">
                                        <form action="AddInventario" id="frmAgregarInventario" name="frmAgregarInventario" method="post" autocomplete="off" accept-charset="ISO-8859-1">
                                            
                                            

                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="small mb-1" for="txtDescripcion_inventario"> Descricíon Inventario</label>
                                                    <div class="form-group"id="fg_codigo">
                                                        <input class="form-control py-4" type="text" id="txtDescripcion_inventario" name="txtDescripcion_inventario" maxlength="18" placeholder="Ingrese un nombre para inventario" aria-label="Organization Name" aria-describedby="orgNameExample" />
                                                    </div>
                                                </div>
                                            </div>                                               
                                            <div class="col-md-12">
                                            <div class="form-group">
                                                    <label for="exampleSelect1" >Código Area/label>
                                                    <select class="form-control" id="ddlCodigo_CCosto_bodega" name="ddlCodigo_CCosto_bodega">
                                                    <%
                                                        ConexionDB objCon = new ConexionDB();
                                                        try {
                                                            objCon.getConn();
                                                            String query = "select id_area, nombre_area from area";
                                                            PreparedStatement psI;
                                                            ResultSet rs;
                                                            psI = objCon.getConn().prepareStatement(query);
                                                            rs = psI.executeQuery();
                                                            while (rs.next()) {
                                                                out.println("<option value = " + rs.getString(1) + ">" + rs.getString(1) + "</option>");
                                                            }
                                                        } catch (Exception e) {
                                                        }
                                                    %>
                                                </select>
                                                </div>
                                                <input class="btn btn-primary btn-block mt-2" name="btnGuardar" type="submit" value="Registrar Inventario"> 
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
            <script src="js/validacion.js"></script>
            <script src="js/validacion.js" type="text/javascript"></script>
    </body>
</html>
