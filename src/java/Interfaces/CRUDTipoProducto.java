/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interfaces;

import Modelos.TipoProducto;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Felipe
 */
public interface CRUDTipoProducto {
    public boolean agregarTipoProducto(TipoProducto objTipoProducto);
    public boolean editarTipoProducto(TipoProducto objTipoProducto);
    public TipoProducto eliminarTipoProducto(TipoProducto objTipoProducto);
    public ArrayList<TipoProducto> listarTipoProducto();
    public List buscar(String texto);
}
  