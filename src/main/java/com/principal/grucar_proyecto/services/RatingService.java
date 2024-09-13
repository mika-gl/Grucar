package com.principal.grucar_proyecto.services;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.principal.grucar_proyecto.models.Rating;
import com.principal.grucar_proyecto.models.Show;
import com.principal.grucar_proyecto.models.User;
import com.principal.grucar_proyecto.respositories.RatingRepository;

import jakarta.servlet.http.HttpSession;

@Service
public class RatingService {
    
    @Autowired
    private RatingRepository ratingRepository;
    @Autowired
    private ShowService showService;

    public Rating create(Rating rating) {
        rating.setCreatedAt(new Date());
        rating.setUpdatedAt(new Date());
        return ratingRepository.save(rating);
    }

    public List<Rating> findRatingsByShowId(Long showId) {
        List<Rating> allRatings = ratingRepository.findAll();
        List<Rating> searchedRatings = new ArrayList<>();
        for (Rating rating : allRatings) {
            if (rating.getShow().getShowId() == showId) {
                searchedRatings.add(rating);
            }
        }
        return searchedRatings;
    }


    public void actualizarRating(HttpSession session, Long showId, Rating rating) {
        User currentUser = (User)session.getAttribute("currentUser");
        Show show = showService.findById(showId);

        rating.setShow(show);
        rating.setUser(currentUser);
        create(rating);
    }
}
