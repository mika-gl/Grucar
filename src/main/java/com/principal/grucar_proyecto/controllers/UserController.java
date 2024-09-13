package com.principal.grucar_proyecto.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.principal.grucar_proyecto.models.Cliente;
import com.principal.grucar_proyecto.models.forms.Login;
import com.principal.grucar_proyecto.services.BaseService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@AllArgsConstructor
@Controller
@RequestMapping("/registro")
public class UserController {

    @Autowired
    private BaseService userService;

    // REGISTRO diferenciador tipo de usuario vista 
    @GetMapping("")
    public String redireccionarClientesPrestadores(@RequestParam String userType) {
        if (userType.equals("cliente")) {
            return "redirect: clientes";
        } else if (userType.equals("prestador")) {
            return "redirect: prestadores";
        } else {
            return "redirect:/";
        }
    }
    
    @GetMapping("/clientes")
    public String mostrarRegistroClientes() {
        return "login-registro/registroClientes.jsp";
    }
    @GetMapping("/prestadores")
    public String mostrarRegistroPrestadores() {
        return "login-registro/registroPrestadores.jsp";
    }
    

    // @PostMapping("/nuevo")
    // public String registrarUsuario(@Valid @ModelAttribute("user") Cliente user, BindingResult result, Model model, HttpSession currentSession) {
    //     result = userService.validateUser(user, result);
    //     if (result.hasErrors()) {
    //         model.addAttribute("session", new Login());
    //         return "index.jsp";
    //     }
    //     currentSession.setAttribute("currentUser", user);
    //     userService.create(user);
    //     return "redirect:/shows";
    // }
}
