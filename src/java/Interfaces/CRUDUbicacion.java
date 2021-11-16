/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interfaces;

import Modelos.Ubicacion;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Felipe
 */
public interface CRUDUbicacion {
    public boolean agregarUbicacion(Ubicacion objUbicacion);
    public boolean editarUbicacion(Ubicacion objUbicacion);
    public Ubicacion eliminarUbicacion(Ubicacion objUbicacion);
    public ArrayList<Ubicacion> listarUbicacion();
    public List buscar(String texto);
}
