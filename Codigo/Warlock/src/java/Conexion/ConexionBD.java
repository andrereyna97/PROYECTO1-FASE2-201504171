/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author user
 */
public class ConexionBD {
    private Connection conexion;
    private Statement sentencia;
    //Datos para la conexion a BD
    private final String servidor ="localhost";
    private final String puerto ="3306";
    private final String BD ="warlock soft";
    private final String usuario ="root";
    private final String password ="mierdas.l.";
    private final String URL ="jdbc:mariadb://"+servidor+":"+puerto+"/"+BD;

    //Metodo para crar la comunicacion, return true cuando se crea correctamente
    public ConexionBD() throws ClassNotFoundException{
     //   boolean estado = false;
        try{
        Class.forName("org.mariadb.jdbc.Driver");
        conexion = DriverManager.getConnection(URL,usuario,password);
        //estado=true;
        }catch(SQLException e){
            System.out.println(e.getMessage());
            System.out.println("Error al intentar la conexion con la BD");
        }
    }
    //Metodo para desconectar correctamente la DB
    public void desconectar(){
        try{
            if (conexion!=null) {
                conexion.close();
                conexion=null;
            }
        }catch(SQLException sqle){
            System.out.println(sqle.getMessage());
        }
    }
    //Retorna la conexion actual 
    public Connection getConnection(){
        return conexion;
    }
}
