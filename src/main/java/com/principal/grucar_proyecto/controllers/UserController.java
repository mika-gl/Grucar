package com.principal.grucar_proyecto.controllers;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.JsonSerializable.Base;
import com.principal.grucar_proyecto.models.BaseUser;
import com.principal.grucar_proyecto.models.Cliente;
import com.principal.grucar_proyecto.models.Prestador;
import com.principal.grucar_proyecto.models.forms.Login;
import com.principal.grucar_proyecto.services.BaseUserService;
import com.principal.grucar_proyecto.services.ClienteService;
import com.principal.grucar_proyecto.services.PrestadorService;

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
    private BaseUserService baseUserService;
    @Autowired
    private ClienteService clienteService;
    @Autowired
    private PrestadorService prestadorService;

    // REGISTRO diferenciador tipo de usuario vista 
    @GetMapping("")
    public String redireccionarClientesPrestadores(@RequestParam String userType) {
        if (userType.equals("cliente")) {
            return "redirect:/registro/clientes";
        } else if (userType.equals("prestador")) {
            return "redirect:/registro/prestadores";
        } else {
            return "redirect:/";
        }
    }
    
    @GetMapping("/clientes")
    public String mostrarRegistroClientes(@ModelAttribute(name="baseUser") BaseUser baseUser) {
        return "login-registro/registroClientes.jsp";
    }
    @GetMapping("/prestadores")
    public String mostrarRegistroPrestadores(@ModelAttribute(name="baseUser") BaseUser baseUser) {
        return "login-registro/registroPrestadores.jsp";
    }
    

    @PostMapping("/nuevo")
    public String registrarUsuario(@RequestParam String tipoDeUsuario, @Valid @ModelAttribute("baseUser") BaseUser baseUser, BindingResult result, Model model, HttpSession currentSession) {
        result = baseUserService.validateUser(baseUser, result, tipoDeUsuario);
        if (result.hasErrors()) {
            switch (tipoDeUsuario) {
                case "cliente":
                    return "login-registro/registroClientes.jsp";
                case "prestador":
                    return "login-registro/registroPrestadores.jsp";
                default:
                    return "redirect:/";
            }
        }

        if (tipoDeUsuario.equals("cliente")) {

            baseUser = baseUserService.setPresetAllDates(baseUser); //Agrega updated_at y created_at a baseUser
            Cliente cliente = clienteService.convertBaseUserToCliente(baseUser); //crea una instancia de Cliente a partir de info en baseUser para guardar en base de datos
            clienteService.save(cliente);
            currentSession.setAttribute("currentUser", cliente);
        } else if (tipoDeUsuario.equals("prestador")) {

            baseUser = baseUserService.setPresetAllDates(baseUser); //Agrega updated_at y created_at a baseUser
            Prestador prestador = prestadorService.convertBaseUserToPrestador(baseUser); //crea una instancia de Prestador a partir de info en baseUser para guardar en base de datos
            prestadorService.save(prestador);
            currentSession.setAttribute("currentUser", prestador);
        }
        return "redirect:/solicitudes";
    }
}
