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
public class Producto {

    private int id_producto;
    private String nombre_producto;
    private String descripcion_producto;   
    private int valor_producto;
    private String marca_producto;  
    private int stock_minimo;
    private int id_proveedor;
    private int tipo_producto;
    private int id_subtipo_producto;
    private int id_tipo_unidad;

    public Producto(int id_producto, String nombre_producto, String descripcion_producto, int valor_producto, String marca_producto, int stock_minimo, int id_proveedor, int tipo_producto , int id_subtipo_producto, int id_tipo_unidad) {
        this.id_producto = id_producto;
        this.nombre_producto = nombre_producto;
        this.descripcion_producto = descripcion_producto;       
        this.valor_producto = valor_producto;
        this.marca_producto = marca_producto;        
        this.stock_minimo = stock_minimo;
        this.id_proveedor = id_proveedor;
        this.tipo_producto = tipo_producto;
        this.id_subtipo_producto = id_subtipo_producto;
        this.id_tipo_unidad = id_tipo_unidad;
    }

    public Producto() {
       
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public String getNombre_producto() {
        return nombre_producto;
    }

    public void setNombre_producto(String nombre_producto) {
        this.nombre_producto = nombre_producto;
    }

    public String getDescripcion_producto() {
        return descripcion_producto;
    }

    public void setDescripcion_producto(String descripcion_producto) {
        this.descripcion_producto = descripcion_producto;
    }

    public int getValor_producto() {
        return valor_producto;
    }

    public void setValor_producto(int valor_producto) {
        this.valor_producto = valor_producto;
    }

    public String getMarca_producto() {
        return marca_producto;
    }

    public void setMarca_producto(String marca_producto) {
        this.marca_producto = marca_producto;
    }

    public int getStock_minimo() {
        return stock_minimo;
    }

    public void setStock_minimo(int stock_minimo) {
        this.stock_minimo = stock_minimo;
    }

    public int getId_proveedor() {
        return id_proveedor;
    }

    public void setId_proveedor(int id_proveedor) {
        this.id_proveedor = id_proveedor;
    }

    public int getTipo_producto() {
        return tipo_producto;
    }

    public void setTipo_producto(int tipo_producto) {
        this.tipo_producto = tipo_producto;
    }

  

    public int getId_subtipo_producto() {
        return id_subtipo_producto;
    }

    public void setId_subtipo_producto(int id_subtipo_producto) {
        this.id_subtipo_producto = id_subtipo_producto;
    }

    public int getId_tipo_unidad() {
        return id_tipo_unidad;
    }

    public void setId_tipo_unidad(int id_tipo_unidad) {
        this.id_tipo_unidad = id_tipo_unidad;
    }

   
    
    
}
