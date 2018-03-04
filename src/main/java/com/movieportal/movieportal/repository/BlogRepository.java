package com.movieportal.movieportal.repository;

import com.movieportal.movieportal.model.Blog;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BlogRepository  extends JpaRepository<Blog,Integer>{
}
