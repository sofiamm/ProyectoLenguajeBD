package com.yire.controller;

import com.yire.domain.Empleado;
import com.yire.service.EmpleadoService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@Slf4j
public class EmpleadoController {
    
    @Autowired
    private EmpleadoService empleadoService;
    

    @GetMapping("/empleado/lista")
    public String mostrarEmpleados(Model model) {
        var empleados = empleadoService.getEmpleados();

        model.addAttribute("empleados", empleados);
        return "/empleado/lista";
    }
    
    @GetMapping("/empleado/nuevo")
    public String nuevoEmpleado(Empleado empleado, Model model) {
        return "/empleado/modificar";
    }
    
    @PostMapping("/empleado/guardar")
    public String guardarEmpleado(Empleado empleado) {
        empleado.setNombre("ROLE_"+empleado.getNombre().toUpperCase());
        empleadoService.save(empleado);
        return "redirect:/empleado/lista";
    }

    @GetMapping("/empleado/modificar/{idEmpleado}")
    public String modificarEmpleado(Empleado empleado, Model model) {
        empleado = empleadoService.getEmpleado(empleado);
        model.addAttribute("empleado", empleado);
        return "/empleado/modificar";
    }

    @GetMapping("/empleado/eliminar/{idEmpleado}")
    public String eliminarEmpleado(Empleado empleado) {
        empleadoService.delete(empleado);
        return "redirect:/empleado/lista";
    }
}
