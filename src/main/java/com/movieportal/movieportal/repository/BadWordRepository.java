package com.movieportal.movieportal.repository;

import com.movieportal.movieportal.model.BadWord;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BadWordRepository extends JpaRepository<BadWord,Integer>{
}
