package com.principal.grucar_proyecto.controllers;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.principal.grucar_proyecto.models.Cliente;
import com.principal.grucar_proyecto.models.Prestador;
import com.principal.grucar_proyecto.models.Solicitud;
import com.principal.grucar_proyecto.services.ClienteService;
import com.principal.grucar_proyecto.services.PrestadorService;
import com.principal.grucar_proyecto.services.SolicitudService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;

//controlador de direccion para que un usuario solicite asistencia

@AllArgsConstructor
@Controller
@RequestMapping("/solicitudes")
public class SolicitudController {

    @Autowired
    private SolicitudService solicitudService;
    @Autowired
    private PrestadorService prestadorService;
    @Autowired
    private ClienteService clienteService;

    //vista principal servicio
    @GetMapping("")
    public String indexSolicitud(HttpSession session, Model model, @ModelAttribute(name="solicitud") Solicitud solicitud) {
        if (session.getAttribute("currentUser") == null) {
            return "redirect:/login";
        }
        Class<?> claseDeObjetoUsuario = session.getAttribute("currentUser").getClass();
        switch (claseDeObjetoUsuario.getName()) {
            case "com.principal.grucar_proyecto.models.Prestador": //Prestador
                Prestador prestador = (Prestador)session.getAttribute("currentUser");
                Solicitud solicitudActualPrestador = solicitudService.getSolicitudActiva(solicitudService.findByPrestador(prestador));
                if (solicitudActualPrestador.getSolicitudId() == null) {
                    List<Solicitud> solicitudes = solicitudService.findAll();
                    
                    model.addAttribute("solicitudes", solicitudes);
                    return "home/prestador/solicitudes.jsp";
                } else {
                    return "redirect:/solicitudes/" + solicitudActualPrestador.getSolicitudId();
                }
            default: // "Cliente"
                Cliente cliente = (Cliente)session.getAttribute("currentUser");
                Solicitud solicitudActualCliente = solicitudService.getSolicitudActiva(solicitudService.findByCliente(cliente));
                if (solicitudActualCliente.getSolicitudId() == null) {
                    return "home/cliente/solicitudes.jsp";
                } else {
                    return "redirect:/solicitudes/" + solicitudActualCliente.getSolicitudId();
                }
        }
    }

    // Método para mostrar la vista de solicitud por id
    @GetMapping("/{solicitudId}")
    public String show(@PathVariable("solicitudId") Long id, Model model, HttpSession session) {
        Solicitud solicitud = solicitudService.findById(id);
        model.addAttribute("solicitud", solicitud);

        Class<?> claseDeObjetoUsuario = session.getAttribute("currentUser").getClass();
        switch (claseDeObjetoUsuario.getName()) {
            case "com.principal.grucar_proyecto.models.Prestador":
            
                return "home/prestador/detalleSolicitud.jsp";
            
            default: // "Cliente"
                return "home/cliente/detalleSolicitud.jsp";
        }
    }

    // Hacer nueva solicitud de cliente (pedir asistencia)
    @PostMapping("/nueva")
    public String save(@Valid @ModelAttribute("solicitud") Solicitud solicitud, BindingResult result, Model model, HttpSession session) {
        if (result.hasErrors()) {
            return "home/cliente/solicitudes.jsp";
        }
        if (solicitudService.haySolicitudActiva(session)) {
            return "redirect:/solicitudes";
        }
        solicitud = solicitudService.asignarFechas(solicitud);
        solicitudService.save(solicitud);
        session.setAttribute("solicitud", solicitud); //Agrega solicitud a session para revisar en cualquier ruta si cliente ya hizo una.
        return "redirect:/solicitudes";
    }

    @PutMapping("/aceptar/{solicitudId}")
    public String aceptarSolicitud(@PathVariable("solicitudId") Long id, Model model, HttpSession session) {
        if (solicitudService.haySolicitudActiva(session)) {
            return "redirect:/solicitudes";
        }
        Solicitud solicitud = solicitudService.findById(id);
        Prestador prestador = (Prestador)session.getAttribute("currentUser");
        
        session.setAttribute("solicitud", solicitud);
        solicitudService.aceptarSolicitud(prestador, id); //actualiza info de prestador en Solicitud

        return "redirect:/solicitudes";
    }

    @GetMapping("/{solicitudId}/modificar")
    public String mostrarModificarSolicitud(@PathVariable("solicitudId") Long id, Model model, HttpSession session, @ModelAttribute("solicitud") Solicitud solicitud) {
        Class<?> claseDeObjetoUsuario = session.getAttribute("currentUser").getClass();
        if (!claseDeObjetoUsuario.getName().equals("com.principal.grucar_proyecto.models.Cliente")) {
            // verificar que se trata un cliente
            return "redirect:/";
        }
        Cliente cliente = (Cliente)session.getAttribute("currentUser");
        List<Solicitud> solicitudesCliente = solicitudService.findByCliente(cliente);
        if (solicitudService.getSolicitudActiva(solicitudesCliente).getSolicitudId() != id) {
            //verificar que quiere modificar la solicitud que tiene activa
            return "redirect:/";
        }
        if (solicitudService.getSolicitudActiva(solicitudesCliente).getPrestador() != null) {
            //verificar que la solicitud no la ha aceptado ningun prestador
            return "redirect:/";
        }

        Solicitud solicitudActual = solicitudService.findById(id);
        model.addAttribute("solicitudActual", solicitudActual);

        return "home/cliente/modificarSolicitud.jsp";
    }
    @PutMapping("/{solicitudId}/modificar")
    public String modificarSolicitud(@ModelAttribute("solicitud")@Valid Solicitud solicitud, @PathVariable("solicitudId") Long id, Model model, BindingResult result, HttpSession session) {
        if(result.hasErrors()){
            model.addAttribute("solicitud", solicitud);
            return "home/cliente/modificarSolicitud.jsp";
        }
        Class<?> claseDeObjetoUsuario = session.getAttribute("currentUser").getClass();
        if (!claseDeObjetoUsuario.getName().equals("com.principal.grucar_proyecto.models.Cliente")) {
            // verificar que se trata un cliente
            return "redirect:/";
        }
        Cliente cliente = (Cliente)session.getAttribute("currentUser");
        List<Solicitud> solicitudesCliente = solicitudService.findByCliente(cliente);
        if (solicitudService.getSolicitudActiva(solicitudesCliente).getSolicitudId() != id) {
            //verificar que quiere modificar la solicitud que tiene activa
            return "redirect:/";
        }
        if (solicitudService.getSolicitudActiva(solicitudesCliente).getPrestador() != null) {
            //verificar que la solicitud no la ha aceptado ningun prestador
            return "redirect:/";
        }

        // Solicitud solicitud = solicitudService.findById(id);
        // model.addAttribute("solicitud", solicitud);
        solicitud.setSolicitudId(id);
        solicitudService.update(solicitud);
        return "redirect:/solicitudes";
    }
    @PutMapping("/{solicitudId}/finalizar")
    public String finalizarSolicitud(@PathVariable("solicitudId") Long id, Model model, HttpSession session) {
        //TODO: validar que se trata de el Cliente o el Prestador ASOSCIADOS con la solicitud
        Solicitud solicitud = solicitudService.findById(id);
        solicitudService.finalizarSolicitud(session, solicitud);

        return "redirect:/solicitudes";
    }
    @DeleteMapping("/{solicitudId}/cancelar") //se puede cancelar cuando un prestador aun no ha aceptado
    public String cancelarSolicitud(@PathVariable("solicitudId") Long id, Model model, HttpSession session) {
        Class<?> claseDeObjetoUsuario = session.getAttribute("currentUser").getClass();
        if (!claseDeObjetoUsuario.getName().equals("com.principal.grucar_proyecto.models.Cliente")) {
            // verificar que se trata un cliente
            return "redirect:/";
        }
        Cliente cliente = (Cliente)session.getAttribute("currentUser");
        List<Solicitud> solicitudesCliente = solicitudService.findByCliente(cliente);
        if (solicitudService.getSolicitudActiva(solicitudesCliente).getSolicitudId() != id) {
            //verificar que quiere eliminar la solicitud que tiene activa
            return "redirect:/";
        }
        if (solicitudService.getSolicitudActiva(solicitudesCliente).getPrestador() != null) {
            //verificar que la solicitud no la ha aceptado ningun prestador
            return "redirect:/";
        }

        Solicitud solicitud = solicitudService.findById(id);
        solicitudService.cancelarSolicitud(solicitud);

        return "redirect:/solicitudes";
    }
}
