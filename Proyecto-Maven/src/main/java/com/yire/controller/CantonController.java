package com.yire.controller;

import com.yire.domain.Canton;
import com.yire.service.CantonService;
import com.yire.service.ProvinciaService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
@Slf4j
public class CantonController {
    
    @Autowired
    private CantonService cantonService;
    
    @Autowired
    private ProvinciaService provinciaService;

    @GetMapping("/canton/lista")
    public String mostrarCantones(Model model) {
        var cantones = cantonService.getCantones2();
        var provincias= provinciaService.getProvincias();

        model.addAttribute("cantones", cantones);
        model.addAttribute("provincias", provincias);
        return "/canton/lista";
    }
}
