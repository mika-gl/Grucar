package com.principal.grucar_proyecto.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.principal.grucar_proyecto.models.User;
import com.principal.grucar_proyecto.models.forms.Session;

import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;

@AllArgsConstructor
@Controller
public class IndexController {

    @GetMapping("/")
    public String index(Model model, HttpSession session) {

        if (!(session.getAttribute("currentUser") == null)){
            return "redirect:/shows";
        }


        model.addAttribute("user", new User());
        model.addAttribute("session", new Session());
        
        return "index.jsp";
    }

}
