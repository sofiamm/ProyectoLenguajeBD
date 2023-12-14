/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.yire.service;

import com.yire.domain.Empleado;
import com.yire.domain.EmpleadoCorreo;
import java.util.List;

public interface EmpleadoCorreoService {
    public List<EmpleadoCorreo> getCorreosByEmpleado(Empleado empleado);
}
