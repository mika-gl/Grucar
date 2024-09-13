package com.principal.grucar_proyecto.respositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.principal.grucar_proyecto.models.Solicitud;

@Repository
public interface SolicitudRepository extends CrudRepository<Solicitud, Long> {

    // Método para buscar todos los cursos
    List<Solicitud> findAll();

    // Método para buscar un curso por id
    Optional<Solicitud> findById(long id);

    // Método para crear un curso
    // Método para actualizar un curso
    Solicitud save(Solicitud show);

    // Método para eliminar un curso
    void deleteById(Long id);
}