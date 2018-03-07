package com.movieportal.movieportal.repository;


import com.movieportal.movieportal.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import javax.transaction.Transactional;


public interface UserRepository extends JpaRepository<User, Integer> {


    User findOneByEmail(String email);

    @Transactional
    @Modifying
    @Query(value = "INSERT INTO wish(user_id,movie_id) VALUES(:userId,:movieId)", nativeQuery = true)
    void addWish(@Param("userId") int userId, @Param("movieId") int movieId);

}
