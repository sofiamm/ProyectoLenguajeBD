package com.yire.controller;

import com.yire.domain.Empleado;
import com.yire.domain.EmpleadoCorreo;
import com.yire.service.EmpleadoCorreoService;
import com.yire.service.EmpleadoService;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
@RequestMapping("/empleadocorreo")
public class EmpleadoCorreoController {
    
    @Autowired
    EmpleadoService empleadoService;
    
    @Autowired
    EmpleadoCorreoService empleadoCorreoService;
    
    @GetMapping("/lista/{idEmpleado}")
    public String listaCorreos(Empleado empleado,Model model){
        empleado=empleadoService.getEmpleado(empleado);
        List<EmpleadoCorreo> correos=empleadoCorreoService.getCorreosByEmpleado(empleado);
        model.addAttribute("correos", correos);
        model.addAttribute("empleado", empleado);
        return "/empleadocorreo/lista";
    }
    
    
}
