package com.movieportal.movieportal.repository;


import com.movieportal.movieportal.model.Actor;
import com.movieportal.movieportal.model.Genre;
import com.movieportal.movieportal.model.Movie;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface MovieRepository extends JpaRepository<Movie, Integer> {

    List<Movie> findAllByMovieActorsContaining(Actor actor);

    Movie findByTitle(String title);

    List<Movie> findAllByTitleContaining(String word);

    Movie findById(int movieId);

    List<Movie> findAllByMovieGenresIsContaining(Genre genre);

    @Query(value = "select * from movie order by create_date limit 2", nativeQuery = true)
    List<Movie> orderByCreatedDate();
}
