package com.principal.grucar_proyecto.services;


import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.principal.grucar_proyecto.models.Solicitud;
import com.principal.grucar_proyecto.respositories.SolicitudRepository;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class SolicitudService {

    @Autowired
    private SolicitudRepository showRepository;


    public Solicitud save(Solicitud show) {
        return showRepository.save(show);
    }
    public List<Solicitud> findAll() {
        return showRepository.findAll();
    }
    public Solicitud findById(Long id) {
        return showRepository.findById(id).orElse(null);
    }
    public Solicitud update(Solicitud show) {
        return showRepository.save(show);
    }
    public void deleteById(Long id) {
        showRepository.deleteById(id);
    }
    public Solicitud showShowById(Long id) {
        Solicitud show = showRepository.findById(id).orElse(null);
        return show;
    }
    public List<Solicitud> showAllShows() {
        List<Solicitud> allShows = showRepository.findAll();
        return allShows;
    }

    public void asignarFechas(Solicitud show, Solicitud currentShow) {
        show.setCreatedAt(currentShow.getCreatedAt());
        show.setUpdatedAt(new Date());
    }
}
