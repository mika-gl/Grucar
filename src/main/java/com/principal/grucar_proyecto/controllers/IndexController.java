package com.principal.grucar_proyecto.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.principal.grucar_proyecto.models.Cliente;
import com.principal.grucar_proyecto.models.forms.Login;

import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;


@AllArgsConstructor
@Controller
public class IndexController {
    @GetMapping("/")
    public String index() {
        return "index.jsp";
    }
}
