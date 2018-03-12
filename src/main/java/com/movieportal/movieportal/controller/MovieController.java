package com.movieportal.movieportal.controller;


import com.movieportal.movieportal.model.Comment;
import com.movieportal.movieportal.model.Genre;
import com.movieportal.movieportal.model.Movie;
import com.movieportal.movieportal.model.User;
import com.movieportal.movieportal.repository.*;
import com.movieportal.movieportal.security.CurrentUser;
import javafx.scene.input.InputMethodTextRun;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.social.facebook.api.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.awt.*;
import java.util.Collections;
import java.util.List;

@Controller
public class MovieController {

    @Autowired
    private MovieRepository movieRepository;
    @Autowired
    private ActorRepository actorRepository;
    @Autowired
    private CommentRepository commentRepository;
    @Autowired
    private UserRepository userRepository;

    @Autowired
    CompanyRepository companyRepository;

    @Autowired
    private GenreRepository genreRepository;

    @GetMapping("/movies")
    public String allMovies(ModelMap map, @RequestParam(value = "errorMessage", required = false) String errorMessage) {
        map.addAttribute("movies", movieRepository.findAll());
        map.addAttribute("errorMessage", errorMessage != null ? errorMessage : "");
        map.addAttribute("genres", genreRepository.findAll());
        map.addAttribute("genre", new Genre());
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.getPrincipal() != null && authentication.getPrincipal() instanceof CurrentUser) {
            CurrentUser principal = (CurrentUser) authentication.getPrincipal();
            map.addAttribute("currentUser", principal.getUser());
        }
        return "moviegridfw";
    }

    @GetMapping("/moviesingle")
    public String singleMovie(@RequestParam("movieId") int id, ModelMap map) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.getPrincipal() != null && authentication.getPrincipal() instanceof CurrentUser) {
            CurrentUser principal = (CurrentUser) authentication.getPrincipal();
            map.addAttribute("currentUser", principal.getUser());
        }
        Movie single = movieRepository.findOne(id);
        if (single != null) {
            map.addAttribute("singleMovie", single);
            map.addAttribute("commentsCount", commentRepository.findAllByMovieId(id).size());
            return "moviesingle";
        } else {
            map.addAttribute("message", "Movie Not Found");
            return "404";
        }
    }

    @GetMapping("/addFavorite")
    public String addFavoriteMovie(@RequestParam("userId") int userId, @RequestParam("movieId") int movieId) {
        User one = userRepository.findOne(userId);
        boolean contains = one.getMovies().contains(movieRepository.findById(movieId));
        if (!contains) {
            userRepository.addWish(userId, movieId);
            return "redirect:/userFavoriteMovies?userId=" + userId;
        } else {
            return "redirect:/moviesingle?movieId=" + movieId;
        }
    }

    @GetMapping("/searchMovie")
    public String searchMovie(ModelMap map, @RequestParam("filmName") String filmName) {
        Movie movie = movieRepository.findByTitle(filmName);
        if (movie != null) {
            return "redirect:/moviesingle?movieId=" + movie.getId();
        } else {
            List<Movie> movies = movieRepository.findAllByTitleContaining(filmName);
            if (movies.size() == 0) {
                return "redirect:/movies?errorMessage=No Film in this Name";
            } else {
                map.addAttribute("movies", movies);
                return "moviegridfw";
            }
        }
    }

    @GetMapping("/selectByGenre")
    public String selectMoviesByGenre(ModelMap map, @ModelAttribute("genreid") int genreId) {
        Genre genre = genreRepository.findOne(genreId);
        if (genre != null) {
            map.addAttribute("movies", movieRepository.findAllByMovieGenresIsContaining(genre));
            map.addAttribute("genres", genreRepository.findAll());
            return "moviegridfw";
        } else {
            map.addAttribute("message", "Genre Not Found");
            return "404";
        }
    }

    @GetMapping("/movieComment")
    public String movieCommentPage(@RequestParam("movieId") int id, ModelMap map) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.getPrincipal() != null && authentication.getPrincipal() instanceof CurrentUser) {
            CurrentUser principal = (CurrentUser) authentication.getPrincipal();
            map.addAttribute("currentUser", principal.getUser());
        }
        Movie single = movieRepository.findOne(id);
        if (single != null) {
            map.addAttribute("singleMovie", single);
            map.addAttribute("comments", commentRepository.findAllByMovieId(single.getId()));
            map.addAttribute("modelComment", new Comment());
            return "moveiCommentPage";
        } else {
            map.addAttribute("message", "Movie Not Found");
            return "404";
        }
    }

    @PostMapping("/addComment")
    public String addComment(@ModelAttribute("modelComment") Comment comment) {
        commentRepository.save(comment);
        return "redirect:/movieComment?movieId=" + comment.getMovie().getId();
    }

    @GetMapping("/getMovieComments")
    public String getMovieComments(ModelMap map, @RequestParam("movieId") int id) {
        map.addAttribute("comments", commentRepository.findAllByMovieId(id));
        return "getMovieComments";
    }

    @GetMapping("/movieActors")
    public String movieActors(ModelMap map, @RequestParam("movieId") int id) {
        map.addAttribute("singleMovie", movieRepository.findOne(id));
        return "movieActors";
    }


    @GetMapping("/page")
    public String getMovieByPagination(@Param("pageNumber") int pageNumber,ModelMap map) {

        return "redirect:/movies";
    }
}