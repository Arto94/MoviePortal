package com.movieportal.movieportal.repository;


import com.movieportal.movieportal.model.Actor;
import com.movieportal.movieportal.model.Genre;
import com.movieportal.movieportal.model.Movie;
import com.movieportal.movieportal.model.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;



import java.awt.print.Pageable;
import java.util.List;

public interface MovieRepository extends JpaRepository<Movie, Integer> {

    List<Movie> findAllByMovieActorsContaining(Actor actor);

    List<Movie> findByTitleLikeAndMovieGenresAndYear(String title, Genre genre, int year);

    List<Movie> findByYearAndTitleLike(int year, String title);

    List<Movie> findByMovieGenresAndTitleLike(Genre genre, String title);

    List<Movie> findByMovieGenresAndYear(Genre genre, int year);

    Movie findByTitle(String title);

    List<Movie> findAllByTitleLike(String word);

    Movie findById(int movieId);

    List<Movie> findAllByMovieGenresIsContaining(Genre genre);

    @Query(value = "select * from movie order by create_date limit 6", nativeQuery = true)
    List<Movie> orderByCreatedDate();

    Page<Movie> findAllBy(org.springframework.data.domain.Pageable pageable);

    List<Movie> findAllByOrderByImdbRateDesc();
    List<Movie> findAllByOrderByYearDesc();

    Page<Movie> findAllByOrderByImdbRateDesc(org.springframework.data.domain.Pageable pageable);



    List<Movie> findAllByUsersIsContaining(User user);

    List<Movie> findAllByYear(int year);


}
