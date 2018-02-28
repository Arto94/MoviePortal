package com.movieportal.movieportal.repository;


import com.movieportal.movieportal.model.Director;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DirectorRepository extends JpaRepository<Director,Integer> {

    Director findOneByName(String name);
}
