/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yire.service;

import com.yire.SQLStatementBuilder;
import com.yire.dao.CantonDao;
import com.yire.domain.Canton;
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
    @Transactional(readOnly = true)
    public List<Canton> getCantones() {
        var lista = (List<Canton>) cantonDao.findAll();
        List<Canton> listaFinal = new ArrayList<>();
        for (Canton canton : lista) {
            if (canton instanceof Canton) {
                listaFinal.add(canton);
            }
        }
        return listaFinal;
    }

    @Override
    public List<List<Canton>> getCantones2() {

        List<List<Canton>> lista = new ArrayList<>();
        List<Canton> san = new ArrayList<>();
        List<Canton> ala = new ArrayList<>();
        List<Canton> car = new ArrayList<>();
        List<Canton> her = new ArrayList<>();
        List<Canton> gua = new ArrayList<>();
        List<Canton> pun = new ArrayList<>();
        List<Canton> lim = new ArrayList<>();
        
//        for (long i = 1; i <= 7; i = i + 1) {
//        List<Canton> resultados;
//            System.out.println("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++" + resultados);
//            for (Canton resultado : resultados) {
//                resultado.setIdProvincia(i);
        String sql = "select * from proyecto_adm.canton";
//                        + " where id_Provincia="+i+" and id_canton="+resultado.getIdCanton();
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
                switch (String.valueOf(temp.getIdProvincia())) {
                    case "1":
                        san.add(temp);
                        break;
                    case "2":
                        ala.add(temp);
                        break;
                    case "3":
                        car.add(temp);
                        break;
                    case "4":
                        her.add(temp);
                        break;
                    case "5":
                        gua.add(temp);
                        break;
                    case "6":
                        pun.add(temp);
                        break;
                    case "7":
                        lim.add(temp);
                        break;
                }
            }
        } catch (Exception e) {
            System.err.println("Exception:" + e.getMessage());
        }
        lista.add(san);
        lista.add(ala);
        lista.add(car);
        lista.add(her);
        lista.add(gua);
        lista.add(pun);
        lista.add(lim);

//                resultado=jdbcTemplate.query(s ql, BeanPropertyRowMapper.newInstance(Canton.class));
        System.out.println("==========================================================================================" + rows.toString());
        //resultado=cantonDao.findByIdProvinciaAndIdCanton(i,resultado.getIdCanton());

        //System.out.println("==========================================================================================" + resultado);
//                lista.add(resultado);
//            }
//        }
        return lista;
    }
}
