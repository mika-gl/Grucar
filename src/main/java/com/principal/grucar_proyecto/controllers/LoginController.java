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

import com.principal.grucar_proyecto.models.Cliente;
import com.principal.grucar_proyecto.models.Prestador;
import com.principal.grucar_proyecto.models.forms.Login;
import com.principal.grucar_proyecto.services.LoginService;
import com.principal.grucar_proyecto.services.PrestadorService;
import com.principal.grucar_proyecto.services.BaseService;
import com.principal.grucar_proyecto.services.ClienteService;

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

        if (!(session.getAttribute("loggedUser") == null)){
            return "redirect:/shows";
        }
        model.addAttribute("login", new Login());
        return "login.jsp";
    }

    //recibir login
    @PostMapping("")
    public String login(@Valid @ModelAttribute Login login, BindingResult result, HttpSession currentSession, Model model) {
        //VALIDACION DE ERRORES POR ANOTADORES
        if (result.hasErrors()) {
            model.addAttribute("login", new Login());
            return "login.jsp";
        }

        //VALIDACION DE ERRORES POR METODOS
        result = loginService.validateLogin(login.getEmail(), login.getPassword(), currentSession, result);
        if (result.hasErrors()) {
            currentSession.invalidate();
            model.addAttribute("login", new Login());
            return "login.jsp";
        }
        // currentSession.setAttribute("currentUser", userService.findByEmail(session.getEmail())); no es necesario si se hace en loginService.validateLogin no?
        return "redirect:/solicitudes";
    }

    @DeleteMapping("/logout")
    public String logoutSession(HttpSession currentSession) {
        loginService.logout(currentSession);
        return "redirect:/";
    }
}
