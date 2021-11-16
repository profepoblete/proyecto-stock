/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

/**
 *
 * @author José Pablo
 */
public class Area {
    
    private int id_area;
    private String codigo_area;
    private String nombre_area;
    private String codigo_sede;

    public Area() {
    }

    public Area(int id_area , String codigo_area, String nombre_area, String codigo_sede) {
        this.id_area = id_area;
        this.codigo_area = codigo_area;
        this.nombre_area = nombre_area;
        this.codigo_sede = codigo_sede;
    }

    public int getId_area() {
        return id_area;
    }

    public void setId_area(int id_area) {
        this.id_area = id_area;
    }  
    
    public String getCodigo_area() {
        return codigo_area;
    }

    public void setCodigo_area(String codigo_area) {
        this.codigo_area = codigo_area;
    }

    public String getNombre_area() {
        return nombre_area;
    }

    public void setNombre_area(String nombre_area) {
        this.nombre_area = nombre_area;
    }

    public String getCodigo_sede() {
        return codigo_sede;
    }

    public void setCodigo_sede(String codigo_sede) {
        this.codigo_sede = codigo_sede;
    }

    

   
}
