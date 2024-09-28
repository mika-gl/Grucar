package com.principal.grucar_proyecto.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.principal.grucar_proyecto.models.BaseUser;
import com.principal.grucar_proyecto.models.Cliente;
import com.principal.grucar_proyecto.models.Prestador;
import com.principal.grucar_proyecto.models.Solicitud;
import com.principal.grucar_proyecto.services.ClienteService;
import com.principal.grucar_proyecto.services.PrestadorService;
import com.principal.grucar_proyecto.services.SolicitudService;

import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.RequestParam;



@AllArgsConstructor
@Controller
public class IndexController {
    @Autowired
    PrestadorService prestadorService;
    @Autowired
    ClienteService clienteService;
    @Autowired
    SolicitudService solicitudService;

    @GetMapping("/")
    public String index() {
        return "index.jsp";
    }
    @GetMapping("/perfil/redirect")
    public String redirectArutaPerfilSegunTipoDeUsuario(HttpSession session) {
        if (session.getAttribute("currentUser") == null) {
            //no registrado
            return "redirect:/";
        }
        Class<?> claseDeObjetoUsuario = session.getAttribute("currentUser").getClass();
        switch (claseDeObjetoUsuario.getName()) {
            case "com.principal.grucar_proyecto.models.Prestador":
                Prestador prestador = (Prestador)session.getAttribute("currentUser");
                return "redirect:/perfil/prestador/" + prestador.getPrestadorId();
            default:
                Cliente cliente = (Cliente)session.getAttribute("currentUser");
                return "redirect:/perfil/cliente/" + cliente.getClienteId();
        }
    }
    


    @GetMapping("/perfil/prestador/{userId}")
    public String perfilPrestador(HttpSession session, Model model, @PathVariable Long userId) {
        if (session.getAttribute("currentUser") == null) {
            return "redirect:/";
        }
        Class<?> claseDeObjetoUsuario = session.getAttribute("currentUser").getClass();
        Prestador cuentaPrestador = prestadorService.findById(userId);

        switch (claseDeObjetoUsuario.getName()) {
            case "com.principal.grucar_proyecto.models.Prestador": //PRESTADOR INGRESANDO A UN PERFIL DE PRESTADOR
                Prestador currentPrestador = (Prestador)session.getAttribute("currentUser");
                if (currentPrestador.getPrestadorId() != userId) { // si el usuario prestador es el mismmo del perfil
                    return "redirect:/";
                }
                model.addAttribute("usuario", cuentaPrestador);
                return "home/prestador/perfilPrestador.jsp";
            default: // "Cliente" //CLIENTE INGRESANDO A UN PERFIL DE PRESTADOR
                Cliente currentCliente = (Cliente)session.getAttribute("currentUser");
                Solicitud solicitudCliente = solicitudService.getSolicitudActiva(solicitudService.findByCliente(currentCliente));
                if (solicitudCliente.getSolicitudId() == null) {
                    //cliente no tiene solicitud activa
                    return "redirect:/";
                }
                if (!solicitudCliente.getPrestador().getPrestadorId().equals(cuentaPrestador.getPrestadorId())) {
                    //si no es el prestador de su solicitud, redirect
                    return "redirect:/";
                }

                model.addAttribute("usuario", cuentaPrestador);
                return "home/prestador/perfilPrestador.jsp";
        }
    }
    @GetMapping("/perfil/cliente/{userId}")
    public String perfilCliente(HttpSession session, Model model, @PathVariable Long userId) {
        if (session.getAttribute("currentUser") == null) {
            return "redirect:/";
        }
        Class<?> claseDeObjetoUsuario = session.getAttribute("currentUser").getClass();
        Cliente cuentaCliente = clienteService.findById(userId);

        switch (claseDeObjetoUsuario.getName()) {
            case "com.principal.grucar_proyecto.models.Prestador": //PRESTADOR INGRESANDO A UN PERFIL DE CLIENTE
                Prestador currentPrestador = (Prestador)session.getAttribute("currentUser");
                Solicitud solicitudPrestador = solicitudService.getSolicitudActiva(solicitudService.findByPrestador(currentPrestador));
                if (solicitudPrestador.getSolicitudId() == null) {
                    // prestador no tiene una solicitud activa
                    return "redirect:/";
                }
                if (!solicitudPrestador.getCliente().getClienteId().equals(cuentaCliente.getClienteId())) {
                    //si no es el prestador de la solicitud del cliente, redirect
                    return "redirect:/";
                }

                model.addAttribute("usuario", cuentaCliente);
                return "home/cliente/perfilCliente.jsp";

            default: // "Cliente" //CLIENTE INGRESANDO A UN PERFIL DE CLIENTE
                Cliente currentCliente = (Cliente)session.getAttribute("currentUser");
                if (currentCliente.getClienteId() != userId) {
                    //si no es el cliente mismo de la cuenta, redirect
                    return "redirect:/";
                }

                model.addAttribute("usuario", cuentaCliente);
                return "home/cliente/perfilCliente.jsp";
        }
    }

    // Nueva ruta para la vista con cuenta regresiva
    @GetMapping("/appmovil")
    public String cuentaRegresiva() {
        return "home/appmovil.jsp"; // Devuelve la vista appmovil.jsp
    }
}
