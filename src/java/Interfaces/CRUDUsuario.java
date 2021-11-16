/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interfaces;

import Modelos.Usuario;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Felipe
 */
public interface CRUDUsuario {

    public boolean agregarUsuario(Usuario objUsuario);

    public boolean editarUsuario(Usuario objUsuario);

    public Usuario eliminarUsuario(Usuario objUsuario);

    public ArrayList<Usuario> listarUsuario();

    public List buscar(String texto);

    public List<String> correo();
}
