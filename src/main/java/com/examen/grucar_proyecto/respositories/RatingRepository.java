package com.examen.grucar_proyecto.respositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.examen.grucar_proyecto.models.Rating;

@Repository
public interface RatingRepository extends CrudRepository<Rating,Long> {
    List<Rating> findAll();
}
