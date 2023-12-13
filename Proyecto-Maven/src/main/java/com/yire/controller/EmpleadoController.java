package com.yire.controller;

import com.yire.domain.Empleado;
import com.yire.domain.EmpleadoPuesto;
import com.yire.domain.Puesto;
import com.yire.service.EmpleadoPuestoService;
import com.yire.service.EmpleadoService;
import com.yire.service.PuestoService;
import java.util.List;
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
    
    @Autowired
    private PuestoService puestoService;
    
    @Autowired
    private EmpleadoPuestoService empleadoPuestoService;

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
        empleadoService.save(empleado);
        return "redirect:/empleado/lista";
    }

    @GetMapping("/empleado/modificar/{idEmpleado}")
    public String modificarEmpleado(Empleado empleado, Model model) {
        empleado = empleadoService.getEmpleado(empleado);
        EmpleadoPuesto ep=empleadoPuestoService.getPuestoByIdEmpleado(empleado.getIdEmpleado());
        if (ep!=null){empleado.setPuesto(puestoService.getPuesto(new Puesto(ep.getIdPuesto())));
        }else{empleado.setPuesto(null);}
        List<Puesto> puestos= puestoService.getPuestos();
        model.addAttribute("empleado", empleado);
        model.addAttribute("puestos", puestos);
        return "/empleado/modificar";
    }

    @GetMapping("/empleado/eliminar/{idEmpleado}")
    public String eliminarEmpleado(Empleado empleado) {
        empleadoService.delete(empleado);
        return "redirect:/empleado/lista";
    }
}
