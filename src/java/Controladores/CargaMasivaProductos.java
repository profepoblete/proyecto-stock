/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import com.opencsv.CSVReader;
import com.opencsv.exceptions.CsvValidationException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
//Objetos
import DAO.DetalleInventarioDAO;
import Modelos.DetalleInventario;
import DAO.ProductoEspDAO;
import Modelos.ProductoEsp;
import com.opencsv.CSVReaderBuilder;
import com.opencsv.exceptions.CsvException;
import com.opencsv.validators.RowFunctionValidator;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.function.Function;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author tapir
 */
/**
 *
 * Instrucciones para carga masiva
 *
 * @MultipartConfig -> Se debe agregar la etiqueta MultipartConfig Esta etiqueta
 * le indica al servlet que puede usar Part Con el Part podemos tener el
 * InputStream
 *
 * La libreria a usar es OpenCsv Para leer un arvhivo csv se necesita un reader
 *
 */
@WebServlet(name = "CargaMasivaProducto", urlPatterns = {"/CargaMasivaProducto"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)
public class CargaMasivaProductos extends HttpServlet {

    //Validaciones
    //Variables
    List<String[]> datosValidaciones;

    //validaciones
    private static final Function<String[], Boolean> DebenSerNumeros = (x) -> {
        return x[0].trim().matches("\\d+") && x[4].trim().matches("\\d+") && x[5].trim().matches("\\d+") && x[6].trim().matches("\\d+") && x[7].trim().matches("\\d+") && x[8].trim().matches("\\d+");
    };

    private static final Function<String[], Boolean> CantidadCols = (x) -> {
        return x.length == 9;
    };
    private static final Function<String[], Boolean> NoVacio = (x) -> {

        return x[0].trim().matches("\\S+") && x[1].trim().matches("\\S+") && x[2].trim().matches("\\S+")
                && x[3].trim().matches("\\S+")
                && x[4].trim().matches("\\S+")
                && x[5].trim().matches("\\S+")
                && x[6].trim().matches("\\S+") && x[7].trim().matches("\\S+") && x[8].trim().matches("\\S+");
    };

    public boolean MustBeNumber(String[] row) {

        RowFunctionValidator validator = new RowFunctionValidator(DebenSerNumeros, "Los id deben ser datos numericos");
        return validator.isValid(row);

    }

    public boolean MustBeNineCols(String[] row) {

        RowFunctionValidator validator = new RowFunctionValidator(CantidadCols, "Deben ser 9 elementos por linea");
        return validator.isValid(row);

    }

    public boolean ItcannotBeEmpty(String[] row) {

        RowFunctionValidator validator = new RowFunctionValidator(NoVacio, "No puede haber celdas vacias");
        return validator.isValid(row);

    }

    public ArrayList<String> Validaciones(List<String[]> rows) {

        ArrayList<String> errores = new ArrayList<>();

        rows.stream().forEach((row) -> {

            if (!MustBeNineCols(row)) {

                String e = "Error en la linea que empieza por " + row[0] + ": El archivo debe tener 9 columnas con datos";
                errores.add(e);

            } else {
                if (!MustBeNumber(row)) {

                    String e = "Error en la linea que empieza por  " + row[0] + ": Las columnas `ID` deben ser datos numericos";
                    errores.add(e);
                }

                if (!ItcannotBeEmpty(row)) {

                    String e = "Error en la linea que empieza por " + row[0] + ": No puede haber celdas vacias";
                    errores.add(e);
                }
            }

        });

        return errores;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Part filePart = request.getPart("inputFile");   //Recibe el archivo mediante el nombre
        InputStream ins = filePart.getInputStream();    //Se instancia un InputStream
        InputStreamReader streamReader = new InputStreamReader(ins); //Se instancia el InputStreamReader necesario para la libreria
        final CSVReader reader = new CSVReaderBuilder(streamReader).withSkipLines(1).build();
        final CSVReader reader1 = new CSVReaderBuilder(streamReader).withSkipLines(1).build();

        try {
            datosValidaciones = reader.readAll();
            ArrayList<String> validado = Validaciones(datosValidaciones);
            if (validado.size() > 0) {
                request.setAttribute("listaErrores", validado);

                request.getRequestDispatcher("CargaMasivaProducto.jsp").forward(request, response);
            } else {
                //Aqui se aplica la logica
                /**
                 *
                 * Se instancian los objetos y se ejecuta el DAO
                 */
                //Objetos

                DetalleInventarioDAO daoDetalle = new DetalleInventarioDAO();
                DetalleInventario Detalle = new DetalleInventario();
                ProductoEspDAO daoProducto = new ProductoEspDAO();
                ProductoEsp Producto = new ProductoEsp();
                ProductoEsp ultimo = new ProductoEsp();
                SimpleDateFormat parseador = new SimpleDateFormat("dd/mm/yyyy");
                SimpleDateFormat formateador = new SimpleDateFormat("yyyy-mm-dd");

                String fecha1;
                String fecha2;
                String row0;
                String row1;
                String row2;
                String row3;
                String row4;
                String row5;
                String row6;
                String row7;
                String row8;

                for (String[] row : datosValidaciones) {

                    row0 = row[0].trim();
                    row1 = row[1].trim();
                    row2 = row[2].trim();
                    row3 = row[3].trim();
                    row4 = row[4].trim();
                    row5 = row[5].trim();
                    row6 = row[6].trim();
                    row7 = row[7].trim();
                    row8 = row[8].trim();

                    Producto.setId_producto(Integer.parseInt(row0));
                    Producto.setSerial_producto(row1);
                    fecha1 = row2;
                    fecha2 = row3;

                    //Chanchullo medio raro para formatear la fecha a la que pide Date.valueOf... [yyyy-mm-dd]
                    Date FechaParsed1 = parseador.parse(fecha1);
                    String FechaFormato1 = formateador.format(FechaParsed1);
                    Date FechaParsed2 = parseador.parse(fecha2);
                    String FechaFormato2 = formateador.format(FechaParsed2);

                    java.sql.Date sqlDate = java.sql.Date.valueOf(FechaFormato1);

                    Producto.setFecha_creacion((java.sql.Date) (sqlDate));
                    java.sql.Date sqlDate2 = java.sql.Date.valueOf(FechaFormato2);
                    Producto.setFecha_depreciacion((java.sql.Date) (sqlDate2));

                    try {
                        if (daoProducto.AgregarProductoEsp(Producto)) {
                            ultimo = daoProducto.UltimoId();

                            Detalle.setCantidad_producto_inventario(Integer.parseInt(row4));
                            Detalle.setId_ubicacion(Integer.parseInt(row5));
                            Detalle.setId_inventario(Integer.parseInt(row6));
                            Detalle.setGuia_despacho(Integer.parseInt(row7));
                            Detalle.setN_compra(Integer.parseInt(row8));
                            Detalle.setId_producto_E(ultimo.getId_producto_E());

                            if (daoDetalle.agregarDetalleInventario(Detalle)) {
                                request.setAttribute("Exito", "Los productos se han guardado con exito");
                                request.getRequestDispatcher("CargaMasivaProducto.jsp").forward(request, response);

                            }

                        }
                    } catch (Exception e) {
                    }
                }
            }
        } catch (CsvValidationException ex) {
            System.out.println("Error " + ex);
        } catch (CsvException | ParseException ex) {
            Logger.getLogger(CargaMasivaProductos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
