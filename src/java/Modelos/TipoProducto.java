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
public class TipoProducto {
     private int id_tipo_producto;
     private String categoria_tipo_producto;

    public TipoProducto() {
    }

    public TipoProducto(int id_tipo_producto, String categoria_tipo_producto) {
        this.id_tipo_producto = id_tipo_producto;
        this.categoria_tipo_producto = categoria_tipo_producto;
    }

    public int getId_tipo_producto() {
        return id_tipo_producto;
    }

    public void setId_tipo_producto(int id_tipo_producto) {
        this.id_tipo_producto = id_tipo_producto;
    }

    public String getCategoria_tipo_producto() {
        return categoria_tipo_producto;
    }

    public void setCategoria_tipo_producto(String categoria_tipo_producto) {
        this.categoria_tipo_producto = categoria_tipo_producto;
    }
     
     
}
