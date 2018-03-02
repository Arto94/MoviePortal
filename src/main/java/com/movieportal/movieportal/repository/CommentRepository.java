package com.movieportal.movieportal.repository;

import com.movieportal.movieportal.model.Comment;
import com.movieportal.movieportal.model.Movie;
import com.movieportal.movieportal.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CommentRepository extends JpaRepository<Comment,Integer> {

    List<Comment> findAllByMovieId(int id);


}
