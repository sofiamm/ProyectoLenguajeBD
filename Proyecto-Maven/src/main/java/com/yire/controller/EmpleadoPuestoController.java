/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yire.controller;

import com.yire.Json;
import com.yire.domain.Empleado;
import com.yire.domain.Puesto;
import com.yire.service.EmpleadoPuestoService;
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
    
    @Autowired
    EmpleadoPuestoService epService;
    
    @GetMapping("/empleadopuesto/modificar/{idEmpleado}")
    public String modificarPuesto(Empleado empleado,Model model){
        empleado=empService.getEmpleado(empleado);
        model.addAttribute("empleado", empleado);
        var puestos=pService.getPuestos();
        
        String puestosJSON = Json.JsonEmpleadoPuesto(puestos);
        model.addAttribute("puestosJSON", puestosJSON);
        model.addAttribute("puestos", puestos);
        var puesto=new Puesto();
        model.addAttribute("puesto", puesto);
        return "/empleadopuesto/modificar";
    }
    
    @GetMapping("/empleadopuesto/guardar/{idEmpleado}/{idPuesto}")
    public String guardar(Empleado empleado,Puesto puesto){
        System.out.println(puesto.toString());
        epService.guardar(empleado.getIdEmpleado(),puesto.getIdPuesto());
        return "redirect:/empleado/lista";
    }
}
