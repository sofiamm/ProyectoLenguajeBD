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

    @GetMapping("/puesto/informacion")
    public String mostrarInformacion(Model model) {
        return "/puesto/informacion";
    }

    @GetMapping("/puesto/contacto")
    public String mostrarContacto(Model model) {
        return "/puesto/contacto";
    }

    @GetMapping("/puesto/lista")
    public String mostrarPuestos(Model model) {
        var puestos = puestoService.getPuestos();

        model.addAttribute("puestos", puestos);
        return "/puesto/lista";
    }

    @PostMapping("/puesto/guardar")
    public String guardarUsuario(Puesto puesto) {
        puestoService.save(puesto);
        return "redirect:/puesto/lista";
    }
}
