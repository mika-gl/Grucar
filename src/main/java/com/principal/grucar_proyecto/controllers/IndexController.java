package com.principal.grucar_proyecto.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.principal.grucar_proyecto.models.BaseUser;
import com.principal.grucar_proyecto.models.Cliente;
import com.principal.grucar_proyecto.models.Prestador;

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
        if (session.getAttribute("currentUser") == null) {
            return "redirect:/";
        }
        Class<?> claseDeObjetoUsuario = session.getAttribute("currentUser").getClass();
        switch (claseDeObjetoUsuario.getName()) {
            case "com.principal.grucar_proyecto.models.Prestador":
                Prestador currentPrestador = (Prestador)session.getAttribute("currentUser");
                model.addAttribute("usuario", currentPrestador);
                return "home/prestador/perfilPrestador.jsp";
            default: // "Cliente"
                Cliente currentCliente = (Cliente)session.getAttribute("currentUser");
                model.addAttribute("usuario", currentCliente);
                return "home/cliente/perfilCliente.jsp";
        }
    }

    // Nueva ruta para la vista con cuenta regresiva
    @GetMapping("/appmovil")
    public String cuentaRegresiva() {
        return "home/appmovil.jsp"; // Devuelve la vista appmovil.jsp
    }
}
