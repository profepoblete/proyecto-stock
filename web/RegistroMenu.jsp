
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
        <link href="css/validacion.css" rel="stylesheet" type="text/css"/>
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
                            <div class="col-xl-5 col-lg-7 col-md-8 col-sm-11">
                                <div class="card mt-5">
                                    <div class="card-body p-5 text-center">
                                        <div class="icons-org-create align-items-center mx-auto"><i class="icon-users" data-feather="users"></i><i class="icon-plus fas fa-plus"></i></div>
                                        <div class="h3 text-primary font-weight-300 mb-0">Ingresar Menu</div>
                                        
                                    </div>
                                    <div class="justify-content-center" style="text-align: center;" id="divAlert"></div>
                                    <hr class="m-0" />
                                    <div class="card-body p-5">
                                        <form action="AddMenu" id="frmAgregarMenu" method="post" autocomplete="off" accept-charset="ISO-8859-1">
                                            <div class="form-row">
                                                <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="small mb-1" for="inputFirstName"><i data-feather="user-x"></i> Nombre de Menu</label>
                                                    <div class="form-group"id="fg_nombre_menu">
                                                        <input class="form-control py-4" id="txtNombreMenu"  name="txtNombreMenu" type="text" placeholder="" />
                                                    </div>
                                                </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="inputFirstName"><i data-feather="user-x"></i>URL</label>
                                                        <div class="form-group"id="fg_url_menu">
                                                            <input class="form-control py-4" id="txtUrlMenu"  name="txtUrlMenu" type="text" placeholder="" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                    <label for="exampleSelect1" >Ingresar Sub Menu</label>
                                                    <select class="form-control" id="ddlSub_menu" name="ddlSub_menu">
                                                    <%
                                                        ConexionDB objCon = new ConexionDB();
                                                        try {
                                                               objCon.getConn();
                                                               String query = "SELECT ID_MENU, NOMBRE_MENU FROM MENU";
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
                                            <div class="form-group mt-4 mb-0">
                                                    <button class="btn btn-primary btn-block" type="submit">Registrar Menu</button>
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
        <script>
         $(document).ready(function(){
         $("#frmAgregarMenu").submit(function(e){
               var err = false;
               var nombre_menu = $("#txtNombreMenu").val();            
               
               
               
               if(nombre_menu == ""){
                   err = true;
                   //$("#lblNombre").show();
                   $("#fg_nombre_menu").addClass("form-control-error");
               }
               
               if(err){
               $("#divAlert").html('<div class="alert alert-danger alert-dismissable">\n\
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                Hay campos vacios, por favor verificalos.</div>');
               e.preventDefault();
                }
         });
         
         $("#txtNombreMenu").on('focusin',function(){
               // $("#lblNombre").hide();
                $("#fg_nombre_menu").removeClass("form-control-error");
         });
         
         $("#frmAgregarMenu").submit(function(e){
               var err = false;
               var url_menu = $("#txtUrlMenu").val();            
               
               if(url_menu == ""){
                   err = true;
                   //$("#lblNombre").show();
                   $("#fg_url_menu").addClass("form-control-error");
               }
               
               if(err){
               $("#divAlert").html('<div class="alert alert-danger alert-dismissable">\n\
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                Hay campos vacios, por favor verificalos.</div>');
               e.preventDefault();
                }
         });
         
         $("#txtUrlMenu").on('focusin',function(){
               // $("#lblNombre").hide();
                $("#fg_url_menu").removeClass("form-control-error");
         });
                 
     });
        </script>
    </body>
</html>

