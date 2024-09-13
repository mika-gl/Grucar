package com.principal.grucar_proyecto.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.principal.grucar_proyecto.models.User;
import com.principal.grucar_proyecto.models.forms.Session;
import com.principal.grucar_proyecto.services.SessionService;
import com.principal.grucar_proyecto.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;

@AllArgsConstructor
@Controller
@RequestMapping("/session")
public class SessionController {

    @Autowired
    private SessionService sessionService;
    @Autowired
    private UserService userService;

    @PostMapping("")
    public String login(@Valid @ModelAttribute Session session, BindingResult result, HttpSession currentSession,
            Model model) {
        //VALIDACION DE ERRORES POR ANOTADORES
        if (result.hasErrors()) {
            model.addAttribute("user", new User());
            return "index.jsp";
        }

        //VALIDACION DE ERRORES POR METODOS
        result = sessionService.validateLogin(session.getEmail(), session.getPassword(), currentSession, result);
        if (result.hasErrors()) {
            currentSession.invalidate();
            model.addAttribute("user", new User());
            return "index.jsp";
        }
        currentSession.setAttribute("currentUser", userService.findByEmail(session.getEmail()));
        return "redirect:/shows";
    }




    @GetMapping("/showOrder")
    public String orderTaskList(HttpSession currentSession, @RequestParam String direction) {
        switch (direction) {
            case "asc":
                currentSession.setAttribute("showOrder", "asc");
                break;
            default:
                currentSession.setAttribute("showOrder", "desc");
                break;
        }
        return "redirect:/shows";
    }

    @DeleteMapping("/logout")
    public String logoutSession(HttpSession currentSession) {
        sessionService.logout(currentSession);
        return "redirect:/";
    }
}
