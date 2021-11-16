
<%@page import="Modelos.CentroCosto"%>
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
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.24.1/feather.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="nav-fixed">
           <%
            HttpSession sessionMostrar = request.getSession();
            CentroCosto objCentroCosto = (CentroCosto)sessionMostrar.getAttribute("objCentroCosto");
            String codigo_centro_costo = (String)sessionMostrar.getAttribute("codigo_centro_costo");
            objCentroCosto.setCodigo_centro_costo(codigo_centro_costo);
        
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
                                <div class="col-lg-7">
                                    <div class="card shadow-lg border-0 rounded-lg mt-5">
                                        <div class="card-header justify-content-center"><h3 class="font-weight-light my-4">Registro de Centro de Costo</h3></div>
                                        <div class="justify-content-center" style="text-align: center;" id="divAlert"></div>
                                        <div class="justify-content-center" style="text-align: center;" id="divAlertLargo"></div>
                                        <div class="card-body">
                                            <form action="UpdCentroCosto" id="frmEditarCentroCosto" name="frmEditarCentroCosto" method="post" autocomplete="off" accept-charset="ISO-8859-1">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="small mb-1" for="inputFirstName"><i data-feather="hash"></i> Código</label>
                                                            <div class="form-group" id="fg_codigo" >
                                                                <input class="form-control py-4" id="txt_codigo_CCosto" name="txt_codigo_CCosto" maxlength="10" type="text" placeholder="Ingrese código de centro de costo" value="<%= objCentroCosto.getCodigo_centro_costo() %>"/>
                                                            </div>
                                                        </div>
                                                    </div>  

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="small mb-1" for="inputFirstName"><i data-feather="user-x"></i> Nombre de Centro de Costo</label>
                                                            <div class="form-group" id="fg_nombre" >
                                                                <input class="form-control py-4" id="txt_nombre_CCosto" name="txt_nombre_CCosto" maxlength="45" type="text" placeholder="Ingrese nombre" value="<%= objCentroCosto.getNombre_centro_costo() %>"/>
                                                            </div>
                                                        </div>
                                                    </div> 

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="small mb-1" for="inputFirstName"><i data-feather="calendar"></i> Fecha</label>
                                                            <div class="form-group" id="fg_fecha" >
                                                                <input class="form-control py-4" id="dtpFechaCentroCosto" name="dtpFechaCentroCosto" type="date" value="<%= objCentroCosto.getFecha_compra_centro_costo()%>"/>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="small mb-1" for="inputFirstName"><i data-feather="dollar-sign"></i> Gasto Total</label>
                                                            <div class="form-group" id="fg_gastoTotal" >
                                                                <input class="form-control py-4" id="txt_GastoTotal" name="txt_GastoTotal" type="number" placeholder="$" value="<%= objCentroCosto.getTotalGasto_centro_costo() %>" />
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-6">												

                                                        <div class="form-group">
                                                            <label for="exampleSelect1"<i data-feather="home"></i> Código de Área</label>
                                                            <select class="form-control" id="ddlCodigo_Area_CCosto" name="ddlCodigo_Area_CCosto">
                                                            <%
                                                                ConexionDB objCon = new ConexionDB();
                                                                try {
                                                                    objCon.getConn();
                                                                    String query = "SELECT CODIGO_AREA, nombre_area FROM AREA";
                                                                    PreparedStatement psI;
                                                                    ResultSet rs;
                                                                    psI = objCon.getConn().prepareStatement(query);
                                                                    rs = psI.executeQuery();
                                                                    
                                                                    while (rs.next()) {
                                                                        if(rs.getString(1).equalsIgnoreCase(objCentroCosto.getCodigo_area())){
                                                                            String codigo = rs.getString(1);
                                                                            String codigo2 = objCentroCosto.getCodigo_area();
                                                                            out.println("<option value = " + rs.getString(1) + " selected>" + rs.getString(1) + " " + rs.getString(2) + "</option>");
                                                                        }else{
                                                                            out.println("<option value = " + rs.getString(1) + ">" + rs.getString(1) + " " + rs.getString(2) + "</option>");
                                                                        }
                                                                    }
                                                                } catch (Exception e) {
                                                                }
                                                            %>
                                                        </select>
                                                    </div>
                                                </div>	

                                            </div>

                                            <input class="btn btn-primary btn-block" name="btnGuardar" type="submit" value="Editar Centro de Costo">
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
    <script>
        //Validaciones Editar Centro de Costo
     $(document).ready(function(){
         $("#frmEditarCentroCosto").submit(function(e){
               var err = false;
               var errLargo = false;
               var errNum = false;
               var codigo = $("#txt_codigo_CCosto").val();
               var nombre = $("#txt_nombre_CCosto").val();               
               var gastoTotal = $("#txt_GastoTotal").val(); 
              
               
                              
               if(codigo == ""){
                   err = true;                  
                   $("#fg_codigo").addClass("form-control-error");
               }
                if(codigo.length>10){
                   errLargo = true;                  
                   $("#fg_codigo").addClass("form-control-error");
               }
               
               if(nombre == ""){
                   err = true;                   
                   $("#fg_nombre").addClass("form-control-error");
               }
               if(nombre.length>45){
                   errLargo = true;                   
                   $("#fg_nombre").addClass("form-control-error");
               }
              
               
                if(gastoTotal == ""){
                   err = true;                
                   $("#fg_gastoTotal").addClass("form-control-error");
               }
                if(gastoTotal.length>11){
                   errLargo = true;                
                   $("#fg_gastoTotal").addClass("form-control-error");
               }
                if(isNaN(gastoTotal)){
                   errNum = true;                   
                   $("#fg_gastoTotal").addClass("form-control-error");
               }
               
               if(err){
               $("#divAlert").html('<div class="alert alert-danger alert-dismissable">\n\
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                Hay campos vacios, por favor verificalos.</div>');
               e.preventDefault();
                }
               if(errLargo){
               $("#divAlertLargo").html('<div class="alert alert-danger alert-dismissable">\n\
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                Hay campos que exceden el largo permitido, por favor verificalos.</div>');
               e.preventDefault();
                }
                if(errNum){
               $("#divAlertNum").html('<div class="alert alert-danger alert-dismissable">\n\
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                Se ingresó letras en campo númerico, por favor verificalos.</div>');
               e.preventDefault();
                }
         });                         
         
         $("#txt_codigo_CCosto").on('focusin',function(){              
                $("#fg_codigo").removeClass("form-control-error");
         });
         $("#txt_nombre_CCosto").on('focusin',function(){              
                $("#fg_nombre").removeClass()("form-control-error");
         });  
         $("#txt_GastoTotal").on('focusin',function(){              
                $("#fg_gastoTotal").removeClass()("form-control-error");
         }); 
                 
     });
    </script>
</html>
