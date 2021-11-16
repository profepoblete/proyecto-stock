/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interfaces;

import Modelos.Sede;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author José Pablo
 */
public interface CRUDSede {
    public boolean aregarSede(Sede objSede);
    public boolean editarSede(Sede objSede);
    public Sede eliminarSede(Sede objSede);
    public ArrayList<Sede> listSede();
    public List buscar (String texto);
}
