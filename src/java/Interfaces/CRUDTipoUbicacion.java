/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interfaces;

import Modelos.TipoUbicacion;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author José Pablo
 */
public interface CRUDTipoUbicacion {
    public boolean agregarTipoUbicaion(TipoUbicacion objTipoUbicacion);
    public boolean editarTipoUbicacion(TipoUbicacion objTipoUbicacion);
    public TipoUbicacion eliminarTipoUbicacion(TipoUbicacion objTipoUbicacion);
    public ArrayList<TipoUbicacion> listaTipoUbicacion();
    public List buscar (String texto);
}
