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
public class TipoUbicacion {
    private int id_tipo_ubicacion;
    private String nombre_tipo_ubicacion;

    public TipoUbicacion() {
    }

    public TipoUbicacion(int id_tipo_ubicacion, String nombre_tipo_ubicacion) {
        this.id_tipo_ubicacion = id_tipo_ubicacion;
        this.nombre_tipo_ubicacion = nombre_tipo_ubicacion;
    }

    public int getId_tipo_ubicacion() {
        return id_tipo_ubicacion;
    }

    public void setId_tipo_ubicacion(int id_tipo_ubicacion) {
        this.id_tipo_ubicacion = id_tipo_ubicacion;
    }

    public String getNombre_tipo_ubicacion() {
        return nombre_tipo_ubicacion;
    }

    public void setNombre_tipo_ubicacion(String nombre_tipo_ubicacion) {
        this.nombre_tipo_ubicacion = nombre_tipo_ubicacion;
    }
    
    
}
