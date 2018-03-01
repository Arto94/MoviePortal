package com.movieportal.movieportal.repository;

import com.movieportal.movieportal.model.Comment;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CommentRepository extends JpaRepository<Comment,Integer> {
}
