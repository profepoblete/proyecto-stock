/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

import java.util.Date;




/**
 *
 * @author José Pablo
 */
public class CentroCosto {
    private String codigo_centro_costo;
    private String nombre_centro_costo;
    private Date fecha_compra_centro_costo;
    private int totalGasto_centro_costo;
    private String codigo_area;

    public CentroCosto() {
    }

    public CentroCosto(String codigo_centro_costo, String nombre_centro_costo, Date fecha_compra_centro_costo, int totalGasto_centro_costo, String codigo_area) {
        this.codigo_centro_costo = codigo_centro_costo;
        this.nombre_centro_costo = nombre_centro_costo;
        this.fecha_compra_centro_costo = fecha_compra_centro_costo;
        this.totalGasto_centro_costo = totalGasto_centro_costo;
        this.codigo_area = codigo_area;
    }

    public String getCodigo_centro_costo() {
        return codigo_centro_costo;
    }

    public void setCodigo_centro_costo(String codigo_centro_costo) {
        this.codigo_centro_costo = codigo_centro_costo;
    }

    public String getNombre_centro_costo() {
        return nombre_centro_costo;
    }

    public void setNombre_centro_costo(String nombre_centro_costo) {
        this.nombre_centro_costo = nombre_centro_costo;
    }

    public Date getFecha_compra_centro_costo() {
        return fecha_compra_centro_costo;
    }

    public void setFecha_compra_centro_costo(Date fecha_compra_centro_costo) {
        this.fecha_compra_centro_costo = fecha_compra_centro_costo;
    }

    public int getTotalGasto_centro_costo() {
        return totalGasto_centro_costo;
    }

    public void setTotalGasto_centro_costo(int totalGasto_centro_costo) {
        this.totalGasto_centro_costo = totalGasto_centro_costo;
    }

    public String getCodigo_area() {
        return codigo_area;
    }

    public void setCodigo_area(String codigo_area) {
        this.codigo_area = codigo_area;
    }
    
    
}
