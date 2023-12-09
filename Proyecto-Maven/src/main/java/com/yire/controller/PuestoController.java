package com.yire.controller;

import com.yire.domain.Puesto;
import com.yire.service.PuestoService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@Slf4j
public class PuestoController {

    @Autowired
    private PuestoService puestoService;

    @GetMapping("/puesto/lista")
    public String mostrarPuestos(Model model) {
        var puestos = puestoService.getPuestos();

        model.addAttribute("puestos", puestos);
        return "/puesto/lista";
    }
    
    @GetMapping("/puesto/nuevo")
    public String nuevoPuesto(Puesto puesto, Model model) {
        return "/puesto/modificar";
    }
    
    @PostMapping("/puesto/guardar")
    public String guardarPuesto(Puesto puesto) {
        puesto.setNombre("ROLE_"+puesto.getNombre().toUpperCase());
        puestoService.save(puesto);
        return "redirect:/puesto/lista";
    }

    @GetMapping("/puesto/modificar/{idPuesto}")
    public String modificarPuesto(Puesto puesto, Model model) {
        puesto = puestoService.getPuesto(puesto);
        model.addAttribute("puesto", puesto);
        return "/puesto/modificar";
    }

    @GetMapping("/puesto/eliminar/{idPuesto}")
    public String eliminarPuesto(Puesto puesto) {
        puestoService.delete(puesto);
        return "redirect:/puesto/lista";
    }
}
