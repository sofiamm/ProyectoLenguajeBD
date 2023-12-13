/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yire.controller;

import com.yire.domain.Empleado;
import com.yire.service.EmpleadoService;
import com.yire.service.PuestoService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@Slf4j
public class EmpleadoPuestoController {
    
    @Autowired
    EmpleadoService empService;
    
    @Autowired
    PuestoService pService;
    
    @GetMapping("/empleadopuesto/modificar/{idEmpleado}")
    public String modificarPuesto(Empleado empleado,Model model){
        empleado=empService.getEmpleado(empleado);
        model.addAttribute("empleado", empleado);
        var puestos=pService.getPuestos();
        model.addAttribute("puestos", puestos);
        return "/empleadopuesto/modificar";
    }
    
    @PostMapping("/empleadopuesto/guardar")
    public String guardar(){
        
        return "redirect:/empleado/lista";
    }
}
