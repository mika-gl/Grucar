package com.principal.grucar_proyecto.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.principal.grucar_proyecto.models.Solicitud;

import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;


@AllArgsConstructor
@Controller
public class IndexController {
    @GetMapping("/")
    public String index() {
        return "index.jsp";
    }

    @GetMapping("/perfil")
    public String perfilUsuario(HttpSession session, Model model, @ModelAttribute(name="solicitud") Solicitud solicitud) {
        if (session.getAttribute("currentUser") == null) {
            return "redirect:/";
        }else
        {
            return "home/prestador/perfil.jsp";
        }
    }
}
