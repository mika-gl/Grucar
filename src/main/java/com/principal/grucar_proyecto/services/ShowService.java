package com.principal.grucar_proyecto.services;


import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.principal.grucar_proyecto.models.Show;
import com.principal.grucar_proyecto.respositories.ShowRepository;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class ShowService {

    @Autowired
    private ShowRepository showRepository;


    public Show save(Show show) {
        return showRepository.save(show);
    }
    public List<Show> findAll() {
        return showRepository.findAll();
    }
    public Show findById(Long id) {
        return showRepository.findById(id).orElse(null);
    }
    public Show update(Show show) {
        return showRepository.save(show);
    }
    public void deleteById(Long id) {
        showRepository.deleteById(id);
    }
    public Show showShowById(Long id) {
        Show show = showRepository.findById(id).orElse(null);
        return show;
    }
    public List<Show> showAllShows() {
        List<Show> allShows = showRepository.findAll();
        return allShows;
    }

    public void asignarFechas(Show show, Show currentShow) {
        show.setCreatedAt(currentShow.getCreatedAt());
        show.setUpdatedAt(new Date());
    }
}
