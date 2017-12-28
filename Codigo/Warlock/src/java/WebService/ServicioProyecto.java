/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package WebService;

import Conexion.Proyecto;
import Conexion.Usuario;
import java.sql.SQLException;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

/**
 *
 * @author user
 */
@WebService(serviceName = "ServicioProyecto")
public class ServicioProyecto {

    /**
     * This is a sample web service operation
     */
      @WebMethod(operationName = "AgregarProyecto")
    public boolean AgregarProyecto(@WebParam(name = "id_Proyecto") String id,@WebParam(name = "Nombre") String Nombre,
    @WebParam(name = "Fecha Inicio") String fecha_in,@WebParam(name = "Fecha fin") String fecha_fin,
    @WebParam(name = "Descripcion") String Descripcion,@WebParam(name = "Pago") String Pago) throws ClassNotFoundException {
        Proyecto p = new Proyecto();
        try{
            return p.agregarProyecto(id, Nombre, fecha_in, fecha_fin, Descripcion, Pago);
        }catch (SQLException ex) {
            return false;
        }
    }
}
