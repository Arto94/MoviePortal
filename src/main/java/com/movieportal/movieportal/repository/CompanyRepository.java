package com.movieportal.movieportal.repository;


import com.movieportal.movieportal.model.Company;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CompanyRepository extends JpaRepository<Company,Integer> {
}
