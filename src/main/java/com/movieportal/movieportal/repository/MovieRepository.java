package com.movieportal.movieportal.repository;


import com.movieportal.movieportal.model.Actor;
import com.movieportal.movieportal.model.Movie;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface MovieRepository extends JpaRepository<Movie, Integer> {

    List<Movie> findAllByMovieActorsContaining(Actor actor);

    Movie findByTitle(String title);

    List<Movie> findAllByTitleContaining(String word);

    List<Movie> findAllByOrderByTitleAsc();
}
