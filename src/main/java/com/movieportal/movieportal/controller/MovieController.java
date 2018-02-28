package com.movieportal.movieportal.controller;


import com.movieportal.movieportal.model.Movie;
import com.movieportal.movieportal.repository.*;
import com.movieportal.movieportal.security.CurrentUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
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

    @GetMapping("/movies")
    public String allMovies(ModelMap map, @RequestParam(value = "errorMessage", required = false) String errorMessage) {
        map.addAttribute("movies", movieRepository.findAll());
        map.addAttribute("errorMessage", errorMessage!=null ? errorMessage : "");
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

    @GetMapping("/deleteCompany")
    public String deleteCompany(@RequestParam("companyId") int id) {
        companyRepository.delete(companyRepository.findOne(id));
        return "redirect:/basicTables";
    }

    @GetMapping("/deleteDirector")
    public String deleteDirector(@RequestParam("directorId") int id) {
        directorRepository.delete(directorRepository.findOne(id));
        return "redirect:/basicTables";
    }

    @GetMapping("/deleteGenre")
    public String deleteGenre(@RequestParam("genreId") int id) {
        genreRepository.delete(genreRepository.findOne(id));
        return "redirect:/basicTables";
    }

    @GetMapping("/deleteMovie")
    public String deleteMovie(@RequestParam("movieId") int id) {
        movieRepository.delete(movieRepository.findOne(id));
        return "redirect:/basicTables";
    }

    @GetMapping("/searchMovie")
    public String searchMovie(ModelMap map,@RequestParam("filmName") String filmName) {
        Movie movie = movieRepository.findByTitle(filmName);
        if (movie != null) {
            return "redirect:/moviesingle?movieId=" + movie.getId();
        } else {
            List<Movie> movies = movieRepository.findAllByTitleContaining(filmName);
            if(movies.size()==0){
                return "redirect:/movies?errorMessage=No Film in this Name";
            }else {
                map.addAttribute("movies", movies);
                return "moviegridfw";
            }
        }
    }
}
