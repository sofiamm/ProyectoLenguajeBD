/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package proyectolenguajesdb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;

public class ProyectoLenguajesDB {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
                    String url = "jdbc:oracle:thin:@10.0.0.4:1521:orcl";
            String user = "Proyecto_Adm";
            String pass = "Password1";
            int empId;
            Connection conn;

            try {
                Connection connection = DriverManager.getConnection(url, user, pass);
                System.out.println("Conexión exitosa");
                String sql = "SELECT idactivo FROM Proyecto_adm.activos WHERE descripcion = 'test'";
                Statement stmt = conn.createStatement(sql);

                ResultSet resultSet = Statement.executeQuery();
                while (resultSet.next()) {
                    int idActivo = resultSet.getInt("idactivo");
                    System.out.println("ID del activo: " + idActivo);
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }
    }
    
}
