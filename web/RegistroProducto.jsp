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
        <title>Tabla Producto</title>
        <link href="css/validacion.css" rel="stylesheet" />
        <script src="js/validacion.js" type="text/javascript"></script>

        <link href="css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.24.1/feather.min.js" crossorigin="anonymous"></script>
    </head>
    <%
        HttpSession objsesion = request.getSession();

        String rol = (String) objsesion.getAttribute("rol");

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
                                        <div class="card-header justify-content-center"><h3 class="font-weight-light my-4">Registro de Producto</h3></div>
                                        <div class="justify-content-center" style="text-align: center;" id="divAlert"></div>
                                        <div class="card-body">
                                            <form action="AddProducto" id="frmAgregarProducto" method="post" autocomplete="off" accept-charset="ISO-8859-1">
                                                <div class="form-row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="small mb-1" for="txtTipo_producto"><i data-feather="user-x"></i> Tipo Producto</label>
                                                            <div class="form-row d-flex align-items-center ml-2">
                                                                <div class="col-md-1">
                                                                    <input class="form-control" id="txtTipo_producto" name="txtTipo_producto" value="1" type="checkbox" data-html="true" data-toggle="tooltip" data-placement="top"
                                                                           title="
                                                                           <div class='h4 text-danger'>Insumo: Dejar vacio</div>
                                                                           <br/>
                                                                           <div class='h4 text-danger'>Activo: Marcar casilla</div>
                                                                           " />
                                                                </div>
                                                                <div class="col-md-11">
                                                                    <label class="form-check-label" for="txtTipo_producto" data-html="true" data-toggle="tooltip" data-placement="top"
                                                                           title="
                                                                           <div class='h4 text-danger'>Insumo: Dejar vacio</div>
                                                                           <br/>
                                                                           <div class='h4 text-danger'>Activo: Marcar casilla</div>
                                                                           " />Activo o Insumo</label>                                                                    
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="small mb-1" for="txtNombre_producto"><i data-feather="user"></i> Nombre Producto</label>
                                                            <div class="form-group"id="fg_nombre_producto">
                                                                <input class="form-control py-4" id="txtNombre_producto" name="txtNombre_producto" type="text" placeholder="Nombre"  />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <label class="small mb-1" for="inputFirstName"><i data-feather="file-text"></i> Descripcion</label>
                                                            <div class="form-group"id="fg_descripcion_producto">
                                                                <textarea class="form-control" id="txtDescripcion_producto" name="txtDescripcion_producto" rows="4" cols="50" maxlength="500"></textarea>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="small mb-1" for="inputLastName"><i data-feather="dollar-sign"></i> Valor Producto</label>
                                                            <div class="form-group"id="fg_valorNeto_producto">
                                                                <input class="form-control py-4" id="txtValor_producto" name="txtValor_producto" type="number" min="0" placeholder=" 00000" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="small mb-1" for="inputLastName"><i data-feather="info"></i> Marca Producto</label>
                                                            <div class="form-group"id="fg_marca_producto">
                                                                <input class="form-control py-4" id="txtMarca_producto" name="txtMarca_producto" type="text" placeholder="Marca" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="small mb-1" for="inputLastName"><i data-feather="plus"></i> Stock minimo</label>
                                                            <div class="form-group"id="fg_stock_minimo_producto">
                                                                <input class="form-control py-4" id="txtStock_minimo_producto" name="txtStock_minimo_producto" type="number" min="0" placeholder="1-2-3..." />
                                                            </div>

                                                        </div>
                                                    </div>

                                                    <div class="col-md-6">												
                                                        <div class="form-group">
                                                            <label for="exampleSelect1"><i data-feather="check-square"></i> Id Proveedor</label>
                                                            <select class="form-control" id="txtCodigo_bodega" name="txtId_proveedor">
                                                            <%                                                            try {
                                                                    objCone.getConn();
                                                                    String query = "SELECT id_proveedor, rut_proveedor, nombre_proveedor FROM proveedor";
                                                                    PreparedStatement psI;
                                                                    ResultSet rs;
                                                                    psI = objCone.getConn().prepareStatement(query);
                                                                    rs = psI.executeQuery();
                                                                    while (rs.next()) {
                                                                        out.println("<option value = " + rs.getInt(1) + ">" + rs.getString(2) + " " + rs.getString(3) + "</option>");
                                                                    }
                                                                } catch (Exception e) {
                                                                }
                                                            %>
                                                        </select>
                                                    </div>
                                                </div>      
                                            </div>
                                            <div class="form-row"> 
                                                <div class="col-md-6">												
                                                    <div class="form-group">
                                                        <label for="exampleSelect1"><i data-feather="check-square"></i> Tipo Producto</label>
                                                        <select class="form-control" id="txtId_tipo_producto" name="txtId_tipo_producto">
                                                            <%
                                                                try {
                                                                    objCone.getConn();
                                                                    String query = "SELECT id_subtipo_producto, CATEGORIA_TIPO_PRODUCTO FROM subTIPO_PRODUCTO";
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
                                                        <label for="exampleSelect1"><i data-feather="check-square"></i> Tipo Unidad</label>
                                                        <select class="form-control" id="txtId_tipo_unidad" name="txtId_tipo_unidad">
                                                            <%
                                                                try {
                                                                    objCone.getConn();
                                                                    String query = "SELECT ID_TIPO_UNIDAD, NOMBRE_UNIDAD FROM TIPO_UNIDAD";
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
                                                <button class="btn btn-primary btn-block" type="submit">Registrar Producto</button>
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
        <!--Para los tooltips-->
        <script>
            $(function () {
                $('[data-toggle="tooltip"]').tooltip()
            })
        </script>

    </body>
</html>
