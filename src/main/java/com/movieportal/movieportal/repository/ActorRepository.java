package com.movieportal.movieportal.repository;


import com.movieportal.movieportal.model.Actor;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface ActorRepository extends JpaRepository<Actor, Integer> {

    Actor findOneByName(String name);

    List<Actor> findAllByName(String name);

    List<Actor> findAllByNameContaining(String name);

}
