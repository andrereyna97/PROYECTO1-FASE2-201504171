/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author user
 */
public class Usuario {
     public boolean agregarUsuario(String id_usuario, String nombre, String nom_usuario,String Fecha_Nac,String password) throws SQLException, ClassNotFoundException {
        Connection dbConnection = null;
        //ES PARA DECLARAR SENTENCIAS SQL
        PreparedStatement preparedStatement = null;
        //SQL -- 
        String insertTableSQL = "INSERT INTO USUARIO(id_Usuario,Nombre, Nom_Usuario,password,Fecha_Nac)"
                + "VALUES(?,?,?,?)";
        try{
            dbConnection = new ConexionBD().getConnection();
            preparedStatement = dbConnection.prepareStatement(insertTableSQL);
            /* ? */preparedStatement.setString(1, id_usuario);
            /* ? */preparedStatement.setString(2, nombre);
            /* ? */preparedStatement.setString(3, nom_usuario);           
            /* ? */preparedStatement.setString(4, password);          

            /* ? */preparedStatement.setString(5, Fecha_Nac);          
            
            // execute insert SQL stetement
            preparedStatement.executeUpdate();
            dbConnection.close();
            return true;
        }catch (SQLException e) {

            System.out.println(e.getMessage());
            return false;

        }finally {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (dbConnection != null) {
                dbConnection.close();
            }
        }
    }
     public void getUsuario(int id_Usuario){
        Connection dbConnection = null;
        PreparedStatement preparedStatement = null;
        ArrayList a[] = new ArrayList[300];

        String selectSQL = "SELECT id_Usuario,Nombre,Nom_Usuario FROM usuario WHERE id_Usuario=?";
        try {
            dbConnection = new ConexionBD().getConnection();

            preparedStatement = dbConnection.prepareStatement(selectSQL);
            preparedStatement.setInt(1, id_Usuario);

            ResultSet rs;
            rs = preparedStatement.executeQuery();
            rs.close();
        } catch (SQLException se) {
            se.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
            } catch (SQLException se) {
            }// NADA NO HACE NADA
            try {
                if (dbConnection != null) {
                    dbConnection.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }//FIN DEL TRY
    }
}

}