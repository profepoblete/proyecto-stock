/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interfaces;
import Modelos.ProductoEsp;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author Sebastián Barría
 */
public interface CRUDProductoEsp {
    public boolean AgregarProductoEsp(ProductoEsp ObjProductoEsp);
    public boolean EditarProductoEsp(ProductoEsp ObjProductoEsp);
    public ProductoEsp EliminarProductoEsp(ProductoEsp ObjProductoEsp);
    public ArrayList<ProductoEsp> ListarProductoEsp();
    public List BuscarProductoEsp(String textoEsp);
    public boolean CheckAlerta();
    public ArrayList<ProductoEsp> ProductosDepre();
}
