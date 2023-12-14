package com.yire.service;

import com.yire.SQLStatementBuilder;
import com.yire.dao.EmpleadoPuestoDao;
import com.yire.domain.Empleado;
import com.yire.domain.EmpleadoPuesto;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmpleadoPuestoServiceImpl implements EmpleadoPuestoService {

    @Autowired
    private EmpleadoPuestoDao empleadoPuestoDao;

    @Override
    public EmpleadoPuesto getPuestoByIdEmpleado(long idEmpleado) {
        EmpleadoPuesto ep = empleadoPuestoDao.findByIdEmpleado(idEmpleado);
        return ep;
    }

    @Override
    public void guardar(long idEmpleado, long idPuesto) {
        Connection con = SQLStatementBuilder.BuilderSQL();
        Statement stmt = SQLStatementBuilder.ListenerSQL(con);
        ResultSet rows = null;
        try {
            String sql = "select * from proyecto_adm.empleadopuesto where id_empleado=" + idEmpleado;
            //Ejecutando query
            rows = stmt.executeQuery(sql);
            rows.next();
            long l=0;
            try {
                l = Long.valueOf(rows.getString("id_empleado"));

            } catch (Exception e) {
                System.err.println(e);
            }
            if (l == 0) {
                sql = "insert into proyecto_adm.empleadopuesto (id_empleado,id_puesto) values (" + idEmpleado + "," + idPuesto + ")";
                stmt.executeQuery(sql);
                return;
            }
            sql = "update proyecto_adm.empleadopuesto set "
                    + " id_empleado = '" + idEmpleado
                    + "', id_Puesto = '" + idPuesto
                    + "' where id_empleado = "
                    + idEmpleado;
            stmt.executeQuery(sql);
        } catch (Exception e) {
            System.err.println(e);
        }
        System.out.println("==========================================================================================" + rows.toString());
        try {
            con.close();
        } catch (Exception e) {
        }
    }

    @Override
    public void delete(Empleado empleado){
        empleadoPuestoDao.delete(empleadoPuestoDao.findByIdEmpleado(empleado.getIdEmpleado()));
    }
}
