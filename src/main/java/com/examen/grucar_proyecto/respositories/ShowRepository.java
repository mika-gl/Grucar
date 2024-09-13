package com.examen.grucar_proyecto.respositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.examen.grucar_proyecto.models.Show;

@Repository
public interface ShowRepository extends CrudRepository<Show, Long> {

    // Método para buscar todos los cursos
    List<Show> findAll();

    // Método para buscar un curso por id
    Optional<Show> findById(long id);

    // Método para crear un curso
    // Método para actualizar un curso
    Show save(Show show);

    // Método para eliminar un curso
    void deleteById(Long id);
}