/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package WebService;

import Conexion.Usuario;
import java.sql.SQLException;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

/**
 *
 * @author user
 */
@WebService(serviceName = "ServicioUsuario")
public class ServicioUsuario {


    @WebMethod(operationName = "AgregarUsuario")
    public boolean AgregarUsuario(@WebParam(name = "id_Usuario") String id,@WebParam(name = "Nombre") String Nombre,
    @WebParam(name = "Usuario") String Nom_Usuario,@WebParam(name = "password") String password,
    @WebParam(name = "FechaNac") String Fecha_Nac) throws ClassNotFoundException {
        Usuario u = new Usuario();
        try{
            return u.agregarUsuario(id, Nombre, Nom_Usuario, Fecha_Nac, password);
        }catch (SQLException ex) {
            return false;
        }
    }
}
