/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Test;

import DAO.ProductoDAO;
import DAO.TipoProductoDAO;
import DAO.UbicacionDAO;
import DAO.UsuarioDAO;
import Modelos.Producto;
import Modelos.TipoProducto;
import Modelos.Ubicacion;
import Modelos.Usuario;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Calendar;

/**
 *
 * @author Felipe
 */
public class Test {
    public static void main(String[] args) {
        
        UbicacionDAO objDAO = new UbicacionDAO();
        

        Ubicacion objUbicacion = new Ubicacion();


        objUbicacion.setCodigo_ubicacion("A51");
        String texto = objUbicacion.getCodigo_ubicacion();
        objUbicacion = objDAO.buscarPorId(objUbicacion);
        
        objUbicacion.setCodigo_ubicacion(texto);
        System.out.println(objUbicacion.getCodigo_ubicacion());
        System.out.println(objUbicacion.getDescripcion_ubicacion());
        System.out.println(objUbicacion.getCodigo_area());
        
        objUbicacion.setDescripcion_ubicacion("BASURA");
        
        if(objDAO.editarUbicacion(objUbicacion)){
            System.out.println("Bien");
        }else{
            System.out.println("Mal");
        }
        
        
        
        
        
        
    }
    
}
