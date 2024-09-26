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

import com.principal.grucar_proyecto.models.forms.Login;
import com.principal.grucar_proyecto.services.ClienteService;
import com.principal.grucar_proyecto.services.LoginService;
import com.principal.grucar_proyecto.services.PrestadorService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;

@AllArgsConstructor
@Controller
@RequestMapping("/login")
public class LoginController {

    @Autowired
    private LoginService loginService;
    @Autowired
    private PrestadorService prestadorService;
    @Autowired
    private ClienteService clienteService;


    //mostrar login
    @GetMapping("")
    public String index(Model model, HttpSession session) {

        if (session.getAttribute("currentUser") != null) {
            return "redirect:/solicitudes";
        }
        model.addAttribute("login", new Login());
        return "login-registro/login.jsp";
    }

    //recibir login
    @PostMapping("")
    public String login(@Valid @ModelAttribute Login login, BindingResult result, HttpSession currentSession, Model model) {
        //VALIDACION DE ERRORES POR ANOTADORES
        if (result.hasErrors()) {
            return "login-registro/login.jsp";
        }

        //VALIDACION DE ERRORES POR METODOS
        result = loginService.validateLogin(login.getNumero(), login.getPassword(), currentSession, result);
        if (result.hasErrors()) {
            currentSession.invalidate();
            return "login-registro/login.jsp";
        }
        return "redirect:/";
    }

    @DeleteMapping("/logout")
    public String logoutSession(HttpSession currentSession) {
        loginService.logout(currentSession);
        return "redirect:/";
    }
}
