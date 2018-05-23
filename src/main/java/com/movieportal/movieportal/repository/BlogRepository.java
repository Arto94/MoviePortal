package com.movieportal.movieportal.repository;

import com.movieportal.movieportal.model.Blog;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BlogRepository  extends JpaRepository<Blog,Integer>{

    Page<Blog> findAll(Pageable pageable);
}
