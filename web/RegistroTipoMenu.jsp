
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
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.24.1/feather.min.js" crossorigin="anonymous"></script>
    </head>
    <%
        HttpSession objsesion = request.getSession();
    
        String rol = (String)objsesion.getAttribute("rol");
        
        if(!rol.equalsIgnoreCase("Administrador")){
            response.sendRedirect("Index.jsp");
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
                            <!-- Create Organization-->
                            <div class="col-xl-5 col-lg-6 col-md-8 col-sm-11">
                                <div class="card mt-5">
                                    <div class="card-body p-5 text-center">
                                        <div class="icons-org-create align-items-center mx-auto"><i class="icon-users" data-feather="users"></i><i class="icon-plus fas fa-plus"></i></div>
                                        <div class="h3 text-primary font-weight-300 mb-0">Ingresar Tipo de Menu</div>
                                    </div>
                                    <hr class="m-0" />
                                    <div class="card-body p-5">
                                        <form action="AddTipoMenu" id="frmAgregarRol" method="post" autocomplete="off" accept-charset="ISO-8859-1">
                                            
                                            <div class="col-md-12">	
                                                <div class="form-group">
                                                    <label for="exampleSelect1" >Tipo de Usuario</label>
                                                    <select class="form-control" id="ddlTipo_Usuario" name="ddlTipo_Usuario">
                                                    <%
                                                        ConexionDB objCon = new ConexionDB();
                                                        try {
                                                               objCon.getConn();
                                                               String query = "SELECT ID_TIPO_USUARIO, CATEGORIA_TIPO_USUARIO FROM TIPO_USUARIO";
                                                               PreparedStatement psI;
                                                               ResultSet rs;
                                                               psI = objCon.getConn().prepareStatement(query);
                                                               rs = psI.executeQuery();
                                                               while(rs.next()){
                                                                   out.println("<option value = " + rs.getInt(1) + ">" + rs.getString(2) + "</option>");
                                                               }
                                                        }catch (Exception e) {
                                                        }
                                                    %>
                                                    </select>
                                                </div>
                                            </div>
                                                    <div class="col-md-12">	
                                                        <div class="form-group">
                                                    <label for="exampleSelect1" >Nombre de Menu</label>
                                                    <%
                                                        try {
                                                               objCon.getConn();
                                                               String query = "SELECT ID_MENU, NOMBRE_MENU FROM MENU";
                                                               PreparedStatement psI;
                                                               ResultSet rs;
                                                               psI = objCon.getConn().prepareStatement(query);
                                                               rs = psI.executeQuery();
                                                               %>
                                                               <div class="form-row">
                                                               <%
                                                               while(rs.next()){
                                                                   if(rs.getInt(1)!=1){
                                                                       %>
                                                                       <div class="col-md-6" style="">
                                                                        <div class="form-group">
                                                                            <label class="small mb-1" for="inputLastName"><i data-feather="user"></i><%=rs.getString(2)%></label>
                                                                            <div class="form-group">
                                                                                <input type="checkbox" name="chkMenu" id="chkMenu" value="<%=rs.getInt(1)%>">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                   <%}
                                                                   %>
                                                                    
                                                                
                                                               <%}%>
                                                               </div>
                                                               <%
                                                        }catch (Exception e) {
                                                        }
                                                    %>
                                                </div>
                                            </div>
                                            <div class="form-group mt-4 mb-0">
                                                    <button class="btn btn-primary btn-block" type="submit">Registrar Tipo de Menu</button>
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
    </body>
</html>

