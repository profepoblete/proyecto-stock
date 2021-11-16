/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

/**
 *
 * @author Felipe
 */
public class Ubicacion {

    private int id_ubicacion;
    private String codigo_ubicacion;
    private String nombre_ubicacion;
    private String descripcion_ubicacion;
    private String codigo_area;
    private int estado_ubicacion;

    public Ubicacion() {
    }

    public Ubicacion(int id_ubicacion, String codigo_ubicacion, String nombre_ubicacion, String descripcion_ubicacion, String codigo_area, int estado_ubicacion) {
        this.id_ubicacion = id_ubicacion;
        this.codigo_ubicacion = codigo_ubicacion;
        this.nombre_ubicacion = nombre_ubicacion;
        this.descripcion_ubicacion = descripcion_ubicacion;
        this.codigo_area = codigo_area;
        this.estado_ubicacion = estado_ubicacion;
    }

    public int getId_ubicacion() {
        return id_ubicacion;
    }

    public void setId_ubicacion(int id_ubicacion) {
        this.id_ubicacion = id_ubicacion;
    }

    public String getCodigo_ubicacion() {
        return codigo_ubicacion;
    }

    public void setCodigo_ubicacion(String codigo_ubicacion) {
        this.codigo_ubicacion = codigo_ubicacion;
    }

    public String getNombre_ubicacion() {
        return nombre_ubicacion;
    }

    public void setNombre_ubicacion(String nombre_ubicacion) {
        this.nombre_ubicacion = nombre_ubicacion;
    }

    public String getDescripcion_ubicacion() {
        return descripcion_ubicacion;
    }

    public void setDescripcion_ubicacion(String descripcion_ubicacion) {
        this.descripcion_ubicacion = descripcion_ubicacion;
    }

    public String getCodigo_area() {
        return codigo_area;
    }

    public void setCodigo_area(String codigo_area) {
        this.codigo_area = codigo_area;
    }

    public int getEstado_ubicacion() {
        return estado_ubicacion;
    }

    public void setEstado_ubicacion(int estado_ubicacion) {
        this.estado_ubicacion = estado_ubicacion;
    }

}
