package com.yire.service;

import com.yire.SQLStatementBuilder;
import com.yire.domain.Canton;
import com.yire.domain.Distrito;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

@Service
public class DistritoServiceImpl implements DistritoService{
    
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<Distrito> getDistritos (){
        List<Distrito> lista = new ArrayList<>();
        
        //SQL
        String sql = "select * from proyecto_adm.distrito";
        Connection con = SQLStatementBuilder.BuilderSQL();
        Statement stmt = SQLStatementBuilder.ListenerSQL(con);
        ResultSet rows = null;
        
        try {
            //Ejecutando query
            rows = stmt.executeQuery(sql);
            while (rows.next()) {
                Distrito temp = new Distrito(
                        Long.valueOf(rows.getString("id_provincia")),
                        Long.valueOf(rows.getString("id_canton")),
                        Long.valueOf(rows.getString("id_distrito")),
                        rows.getString("nombre"));
                lista.add(temp);
            }
        } catch (Exception e) {
            System.err.println("Exception:" + e.getMessage());
        }
        System.out.println("==========================================================================================" + rows.toString());
        try{con.close();}catch (Exception e){}
        return lista;
    }
    
    public List<Distrito> getDistritosByCanton(Canton canton){
        List<Distrito> lista = new ArrayList<>();
        String sql = "select * from proyecto_adm.distrito where id_provincia = " + canton.getIdProvincia()+" and id_canton = "+canton.getIdCanton();
        Connection con = SQLStatementBuilder.BuilderSQL();
        Statement stmt = SQLStatementBuilder.ListenerSQL(con);
        ResultSet rows = null;
        try {
            rows = stmt.executeQuery(sql);
            while (rows.next()) {
                Distrito temp = new Distrito(
                        Long.valueOf(rows.getString("id_provincia")),
                        Long.valueOf(rows.getString("id_canton")),
                        Long.valueOf(rows.getString("id_distrito")),
                        rows.getString("nombre"));
                lista.add(temp);
            }
        } catch (Exception e) {
            System.err.println("Exception:" + e.getMessage());
        }
        System.out.println("==========================================================================================" + rows.toString());
        try{con.close();}catch (Exception e){}
        return lista;
    }
    
    @Override
    public Distrito getDistrito(Distrito distrito, long id_canton,long id_provincia){
        String sql = "select * from proyecto_adm.distrito where id_provincia= "
                +id_provincia+" and id_canton = "
                +id_canton+" and id_distrito = "
                +distrito.getIdDistrito();
        Connection con = SQLStatementBuilder.BuilderSQL();
        Statement stmt = SQLStatementBuilder.ListenerSQL(con);
        ResultSet rows = null;
        Distrito temp=new Distrito();
        try {
            //Ejecutando query
            rows = stmt.executeQuery(sql);
            while (rows.next()) {
                temp = new Distrito(
                        Long.valueOf(rows.getString("id_provincia")),
                        Long.valueOf(rows.getString("id_canton")),
                        Long.valueOf(rows.getString("id_distrito")),
                        rows.getString("nombre"));
            }
        } catch (Exception e) {
            System.err.println("Exception:" + e.getMessage());
        }
        System.out.println("==========================================================================================" + rows.toString());
        try{con.close();}catch (Exception e){}
        return temp;
    }
}
