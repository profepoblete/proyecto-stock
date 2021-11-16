
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Conexion.ConexionDB"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Tabla Sedes</title>
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
                                        <div class="h3 text-primary font-weight-300 mb-0">Ingresar Bodega</div>
                                    </div>
                                    <div class="justify-content-center" style="text-align: center;" id="divAlert"></div>
                                    <div class="justify-content-center" style="text-align: center;" id="divAlertLargo"></div>
                                    <div class="justify-content-center" style="text-align: center;" id="divAlertNum"></div>
                                          
                                    <hr class="m-0" />
                                    <div class="card-body p-5">
                                        <form action="AddBodega" id="frmAgregarBodega" name="frmAgregarBodega" method="post" autocomplete="off" accept-charset="ISO-8859-1">
                                            
                                            

                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="small mb-1" for="inputFirstName"><i data-feather="user-x"></i> Código Bodega</label>
                                                    <div class="form-group"id="fg_codigo">
                                                        <input class="form-control py-4" type="text" id="txtCodigo_bodega" name="txtCodigo_bodega" maxlength="10" placeholder="Ingrese Código" aria-label="Organization Name" aria-describedby="orgNameExample" />
                                                    </div>
                                                </div>
                                            </div>



                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="small mb-1" for="inputFirstName"><i data-feather="user-x"></i> Volumen</label>
                                                    <div class="form-group"id="fg_volumen">
                                                        <input class="form-control py-4" type="number" id="txtVolumen_bodega" name="txtVolumen_bodega" maxlength="11" min="0" placeholder="Ingrese Volumen en Números" aria-label="Organization Name" aria-describedby="orgNameExample" />
                                                    </div>
                                                </div>
                                            </div>





                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="small mb-1" for="inputFirstName"><i data-feather="user-x"></i> Ubicación</label>
                                                    <div class="form-group"id="fg_ubicacion">
                                                        <textarea class="form-control" id="txtUbicacion_bodega" name="txtUbicacion_bodega" rows="4" cols="50" maxlength="500"></textarea>
                                                    </div>
                                                </div>
                                            </div>

                                            
                                            <div class="col-md-12">
                                            <div class="form-group">
                                                    <label for="exampleSelect1" >Código Centro de Costo</label>
                                                    <select class="form-control" id="ddlCodigo_CCosto_bodega" name="ddlCodigo_CCosto_bodega">
                                                    <%
                                                        ConexionDB objCon = new ConexionDB();
                                                        try {
                                                            objCon.getConn();
                                                            String query = "select codigo_centro_costo, concat_ws (' ', codigo_centro_costo, nombre_centro_costo) as nombre from centro_costo";
                                                            PreparedStatement psI;
                                                            ResultSet rs;
                                                            psI = objCon.getConn().prepareStatement(query);
                                                            rs = psI.executeQuery();
                                                            while (rs.next()) {
                                                                out.println("<option value = " + rs.getString(1) + ">" + rs.getString(2) + "</option>");
                                                            }
                                                        } catch (Exception e) {
                                                        }
                                                    %>
                                                </select>
                                                </div>
                                                <input class="btn btn-primary btn-block" name="btnGuardar" type="submit" value="Registrar Bodega"> 
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
