package com.movieportal.movieportal.repository;

import com.movieportal.movieportal.model.BlogComment;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BlogCommentRepository extends JpaRepository<BlogComment,Integer> {

    List<BlogComment> findAllByBlogId(int id);
}
