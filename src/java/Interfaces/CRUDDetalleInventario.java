/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interfaces;
import Modelos.DetalleInventario;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author Tapir
 */
public interface CRUDDetalleInventario {
    public boolean agregarDetalleInventario(DetalleInventario objDetalleInventario);
    public boolean  editarDetalleInventario(DetalleInventario objDetalleInventario);
    public DetalleInventario eliminarDetalleInventario(DetalleInventario objDetalleInventario);
    public ArrayList<DetalleInventario> listaDetalleInventario();
    public List buscar (String texto);
}
