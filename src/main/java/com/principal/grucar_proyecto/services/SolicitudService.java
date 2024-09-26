package com.principal.grucar_proyecto.services;


import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.principal.grucar_proyecto.models.Cliente;
import com.principal.grucar_proyecto.models.Prestador;
import com.principal.grucar_proyecto.models.Solicitud;
import com.principal.grucar_proyecto.respositories.ClienteRepository;
import com.principal.grucar_proyecto.respositories.SolicitudRepository;

import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class SolicitudService {

    @Autowired
    private SolicitudRepository solicitudRepository;
    @Autowired
    private ClienteRepository clienteRepository;


    public Solicitud save(Solicitud solicitud) {
        solicitud = traducirAveria(solicitud);
        return solicitudRepository.save(solicitud);
    }
    public List<Solicitud> findAll() {
        return solicitudRepository.findAll();
    }
    public Solicitud findById(Long id) {
        return solicitudRepository.findById(id).orElse(null);
    }
    public Solicitud update(Solicitud solicitud) {
        solicitud = traducirAveria(solicitud);
        return solicitudRepository.save(solicitud);
    }
    public void deleteById(Long id) {
        solicitudRepository.deleteById(id);
    }
    public Solicitud solicitudShowById(Long id) {
        Solicitud solicitud = solicitudRepository.findById(id).orElse(null);
        return solicitud;
    }
    public List<Solicitud> solicitudAllShows() {
        List<Solicitud> allShows = solicitudRepository.findAll();
        return allShows;
    }

    public List<Solicitud> findByCliente(Cliente cliente) {
        return solicitudRepository.findByCliente(cliente);
    }
    public List<Solicitud> findByPrestador(Prestador prestador) {
        return solicitudRepository.findByPrestador(prestador);
    }
    public Solicitud getSolicitudActiva(List<Solicitud> solicitudes) {
        Solicitud solicitudActiva = new Solicitud();
        for (Solicitud solicitud : solicitudes) {
            if (solicitud.isSolicitudActiva()) {
                solicitudActiva = solicitud;
                break;
            }
        }
        return solicitudActiva;
    }


    public Solicitud asignarFechas(Solicitud solicitud) {
        solicitud.setCreatedAt(new Date());
        solicitud.setUpdatedAt(new Date());
        return solicitud;
    }

    public void aceptarSolicitud(Prestador prestador, Long solicitudId) {
        Solicitud solicitud = solicitudRepository.findById(solicitudId).orElse(null);
        solicitud.setPrestador(prestador);
        solicitudRepository.save(solicitud);
    }

    public void finalizarSolicitud(HttpSession session, Solicitud solicitud) {
        Class<?> claseDeObjetoUsuario = session.getAttribute("currentUser").getClass();
        switch (claseDeObjetoUsuario.getName()) {
            case "com.principal.grucar_proyecto.models.Prestador":
                solicitud.setPrestadorFinalizo(true);
                break;
            default: // "Cliente"
                solicitud.setClienteFinalizo(true);
                break;
        }
        if (solicitud.isClienteFinalizo() && solicitud.isPrestadorFinalizo()) {
            solicitud.setSolicitudActiva(false);
        }
        solicitudRepository.save(solicitud);
    }
    public void cancelarSolicitud(Solicitud solicitud) {
        solicitudRepository.delete(solicitud);
    }

    public boolean haySolicitudActiva(HttpSession session) {
        Class<?> claseDeObjetoUsuario = session.getAttribute("currentUser").getClass();
        switch (claseDeObjetoUsuario.getName()) {
            case "com.principal.grucar_proyecto.models.Prestador":
                Prestador prestador = (Prestador)session.getAttribute("currentUser");
                return getSolicitudActiva(findByPrestador(prestador)) == null;
            default: // "Cliente"
                Cliente cliente = (Cliente)session.getAttribute("currentUser");
                return getSolicitudActiva(findByCliente(cliente)) == null;
        }
    }

    public Solicitud traducirAveria(Solicitud solicitud) {
        switch (solicitud.getAveria()) {
            case "0":
                solicitud.setAveriaTraduccion("Problemas con el motor");
                break;
            case "1":
                solicitud.setAveriaTraduccion("Pinchazo de llanta");
                break;
            case "2":
                solicitud.setAveriaTraduccion("Batería agotada");
                break;
            case "3":
                solicitud.setAveriaTraduccion("Falta de combustible");
                break;
            case "4":
                solicitud.setAveriaTraduccion("Problemas de frenos");
                break;
            case "5":
                solicitud.setAveriaTraduccion("Problemas eléctricos");
                break;
            case "6":
                solicitud.setAveriaTraduccion("Problemas de refrigeración del motor");
                break;
            case "7":
                solicitud.setAveriaTraduccion("Problemas de transmisión");
                break;
            case "8":
                solicitud.setAveriaTraduccion("Llave dentro del vehículo");
                break;
            case "9":
                solicitud.setAveriaTraduccion("Vehículo atascado");
                break;
            case "10":
                solicitud.setAveriaTraduccion("Problemas con las luces");
                break;
            case "11":
                solicitud.setAveriaTraduccion("Sobrecalentamiento del vehículo");
                break;
            case "12":
                solicitud.setAveriaTraduccion("Falla del sistema de dirección");
                break;
            case "o":
                solicitud.setAveriaTraduccion("Otro");
                break;
        }
        return solicitud;
    }
}
