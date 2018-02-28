package com.movieportal.movieportal.repository;


import com.movieportal.movieportal.model.Actor;
import org.springframework.data.jpa.repository.JpaRepository;




public interface ActorRepository extends JpaRepository<Actor, Integer> {

    Actor findOneByName(String name);


}
