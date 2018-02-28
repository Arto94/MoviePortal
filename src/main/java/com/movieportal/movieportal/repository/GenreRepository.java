package com.movieportal.movieportal.repository;


import com.movieportal.movieportal.model.Genre;
import org.springframework.data.jpa.repository.JpaRepository;

public interface GenreRepository extends JpaRepository<Genre, Integer> {

    Genre findOneByName(String name);
}
