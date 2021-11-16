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
        <title>Registro de Ubicacion</title>
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/validacion.css" rel="stylesheet" />
        <script src="ValidarRUT.js"></script>
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.24.1/feather.min.js" crossorigin="anonymous"></script>
    </head>
<%
        HttpSession objsesion = request.getSession();
    
        String rol = (String)objsesion.getAttribute("rol");
        
       
        ConexionDB objCone = new ConexionDB();
        
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
                                    <div class="card-header justify-content-center"><h3 class="font-weight-light my-4">Registro Ubicacion</h3></div>
                                    <div class="justify-content-center" style="text-align: center;" id="divAlert"></div>
                                    <div class="card-body">
                                            <form action="AddUbicacion" id="frmAgregarUbicacion" name="frmAgregarUbicacion" method="post" autocomplete="off" accept-charset="ISO-8859-1">
                                                <div class="form-row">
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <label class="small mb-1" for="inputFirstName"><i data-feather="user-x"></i> Codigo Ubicacion</label>
                                                            <div class="form-group" id="fg_codigo_ubicacion">
                                                                <input class="form-control py-4" id="txtCodigo_ubicacion" name="txtCodigo_ubicacion"  name="txtCodigo_ubicacion"  type="text" placeholder="000000" />
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <label class="small mb-1" for="inputFirstName"><i data-feather="user"></i> Descripcion Ubicacion</label>
                                                            <div class="form-group" id="fg_descripcion_ubicacion">
                                                                <div class="form-group"id="fg_descripcion_producto">
                                                                    <textarea class="form-control" id="txtDescripcion_ubicacion" name="txtDescripcion_ubicacion" rows="4" cols="50" maxlength="500" placeholder="Lugar,Piso etc..."></textarea>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>


                                                     <div class="col-md-6">												
                                                    <div class="form-group">
                                                        <label for="exampleSelect1" >Codigo Area</label>
                                                        <select class="form-control" id="txtCodigo_area" name="ddlCodigo_area">
                                                        <%
                                                            try {
                                                                objCone.getConn();
                                                                String query = "SELECT codigo_area, nombre_area FROM area";
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

                                                    <div class="col-md-6">												
                                                    <div class="form-group">
                                                        <label for="exampleSelect1" >Tipo Ubicacion</label>
                                                        <select class="form-control" id="txtTipo_ubicacion" name="ddlId_tipo_ubicacion">
                                                        <%
                                                            try {
                                                                objCone.getConn();
                                                                String query = "SELECT id_tipo_ubicacion, nombre_tipo_ubicacion FROM tipo_ubicacion";
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
                                                   <input class="btn btn-primary btn-block" name="btnGuardar" type="submit" value="Registrar Ubicacion">
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
