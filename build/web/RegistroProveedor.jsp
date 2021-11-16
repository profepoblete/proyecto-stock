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
        <title>Registro de Proveedor</title>
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/validacion.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.24.1/feather.min.js" crossorigin="anonymous"></script>
    </head>
    <%
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
                                        <div class="card-header justify-content-center"><h3 class="font-weight-light my-4">Registro de Proveedor</h3></div>
                                        <div class="justify-content-center" style="text-align: center;" id="divAlert"></div>
                                        <div class="card-body">
                                            <form action="AddProveedor" id="frmAgregarProveedor" name="frmAgregarProveedor" method="post" autocomplete="off" accept-charset="ISO-8859-1">
                                                <div class="form-row">
                                                <%--<div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="small mb-1" for="inputFirstName"><i data-feather="user-x"></i> Id proveedor</label>
                                                            <div class="form-group"id="fg_id_proveedor">
                                                                <input class="form-control py-4" id="txtId_proveedor" name="txtId_proveedor" type="number" maxlength="10" placeholder="0" />
                                                            </div>
                                                        </div>
                                                    </div>--%>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="small mb-1" for="inputFirstName"><i data-feather="user-x"></i> Rut</label>
                                                            <div class="form-group" id="fg_rut">
                                                                <input class="form-control py-4" id="txtRut_Proveedor"  name="txtRut_Proveedor"  type="text" placeholder="11.111.111.1" />
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="small mb-1" for="inputFirstName"><i data-feather="user"></i> Nombre</label>
                                                            <div class="form-group" id="fg_nombre">
                                                                <input class="form-control py-4" id="txtNombre_Proveedor"  name="txtNombre_Proveedor"  type="text" placeholder="Nombre" />
                                                            </div>
                                                        </div>
                                                    </div>


                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="small mb-1" for="inputLastName"><i data-feather="users"></i> Razón Social</label>
                                                            <div class="form-group" id="fg_razon_social">
                                                                <input class="form-control py-4" id="txtRazonSocial_Proveedor" name="txtRazonSocial_Proveedor" type="text" placeholder="Ingrese Razón Social" />
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="small mb-1" for="inputLastName"><i data-feather="phone"></i> Telefono</label>
                                                            <div class="form-group" id="fg_fono">
                                                                <input class="form-control py-4" id="txtFono_Proveedor"  name="txtFono_Proveedor" type="tel" placeholder=" 22 XX-XX-XXX" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="small mb-1" for="inputLastName"><i data-feather="phone"></i> Dirección</label>
                                                            <div class="form-group" id="fg_direccion">
                                                                <input class="form-control py-4" id="txtDireccion_Proveedor" name="txtDireccion_Proveedor" type="text" placeholder="Ingrese Dirección" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="small mb-1" for="inputLastName"><i data-feather="phone"></i> Correo</label>
                                                            <div class="form-group"  id="fg_correo">
                                                                <input class="form-control py-4" id="txtCorreo_Proveedor" name="txtCorreo_Proveedor" type="email" aria-describedby="emailHelp" placeholder="proveedor@ejemplo.com" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="small mb-1" for="inputFirstName"><i data-feather="user-x"></i> Estado</label>
                                                            <div class="form-group" id="fg_estado">
                                                                <input class="form-control py-4" id="txtEstado_Proveedor"  name="txtEstado_Proveedor"  type="text" maxlength="1"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">												
                                                    <div class="form-group">
                                                        <label for="exampleSelect1"><i data-feather="check-square"></i>Comuna</label>
                                                        <select class="form-control" id="txtId_comuna" name="txtId_comuna">
                                                            <%
                                                                try {
                                                                    objCone.getConn();
                                                                    String query = "SELECT id_comuna, nombre_comuna FROM comuna";
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
                                                   <input class="btn btn-primary btn-block" name="btnGuardar" type="submit" value="Registrar Proveedor">
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
    </body>
</html>
