package com.principal.grucar_proyecto.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.principal.grucar_proyecto.models.BaseUser;

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
    public String perfilUsuario(HttpSession session, Model model) {
        BaseUser currentUser = (BaseUser) session.getAttribute("currentUser");
        if (currentUser == null) {
            return "redirect:/";
        } else {
            model.addAttribute("usuario", currentUser);
            return "home/prestador/perfilPrestador.jsp";
        }
    }
}
