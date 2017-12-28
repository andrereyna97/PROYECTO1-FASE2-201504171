/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package WebService;

import Conexion.Contacto;
import Conexion.Usuario;
import java.sql.SQLException;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

/**
 *
 * @author user
 */
@WebService(serviceName = "ServicioContacto")
public class ServicioContacto {

    /**
     * This is a sample web service operation
     */
       @WebMethod(operationName = "AgregarContacto")
    public boolean AgregarContacto(@WebParam(name = "id_Contacto") String id_C,
    @WebParam(name = "id_Usuario") String id_U,@WebParam(name = "Estado") String estado) throws ClassNotFoundException {
           Contacto c = new Contacto();
        try{
            return c.agregarContacto(id_C, id_U, estado);
        }catch (SQLException ex) {
            return false;
        }
    }
}
