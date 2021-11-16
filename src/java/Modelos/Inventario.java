/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;
import java.sql.Date;
/**
 *
 * @author Tapir
 */
public class Inventario {
    
    private int id_inventario;
    private Date fecha_inventario;
    private String descripcion_inventario;
    private int id_area;

    public Inventario() {
    }

    public Inventario(int id_inventario, Date fecha_inventario, String descripcion_inventario, int id_area) {
        this.id_inventario = id_inventario;
        this.fecha_inventario = fecha_inventario;
        this.descripcion_inventario = descripcion_inventario;
        this.id_area = id_area;
    }

    public int getId_inventario() {
        return id_inventario;
    }

    public void setId_inventario(int id_inventario) {
        this.id_inventario = id_inventario;
    }

    public Date getFecha_inventario() {
        return fecha_inventario;
    }

    public void setFecha_inventario(Date fecha_inventario) {
        this.fecha_inventario = fecha_inventario;
    }

    public String getDescripcion_inventario() {
        return descripcion_inventario;
    }

    public void setDescripcion_inventario(String descripcion_inventario) {
        this.descripcion_inventario = descripcion_inventario;
    }

    public int getId_area() {
        return id_area;
    }

    public void setId_area(int id_area) {
        this.id_area = id_area;
    }
}

