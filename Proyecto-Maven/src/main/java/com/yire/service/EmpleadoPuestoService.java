/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.yire.service;

import com.yire.domain.Empleado;
import com.yire.domain.EmpleadoPuesto;

/**
 *
 * @author antho
 */
public interface EmpleadoPuestoService {
    public EmpleadoPuesto getPuestoByIdEmpleado(long idEmpleado);
    public void guardar(long idEmpleado, long idPuesto);
    public void delete(Empleado empleado);
}
