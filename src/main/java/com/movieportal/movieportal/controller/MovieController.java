package com.movieportal.movieportal.controller;


import com.movieportal.movieportal.model.Genre;
import com.movieportal.movieportal.model.Movie;
import com.movieportal.movieportal.model.User;
import com.movieportal.movieportal.repository.*;
import com.movieportal.movieportal.security.CurrentUser;
import com.movieportal.movieportal.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class MovieController {

    @Autowired
    private MovieRepository movieRepository;
    @Autowired
    private UserRepository userRepository;

    @Autowired
    CompanyRepository companyRepository;
    @Autowired
    private DirectorRepository directorRepository;
    @Autowired
    private GenreRepository genreRepository;
    @Autowired
    private UserUtil userUtil;

    @GetMapping("/movies")
    public String allMovies(ModelMap map, @RequestParam(value = "errorMessage", required = false) String errorMessage) {
        map.addAttribute("movies", movieRepository.findAll());
        map.addAttribute("errorMessage", errorMessage != null ? errorMessage : "");
        map.addAttribute("genres",genreRepository.findAll());
        map.addAttribute("genre",new Genre());
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
        map.addAttribute("singleMovie", single);
        return "moviesingle";
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
    public String selectMoviesByGenre(ModelMap map,@ModelAttribute("genreid") int genreId) {
        Genre one = genreRepository.findOne(genreId);
        map.addAttribute("movies",movieRepository.findAllByMovieGenresIsContaining(one));
        map.addAttribute("genres",genreRepository.findAll());
        return "moviegridfw";

    }
}
