/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yire.service;

import com.yire.SQLStatementBuilder;
import com.yire.dao.CantonDao;
import com.yire.domain.Canton;
import com.yire.domain.Provincia;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.sql.*;

@Service
public class CantonServiceImpl implements CantonService {

    @Autowired
    CantonDao cantonDao;
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
//    @Transactional(readOnly = true)
    public List<Canton> getCantones() {
        List<Canton> lista = new ArrayList<>();
        
        //SQL
        String sql = "select * from proyecto_adm.canton";
        Connection con = SQLStatementBuilder.BuilderSQL();
        Statement stmt = SQLStatementBuilder.ListenerSQL(con);
        ResultSet rows = null;
        
        try {
            //Ejecutando query
            rows = stmt.executeQuery(sql);
            while (rows.next()) {
                Canton temp = new Canton(
                        Long.valueOf(rows.getString("id_provincia")),
                        Long.valueOf(rows.getString("id_canton")),
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
    public Canton getCanton(Canton canton,long id_provincia){
        String sql = "select * from proyecto_adm.canton where id_provincia= "+id_provincia+" and id_canton = "+canton.getIdCanton();
        Connection con = SQLStatementBuilder.BuilderSQL();
        Statement stmt = SQLStatementBuilder.ListenerSQL(con);
        ResultSet rows = null;
        Canton temp=new Canton();
        try {
            //Ejecutando query
            rows = stmt.executeQuery(sql);
            while (rows.next()) {
                temp = new Canton(
                        Long.valueOf(rows.getString("id_provincia")),
                        Long.valueOf(rows.getString("id_canton")),
                        rows.getString("nombre"));
                
            }
        } catch (Exception e) {
            System.err.println("Exception:" + e.getMessage());
        }
        System.out.println("==========================================================================================" + rows.toString());
        try{con.close();}catch (Exception e){}
        return temp;
    }
    
    @Override
    public List<Canton> getCantonesByProvincia(Provincia provincia) {
        List<Canton> lista = new ArrayList<>();
        String sql = "select * from proyecto_adm.canton where id_provincia = " + provincia.getIdProvincia();
        Connection con = SQLStatementBuilder.BuilderSQL();
        Statement stmt = SQLStatementBuilder.ListenerSQL(con);
        ResultSet rows = null;
        try {
            rows = stmt.executeQuery(sql);
            while (rows.next()) {
                Canton temp = new Canton(
                        Long.valueOf(rows.getString("id_provincia")),
                        Long.valueOf(rows.getString("id_canton")),
                        rows.getString("nombre"));
                lista.add(temp);
            }
        } catch (Exception e) {
            System.err.println("Exception:" + e.getMessage());
        }
        System.out.println("==========================================================================================" + rows.toString());
        return lista;
    }
}
