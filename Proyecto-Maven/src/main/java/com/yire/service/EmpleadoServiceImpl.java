/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yire.service;

import com.yire.SQLStatementBuilder;
import com.yire.dao.EmpleadoDao;
import com.yire.domain.Empleado;
import com.yire.domain.EmpleadoPuesto;
import com.yire.domain.Puesto;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author antho
 */
@Service
public class EmpleadoServiceImpl implements EmpleadoService {

    @Autowired
    private EmpleadoDao empleadoDao;

    @Autowired
    private EmpleadoPuestoService epService;

    @Autowired
    private PuestoService pService;

    @Override
    @Transactional(readOnly = true)
    public List<Empleado> getEmpleados() {
        List<Empleado> lista = new ArrayList<>();

        //SQL
        String sql = "select * from proyecto_adm.empleado";
        Connection con = SQLStatementBuilder.BuilderSQL();
        Statement stmt = SQLStatementBuilder.ListenerSQL(con);
        ResultSet rows = null;

        try {
            //Ejecutando query

            rows = stmt.executeQuery(sql);
            while (rows.next()) {
                Empleado temp = new Empleado(
                        Long.valueOf(rows.getString("id_empleado")),
                        rows.getString("nombre"),
                        rows.getString("apellido1"),
                        rows.getString("apellido2"),
                        rows.getString("alias"),
                        rows.getString("iban"),
                        Long.valueOf(rows.getString("salario")),
                        rows.getString("estado"),
                        rows.getString("password"));
                lista.add(temp);
            }
            for (Empleado temp : lista) {
                sql = "select * from proyecto_adm.empleadoPuesto where id_empleado = " + temp.getIdEmpleado();
                ResultSet puestoEmpleado = stmt.executeQuery(sql);
                Puesto idPuesto = new Puesto();
                if (puestoEmpleado.next()) {
                    idPuesto = pService.getPuesto(new Puesto(Long.parseLong(puestoEmpleado.getString("id_puesto"))));
                }
                Puesto puesto = new Puesto(idPuesto.getIdPuesto(), idPuesto.getNombre(), idPuesto.getSalariomin(), idPuesto.getSalariomax());
                temp.setPuesto(puesto);
            }
        } catch (Exception e) {
            System.err.println("Exception:" + e.getMessage());
        }
        System.out.println("==========================================================================================" + rows.toString());
        try {
            con.close();
        } catch (Exception e) {
        }
        return lista;
    }

    @Override
    public void save(Empleado empleado) {
        String sql;
        Connection con = SQLStatementBuilder.BuilderSQL();
        Statement stmt = SQLStatementBuilder.ListenerSQL(con);
        ResultSet rows = null;


        try {
            //Ejecutando query
            if (empleado.getIdEmpleado() == 0) {
                try {
                    CallableStatement storedProc = con.prepareCall("{call proyecto_adm.ingresar_empleado(?,?,?,?,?,?,?,?,?)}");
                    storedProc.setString(1, Long.toString(empleado.getIdEmpleado()));
                    storedProc.setString(2, empleado.getNombre());
                    storedProc.setString(3, empleado.getApellido1());
                    storedProc.setString(4, empleado.getApellido2());
                    storedProc.setString(5, empleado.getAlias());
                    storedProc.setString(6, empleado.getIban());
                    storedProc.setString(7, Long.toString(empleado.getSalario()));
                    storedProc.setString(8, empleado.getEstado());
                    storedProc.setString(9, empleado.getPassword());
                    storedProc.execute();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
//                sql = "execute proyecto_adm.ingresar_empleado("
//                        + +",'"
//                        + empleado.getNombre()+"', '"
//                        + empleado.getApellido1()+"', '"
//                        + empleado.getApellido2()+"', '"
//                        + empleado.getAlias()+"', '"
//                        + empleado.getIban()+"', "
//                        + empleado.getSalario()+", '"
//                        + empleado.getEstado()+"', '"
//                        + empleado.getPassword()+"');";
//                stmt.executeQuery(sql);
                return;
            }
            sql = "update proyecto_adm.empleado set "
                    + " nombre = '" + empleado.getNombre()
                    + "', apellido1 = '" + empleado.getApellido1()
                    + "', apellido2 = '" + empleado.getApellido2()
                    + "', alias = '" + empleado.getAlias()
                    + "', iban = '" + empleado.getIban()
                    + "', salario = " + empleado.getSalario()
                    + ", estado = '" + empleado.getEstado()
                    + "', password = '" + empleado.getPassword()
                    + "' where id_empleado = "
                    + empleado.getIdEmpleado();

            rows = stmt.executeQuery(sql);
        }catch(Exception e){
            System.err.println(e);
        }
//        try{
//            sql = "update proyecto_adm.empleadopuesto set id_puesto = " + empleado.getPuesto().getIdPuesto() + " where id_empleado = " + empleado.getIdEmpleado();
//            ResultSet puestoEmpleado = stmt.executeQuery(sql);
//
//        } catch (Exception e) {
//            System.err.println("Exception:" + e.getMessage());
//        }
//        System.out.println("==========================================================================================" + rows.toString());
        try {
            con.close();
        } catch (Exception e) {
        }
    }

    @Override
    public Empleado getEmpleado(Empleado empleado) {
        Empleado temp = new Empleado();

        //SQL
        String sql = "select * from proyecto_adm.empleado where id_empleado = "+empleado.getIdEmpleado();
        Connection con = SQLStatementBuilder.BuilderSQL();
        Statement stmt = SQLStatementBuilder.ListenerSQL(con);
        ResultSet rows = null;

        try {
            //Ejecutando query

            rows = stmt.executeQuery(sql);
            rows.next();
            temp = new Empleado(
                    Long.valueOf(rows.getString("id_empleado")),
                    rows.getString("nombre"),
                    rows.getString("apellido1"),
                    rows.getString("apellido2"),
                    rows.getString("alias"),
                    rows.getString("iban"),
                    Long.valueOf(rows.getString("salario")),
                    rows.getString("estado"),
                    rows.getString("password"));

            sql = "select * from proyecto_adm.empleadoPuesto where id_empleado = " + temp.getIdEmpleado();
            ResultSet puestoEmpleado = stmt.executeQuery(sql);
            Puesto puesto = new Puesto();
            puestoEmpleado.next();
            puesto = pService.getPuesto(new Puesto(Long.parseLong(puestoEmpleado.getString("id_puesto"))));
            temp.setPuesto(puesto);
            //temp.setPuestos(pService.getPuestos());
        } catch (Exception e) {
            System.err.println("Exception:" + e.getMessage());
        }
        System.out.println("==========================================================================================" + rows.toString());
        try {
            con.close();
        } catch (Exception e) {
            System.err.println(e);
        }
        return temp;
    }

    @Override
    public void delete(Empleado empleado) {
        epService.delete(empleado);
        empleadoDao.delete(empleado);
    }
}
