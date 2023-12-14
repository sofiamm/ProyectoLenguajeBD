/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yire.service;

import com.yire.SQLStatementBuilder;
import com.yire.domain.Empleado;
import com.yire.domain.EmpleadoCorreo;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import oracle.jdbc.OracleTypes;
import org.springframework.stereotype.Service;

@Service
public class EmpleadoCorreoServiceImpl implements EmpleadoCorreoService{
    
    public List<EmpleadoCorreo> getCorreosByEmpleado(Empleado empleado){
        String sql = "select proyecto_adm.correo_nombre("+(int) empleado.getIdEmpleado()+") from dual";
        Connection con = SQLStatementBuilder.BuilderSQL();
        Statement stmt = SQLStatementBuilder.ListenerSQL(con);
        ResultSet rows = null;
        List<EmpleadoCorreo> resultado= null;
        try {
//            CallableStatement callableStatement = con.prepareCall("{? = call proyecto_adm.correo_nombre(?)}");
//            callableStatement.registerOutParameter(1, OracleTypes.CURSOR);
//            callableStatement.setInt(2, (int) empleado.getIdEmpleado());
//            callableStatement.execute();
//
//            ResultSet resultSet = (ResultSet) callableStatement.getObject(1);
                rows = stmt.executeQuery(sql);
//            while (resultSet.next()) {
//                EmpleadoCorreo empleadoCorreo = new EmpleadoCorreo(empleado.getIdEmpleado(),resultSet.getString("Correo"));
//                resultado.add(empleadoCorreo);
//            }

//            resultSet.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultado;
    }
}
