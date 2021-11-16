
<%@page import="Modelos.TipoUbicacion"%>
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
        <title>Editar Ubicación</title>
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/validacion.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.24.1/feather.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="nav-fixed">
        <%
            HttpSession sessionMostrar = request.getSession();
            TipoUbicacion objTipoUbicacion = (TipoUbicacion)sessionMostrar.getAttribute("objTipoUbicacion");
            int id_tipo_ubicacion = (Integer)sessionMostrar.getAttribute("id_tipo_ubicacion");
            objTipoUbicacion.setId_tipo_ubicacion(id_tipo_ubicacion);
        
        %>
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
                                            <div class="h3 text-primary font-weight-300 mb-0">Editar Tipo Ubicación</div>
                                        </div>
                                        <div class="justify-content-center" style="text-align: center;" id="divAlert"></div>
                                        <div class="justify-content-center" style="text-align: center;" id="divAlertLargo"></div>
                                        <hr class="m-0" />
                                        <div class="card-body p-5">
                                            <form action="UpdTipoUbicacion" id="frmEditarTipoUbicacion" name="frmEditarTipoUbicacion" method="post" autocomplete="off" accept-charset="ISO-8859-1">


                                                <div class="form-group">
                                                    Código
                                                    <div class="form-group" id="fg_codigo">
                                                        <input class="form-control form-control-solid" id="txtCodigo_tipoUbicacion"  name="txtCodigo_tipoUbicacion" maxlength="11" type="text"  value="<%= objTipoUbicacion.getId_tipo_ubicacion() %>" readonly="" placeholder="Ingrese Código" aria-label="Organization Name" aria-describedby="orgNameExample" />
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    Nombre de Ubicación
                                                    <div class="form-group" id="fg_nombre">
                                                        <input class="form-control form-control-solid" id="txtNombre_tipoUbicacion"  name="txtNombre_tipoUbicacion" maxlength="45" type="text"  value="<%= objTipoUbicacion.getNombre_tipo_ubicacion() %>" placeholder="Ingrese Nombre" aria-label="Organization Name" aria-describedby="orgNameExample" />
                                                    </div>
                                                </div>

                                                
                                            <input class="btn btn-primary btn-block" name="btnGuardar" type="submit" value="Editar Tipo Ubicacion">
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
    </body>
</html>
