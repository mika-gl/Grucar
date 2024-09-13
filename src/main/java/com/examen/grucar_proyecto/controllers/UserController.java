package com.examen.grucar_proyecto.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.examen.grucar_proyecto.models.User;
import com.examen.grucar_proyecto.models.forms.Session;
import com.examen.grucar_proyecto.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;

@AllArgsConstructor
@Controller
@RequestMapping("/users")
public class UserController {

    @Autowired
    private UserService userService;

    // Método para registrar un usuario
    @PostMapping("/new")
    public String registrarUsuario(@Valid @ModelAttribute("user") User user, BindingResult result, Model model, HttpSession currentSession) {
        result = userService.validateUser(user, result);
        if (result.hasErrors()) {
            model.addAttribute("session", new Session());
            return "index.jsp";
        }
        currentSession.setAttribute("currentUser", user);
        userService.create(user);
        return "redirect:/shows";
    }
}
