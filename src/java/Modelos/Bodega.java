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
public class Bodega {
    String codigo_bodega;
    int volumen_bodega;
    String ubicacion_bodega;
    String codigo_centro_costo;

    public Bodega() {
    }

    public Bodega(String codigo_bodega, int volumen_bodega, String ubicacion_bodega, String codigo_centro_costo) {
        this.codigo_bodega = codigo_bodega;
        this.volumen_bodega = volumen_bodega;
        this.ubicacion_bodega = ubicacion_bodega;
        this.codigo_centro_costo = codigo_centro_costo;
    }

    public String getCodigo_bodega() {
        return codigo_bodega;
    }

    public void setCodigo_bodega(String codigo_bodega) {
        this.codigo_bodega = codigo_bodega;
    }

    public int getVolumen_bodega() {
        return volumen_bodega;
    }

    public void setVolumen_bodega(int volumen_bodega) {
        this.volumen_bodega = volumen_bodega;
    }

    public String getUbicacion_bodega() {
        return ubicacion_bodega;
    }

    public void setUbicacion_bodega(String ubicacion_bodega) {
        this.ubicacion_bodega = ubicacion_bodega;
    }

    public String getCodigo_centro_costo() {
        return codigo_centro_costo;
    }

    public void setCodigo_centro_costo(String codigo_centro_costo) {
        this.codigo_centro_costo = codigo_centro_costo;
    }
    
    
}
