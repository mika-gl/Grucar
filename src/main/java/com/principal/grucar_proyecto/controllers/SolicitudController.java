package com.principal.grucar_proyecto.controllers;


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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.principal.grucar_proyecto.models.Solicitud;
import com.principal.grucar_proyecto.services.SolicitudService;
import com.principal.grucar_proyecto.services.BaseService;

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
    private BaseService userService; //?

    //vista principal servicio
    @GetMapping("")
    public String indexSolicitud(HttpSession session, Model model) {
        if (session.getAttribute("currentUser") == null) {
            return "redirect:/login";
        }

        return "home/solicitudes/index.jsp";
    }

    // // Método para mostrar la vista de tarea por id
    // @GetMapping("/{showId}")
    // public String show(@ModelAttribute("rating") Rating rating, @PathVariable("showId") Long showId, Model model, HttpSession session) {
    //     Solicitud show = showService.showShowById(showId);
    //     model.addAttribute("show",show);
    //     model.addAttribute("currentRatings", ratingService.findRatingsByShowId(showId));
    //     return "home/shows/show.jsp";
    // }

    // // Método para mostrar la vista de crear tarea
    // @GetMapping("/new")
    // public String create(@ModelAttribute("show") Solicitud show, Model model, HttpSession session) {
    //     model.addAttribute("users", userService.findAll());
    //     return "home/shows/create.jsp";
    // }

    // // Método para guardar un tarea
    // @PostMapping("/new")
    // public String save(@Valid @ModelAttribute("show") Solicitud show, BindingResult result, Model model, HttpSession session) {
    //     if (result.hasErrors()) {
    //         model.addAttribute("users", userService.findAll());
    //         return "home/shows/create.jsp";
    //     }

    //     showService.save(show);
    //     return "redirect:/shows";
    // }

    // // Método para mostrar la vista de editar tarea
    // @GetMapping("/{showId}/edit")
    // public String edit(@ModelAttribute("show") Solicitud show, Model model, HttpSession session, @PathVariable("showId") Long showId) {
    //     Solicitud currentShow = showService.showShowById(showId);
    //     model.addAttribute("currentShow", currentShow);
    //     return "home/shows/edit.jsp";
    // }
    
    // // Método para actualizar un tarea
    // @PutMapping("/{showId}/edit")
    // public String update(@Valid @ModelAttribute("show") Solicitud show, BindingResult result, HttpSession session, Model model, RedirectAttributes redirectAttributes, @PathVariable Long showId) {
    //     Solicitud currentShow = showService.showShowById(showId);
    //     showService.asignarFechas(show, currentShow);
    //     if (result.hasErrors()) {
    //         model.addAttribute("currentShow", currentShow);
    //         return "home/shows/edit.jsp";
    //     }

    //     showService.update(show);
    //     return "redirect:/shows";
    // }

    // // Método para eliminar un tarea
    // @DeleteMapping("/{showId}/delete")
    // public String deleteShow(@PathVariable Long showId, HttpSession session) {
    //     showService.deleteById(showId);
    //     return "redirect:/shows";
    // }

    // @PutMapping("/{showId}/rate")
    // public String LikeShow(@PathVariable Long showId, HttpSession session, @Valid @ModelAttribute("rating") Rating rating, BindingResult result, Model model) {

    //     if (result.hasErrors()) {
    //         Solicitud show = showService.showShowById(showId);
    //         model.addAttribute("show",show);
    //         model.addAttribute("currentRatings", ratingService.findRatingsByShowId(showId));
    //         return "home/shows/show.jsp";
    //     }
    //     ratingService.actualizarRating(session, showId, rating);
    //     return "redirect:/shows";
    // }

}
