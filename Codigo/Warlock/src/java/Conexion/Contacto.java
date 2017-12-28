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
public class Contacto {
     public boolean agregarContacto(String id_Contacto, String id_Usuario, String Estado) throws SQLException, ClassNotFoundException {
        Connection dbConnection = null;
        //ES PARA DECLARAR SENTENCIAS SQL
        PreparedStatement preparedStatement = null;
        //SQL -- 
        String insertTableSQL = "INSERT INTO CONTACTO(id_Contacto,id_Usuario,Estado)"
                + "VALUES(?,?,?)";
        try{
            dbConnection = new ConexionBD().getConnection();
            preparedStatement = dbConnection.prepareStatement(insertTableSQL);
            /* ? */preparedStatement.setString(1, id_Contacto);
            /* ? */preparedStatement.setString(2, id_Usuario);
            /* ? */preparedStatement.setString(3, Estado);                     
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
     public void getContacto(int id_Usuario){
        Connection dbConnection = null;
        PreparedStatement preparedStatement = null;
        ArrayList a[] = new ArrayList[300];

        String selectSQL = "SELECT * FROM contacto WHERE id_Usuario=?";
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
