package com.examen.grucar_proyecto.controllers;


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

import com.examen.grucar_proyecto.models.Rating;
import com.examen.grucar_proyecto.models.Show;
import com.examen.grucar_proyecto.services.RatingService;
import com.examen.grucar_proyecto.services.ShowService;
import com.examen.grucar_proyecto.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;


@AllArgsConstructor
@Controller
@RequestMapping("/shows")
public class ShowController {

    @Autowired
    private ShowService showService;
    @Autowired
    private UserService userService;
    @Autowired
    private RatingService ratingService;

    // Método para mostrar la vista de tareas
    @GetMapping("")
    public String indexShows(HttpSession session, Model model) {
        if (session.getAttribute("currentUser") == null) {
            return "redirect:/";
        }
        model.addAttribute("shows", showService.findAll());
        return "home/shows/index.jsp";
    }

    // Método para mostrar la vista de tarea por id
    @GetMapping("/{showId}")
    public String show(@ModelAttribute("rating") Rating rating, @PathVariable("showId") Long showId, Model model, HttpSession session) {
        Show show = showService.showShowById(showId);
        model.addAttribute("show",show);
        model.addAttribute("currentRatings", ratingService.findRatingsByShowId(showId));
        return "home/shows/show.jsp";
    }

    // Método para mostrar la vista de crear tarea
    @GetMapping("/new")
    public String create(@ModelAttribute("show") Show show, Model model, HttpSession session) {
        model.addAttribute("users", userService.findAll());
        return "home/shows/create.jsp";
    }

    // Método para guardar un tarea
    @PostMapping("/new")
    public String save(@Valid @ModelAttribute("show") Show show, BindingResult result, Model model, HttpSession session) {
        if (result.hasErrors()) {
            model.addAttribute("users", userService.findAll());
            return "home/shows/create.jsp";
        }

        showService.save(show);
        return "redirect:/shows";
    }

    // Método para mostrar la vista de editar tarea
    @GetMapping("/{showId}/edit")
    public String edit(@ModelAttribute("show") Show show, Model model, HttpSession session, @PathVariable("showId") Long showId) {
        Show currentShow = showService.showShowById(showId);
        model.addAttribute("currentShow", currentShow);
        return "home/shows/edit.jsp";
    }
    
    // Método para actualizar un tarea
    @PutMapping("/{showId}/edit")
    public String update(@Valid @ModelAttribute("show") Show show, BindingResult result, HttpSession session, Model model, RedirectAttributes redirectAttributes, @PathVariable Long showId) {
        Show currentShow = showService.showShowById(showId);
        showService.asignarFechas(show, currentShow);
        if (result.hasErrors()) {
            model.addAttribute("currentShow", currentShow);
            return "home/shows/edit.jsp";
        }

        showService.update(show);
        return "redirect:/shows";
    }

    // Método para eliminar un tarea
    @DeleteMapping("/{showId}/delete")
    public String deleteShow(@PathVariable Long showId, HttpSession session) {
        showService.deleteById(showId);
        return "redirect:/shows";
    }

    @PutMapping("/{showId}/rate")
    public String LikeShow(@PathVariable Long showId, HttpSession session, @Valid @ModelAttribute("rating") Rating rating, BindingResult result, Model model) {

        if (result.hasErrors()) {
            Show show = showService.showShowById(showId);
            model.addAttribute("show",show);
            model.addAttribute("currentRatings", ratingService.findRatingsByShowId(showId));
            return "home/shows/show.jsp";
        }
        ratingService.actualizarRating(session, showId, rating);
        return "redirect:/shows";
    }

}
