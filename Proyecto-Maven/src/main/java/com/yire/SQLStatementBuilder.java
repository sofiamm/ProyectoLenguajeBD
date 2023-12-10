package com.yire;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class SQLStatementBuilder {
    public static Connection BuilderSQL(){
        Connection con=null;
        try //try connection to database
        {
            //load driver
            Class.forName("oracle.jdbc.OracleDriver");
            System.out.println("Oracle JDBC driver loaded ok.");
            con=DriverManager.getConnection("jdbc:oracle:thin:PROYECTO_ADM/Password1@localhost:1521:orcl");
            System.out.println("Connect with @oracle:1521:orcl");
            //declaring statement
            
        }catch (Exception e){
            System.err.println("Exception:"+e.getMessage());
        }
        return con;
    }
    
    public static Statement ListenerSQL(Connection con){
        Statement stmt = null;
        try //try connection to database
        {
            stmt = con.createStatement();
        }catch (Exception e){
            System.err.println("Exception:"+e.getMessage());
        }
        return stmt;
    }
}
