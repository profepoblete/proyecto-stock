/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.ConexionDB;
import Interfaces.CRUDCentroCosto;
import Modelos.CentroCosto;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import org.apache.poi.ss.usermodel.Cell;  
import org.apache.poi.ss.usermodel.Row;  
import org.apache.poi.xssf.usermodel.XSSFSheet;  
import org.apache.poi.xssf.usermodel.XSSFWorkbook;  


/**
 *
 * @author José Pablo
 */
public class CentroCostoDAO implements CRUDCentroCosto{

    private static String sql_selectAll = "select * from centro_costo";
    private static String sql_selectArea = "select * from centro_costo where codigo_centro_costo = ?";
    private static String sql_insert = "insert into centro_costo (codigo_centro_costo, nombre_centro_costo, fecha_compra_centro_costo,totalGasto_centro_costo,id_area) values (?,?,?,?,?)";
    private static String sql_delete = "delete from centro_costo where codigo_centro_costo = ?";
    //MODIFICADO V
    private static String sql_update = "update centro_costo set nombre_centro_costo = ?, fecha_compra_centro_costo = ?, totalGasto_centro_costo = ?, id_area = (SELECT id_area from area where codigo_area = ?) where codigo_centro_costo = ?";
    //MODIFICADO ^
    private static String sql_insercion_masiva = "insert into centro_costo (codigo_centro_costo, nombre_centro_costo) values (?,?)";
    
     private static ConexionDB objConn = ConexionDB.InstanciaConn();
    private ResultSet rs; 
    
    @Override
    public boolean agregarCentroCosto(CentroCosto objCentroCosto) {
        PreparedStatement psI;
        try {
            psI = objConn.getConn().prepareStatement(sql_insert);
            psI.setString(1, objCentroCosto.getCodigo_centro_costo());
            psI.setString(2, objCentroCosto.getNombre_centro_costo());
            psI.setDate(3, new Date(objCentroCosto.getFecha_compra_centro_costo().getTime()));
            psI.setInt(4, objCentroCosto.getTotalGasto_centro_costo());
            psI.setString(5, objCentroCosto.getCodigo_area());
            
            if (psI.executeUpdate()>0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AreaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean editarCentroCosto(CentroCosto objCentroCosto) {
        PreparedStatement psU;
        
        try {
            psU = objConn.getConn().prepareStatement(sql_update);                       
            
            psU.setString(1, objCentroCosto.getNombre_centro_costo());
            psU.setDate(2, new Date(objCentroCosto.getFecha_compra_centro_costo().getTime()));
            psU.setInt(3, objCentroCosto.getTotalGasto_centro_costo());
            psU.setString(4, objCentroCosto.getCodigo_area());
            psU.setString(5, objCentroCosto.getCodigo_centro_costo());
            
            if (psU.executeUpdate()>0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AreaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
            return false;
    }

    @Override
    public CentroCosto eliminarCentroCosto(CentroCosto objCentroCosto) {
         PreparedStatement psD;
        try {
            psD = objConn.getConn().prepareStatement(sql_delete);
           psD.setString(1, objCentroCosto.getCodigo_centro_costo());
            
            if (psD.executeUpdate()>0) {
                return null;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AreaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
         return objCentroCosto;
    }

    @Override
    public ArrayList<CentroCosto> listaCentroCosto() {
        ArrayList<CentroCosto> lstCentroCosto = new ArrayList<>();
        PreparedStatement psL;
        try {
            psL = objConn.getConn().prepareStatement(sql_selectAll);
            rs = psL.executeQuery();
            while (rs.next()) {                
                CentroCosto objCentroCosto = new CentroCosto();
                
                objCentroCosto.setCodigo_centro_costo(rs.getString("codigo_centro_costo"));
                objCentroCosto.setNombre_centro_costo(rs.getString("nombre_centro_costo"));
                System.out.println(objCentroCosto.getCodigo_centro_costo());
                System.out.println(objCentroCosto.getNombre_centro_costo());
                if(rs.getDate("fecha_compra_centro_costo") != null)
                {
                    objCentroCosto.setFecha_compra_centro_costo(rs.getDate("fecha_compra_centro_costo"));
                    System.out.println(objCentroCosto.getFecha_compra_centro_costo());
                }
                //ESTO FUE ELIMINADO (else)
                if(rs.getString("totalGasto_centro_costo") != null)
                {
                    objCentroCosto.setTotalGasto_centro_costo(rs.getInt("totalGasto_centro_costo"));//(Integer.parseInt(rs.getString("totalGasto_centro_costo")));
                    System.out.println(objCentroCosto.getTotalGasto_centro_costo());
                }
                if(rs.getString("id_area") != null)
                {
                    objCentroCosto.setCodigo_area(rs.getString("id_area"));
                    System.out.println(objCentroCosto.getCodigo_area());
                }
                
                lstCentroCosto.add(objCentroCosto);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AreaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       return lstCentroCosto;
    }

    @Override
    public List buscar(String texto) {
        List<CentroCosto>  lista = new ArrayList<>();
        int texto2 = 0;
        if(texto.equalsIgnoreCase("Administrador")){
            texto2 = 1;
        }else if(texto.equalsIgnoreCase("Operador")){
            texto2 = 2;
        }
        
        /*String stringFecha = texto;
        SimpleDateFormat formato =new SimpleDateFormat("yyyy-MM-dd"); 
        String a = formato.format(stringFecha); Intento de reorden de String*/
        
        String sql_search = "select * from centro_costo where codigo_centro_costo like '%"+texto+"%' or nombre_centro_costo like '%"+texto+"%' or fecha_compra_centro_costo like '%"+texto+"%' or totalGasto_centro_costo like '%"+texto+"%' or id_area like '%"+texto+"%'";
        
        PreparedStatement psB;
        try {
            psB = objConn.getConn().prepareStatement(sql_search);
            rs = psB.executeQuery();
        while (rs.next()) {            
            CentroCosto c = new CentroCosto();
            c.setCodigo_centro_costo(rs.getString("codigo_centro_costo"));
            c.setNombre_centro_costo(rs.getString("nombre_centro_costo"));
            if(rs.getDate("fecha_compra_centro_costo") != null)
            {
                c.setFecha_compra_centro_costo(rs.getDate("fecha_compra_centro_costo"));
            }
            if(rs.getString("totalGasto_centro_costo") != null)
            {
                c.setTotalGasto_centro_costo(Integer.parseInt(rs.getString("totalGasto_centro_costo")));
            }
            if(rs.getString("id_area") != null)
            {
                c.setCodigo_area(rs.getString("id_area"));
            }
            
            lista.add(c);
        }
        } catch (SQLException ex) {
            Logger.getLogger(AreaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    
    public CentroCosto buscarPorId(CentroCosto objCentroCosto){
    CentroCosto c = new CentroCosto();
    PreparedStatement psG;
        try {
            psG = objConn.getConn().prepareStatement(sql_selectArea);
            psG.setString(1, objCentroCosto.getCodigo_centro_costo());
            rs = psG.executeQuery();
            
            while (rs.next()) {                
                c.setCodigo_centro_costo(rs.getString("codigo_centro_costo"));
                c.setNombre_centro_costo(rs.getString("nombre_centro_costo"));
                if(rs.getDate("fecha_compra_centro_costo") != null)
                {
                    //ESTO FUE MODIFICADO V
                    c.setFecha_compra_centro_costo(rs.getDate("fecha_compra_centro_costo"));
                    //ESTO FUE MODIFICADO ^
                }
                if(rs.getString("totalGasto_centro_costo") != null)
                {
                    //ESTO FUE MODIFICADO V
                    c.setTotalGasto_centro_costo(Integer.parseInt(rs.getString("totalGasto_centro_costo")));
                    //ESTO FUE MODIFICADO ^
                }
                if(rs.getString("id_area") != null)
                {
                    //ESTO FUE MODIFICADO V
                    c.setCodigo_area(rs.getString("id_area"));
                    //ESTO FUE MODIFICADO ^                    
                }
            }
            return c;
        } catch (SQLException ex) {
            Logger.getLogger(AreaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    return null;
    }

    @Override
    public boolean insercionMasiva(String path) {
        
        try  
        {
            //Preparando la inserción SQL
            PreparedStatement statement = objConn.getConn().prepareStatement(sql_insercion_masiva);       
        
            //Creando una instancia de archivo 
            File file = new File(path);   
            //Obteniendo los bytes del archivo  
            FileInputStream fis = new FileInputStream(file);   
            //Creando el una instancia de Workbook que se refiere al archivo .xlsx                                             
            XSSFWorkbook wb = new XSSFWorkbook(fis);   
            //Creando un objeto hoja para sacar el objeto  
            XSSFSheet sheet = wb.getSheetAt(0);    
            //Iterando sobre un archivo excel
            Iterator<Row> itr = sheet.iterator();  
            
            //Buscamos dónde está cada dato que buscamos
            int id = -1;
            int nombre = -1;
            boolean buscando = true;
            //Iterando sobre cada fila
            while (itr.hasNext()&& buscando)                 
            { 
                //Obteniendo la fila
                Row row = itr.next(); 
                Iterator<Cell> cellIterator = row.cellIterator();
                //Iterando sobre cada columna
                while (cellIterator.hasNext())   
                {  
                    //Obteniendo la celda
                    Cell cell = cellIterator.next();
                    //Revisando el valor de la celda
                    if(cell.getStringCellValue().toUpperCase().equals("CECO"))
                    {
                        id = cell.getColumnIndex();
                    }
                    if(cell.getStringCellValue().toUpperCase().replace('Á', 'A').equals("AREA"))
                    {
                        nombre = cell.getColumnIndex();
                    }
                    
                }
                if(id != -1 && nombre != -1)
                {
                    buscando = false;
                }
            }
            
            if(buscando == true)
            {
                System.out.println("Buscando!");
                return false;
            }
            
            //Alistamos la información a ingresar
            
            while (itr.hasNext())                 
            {
                //Obteniendo la fila
                Row row = itr.next(); 
                Iterator<Cell> cellIterator = row.cellIterator();
                //Iterando sobre cada columna
                while (cellIterator.hasNext())   
                {  
                    //Obteniendo la celda
                    Cell cell = cellIterator.next();
                    
                    //Revisando a si la celda corresponde a una de las columnas que buscamos
                    if(cell.getColumnIndex() == id)
                    {
                        int valor = (int)Math.round(cell.getNumericCellValue());
                        statement.setInt(1, valor);
                    }
                    if(cell.getColumnIndex() == nombre)
                    {
                        String area = cell.getStringCellValue();
                        statement.setString(2, area);
                    }
                }
                
                //Añadiendo una linea al lote
                statement.addBatch();
            }
            
            wb.close();
            
            
            //Ejecutamos el lote de lineas SQL
            statement.executeBatch();
            return true;
        }
        catch(Exception e)  
        {  
            e.printStackTrace();   
            System.out.println(e.toString());
        }
        
        return false;
    }
    
}
