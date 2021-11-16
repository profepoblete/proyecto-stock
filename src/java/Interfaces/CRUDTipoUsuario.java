/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interfaces;

import Modelos.TipoUsuario;
import java.util.ArrayList;

/**
 *
 * @author Diego
 */
public interface CRUDTipoUsuario {
    public boolean agregarTipoUsuario(TipoUsuario objTipoUsuario);
    public boolean editarTipoUsuario(TipoUsuario objTipoUsuario);
    public TipoUsuario eliminarTipoUsuario(TipoUsuario objTipoUsuario);
    public ArrayList<TipoUsuario> listarTipoUsuario();
    
}
