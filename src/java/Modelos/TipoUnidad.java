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
public class TipoUnidad {
    private int id_tipo_unidad;
    private String nombre_unidad;

    public TipoUnidad() {
    }

    public TipoUnidad(int id_tipo_unidad, String nombre_unidad) {
        this.id_tipo_unidad = id_tipo_unidad;
        this.nombre_unidad = nombre_unidad;
    }

    public int getId_tipo_unidad() {
        return id_tipo_unidad;
    }

    public void setId_tipo_unidad(int id_tipo_unidad) {
        this.id_tipo_unidad = id_tipo_unidad;
    }

    public String getNombre_unidad() {
        return nombre_unidad;
    }

    public void setNombre_unidad(String nombre_unidad) {
        this.nombre_unidad = nombre_unidad;
    }
    
    
}
