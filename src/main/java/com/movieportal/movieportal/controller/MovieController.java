package com.movieportal.movieportal.controller;


import com.movieportal.movieportal.model.*;
import com.movieportal.movieportal.repository.*;
import com.movieportal.movieportal.security.CurrentUser;
import javafx.scene.input.InputMethodTextRun;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.social.facebook.api.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.awt.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Controller
public class MovieController {

    @Autowired
    private MovieRepository movieRepository;

    @Autowired
    private CommentRepository commentRepository;
    @Autowired
    private UserRepository userRepository;

    @Autowired
    CompanyRepository companyRepository;

    @Autowired
    private GenreRepository genreRepository;

    @Autowired
    private BadWordRepository badWordRepository;

    @GetMapping("/movies")
    public String allMovies(ModelMap map, @RequestParam(value = "errorMessage", required = false) String errorMessage,
                            @RequestParam(value = "n", required = false) String number,
                            @RequestParam(value = "page", required = false) Integer p) {

        if (p == null) {
            p = 0;
        }
        org.springframework.data.domain.Page<Movie> page = movieRepository.findAllBy(new PageRequest(p, 4));
        List<Movie> movies = page.getContent();
        int pageCount = (int) movieRepository.count() / 4;
        List<Integer> pageCounts = new ArrayList<>();
        for (int i = 0; i < pageCount; i++) {
            pageCounts.add(i);
        }
        map.addAttribute("moviesCount",movieRepository.count());
        map.addAttribute("index", p);
        map.addAttribute("pagesCount", pageCounts);
        map.addAttribute("movies", movies);
        map.addAttribute("errorMessage", errorMessage != null ? errorMessage : "");
        map.addAttribute("genres", genreRepository.findAll());
        map.addAttribute("genre", new Genre());
        map.addAttribute("user", new User());
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.getPrincipal() != null && authentication.getPrincipal() instanceof CurrentUser) {
            CurrentUser principal = (CurrentUser) authentication.getPrincipal();
            map.addAttribute("currentUser", principal.getUser());
        }
        if (number != null) {
            return "moviegrid";
        }
        for (Movie movie : movies) {
            movie.setDescription(movie.getDescription().substring(0, 150) + "...");
        }
        return "moviegridfw";
    }


    @GetMapping("/sortMovie")
    public String sortMovie(ModelMap map,@RequestParam("sort") int number,@RequestParam(value = "n", required = false) String page) {
        List<Movie> movies = new ArrayList<>();
        if(number==1) {
            movies = movieRepository.findAllByOrderByYearDesc();
        }else if(number == 2) {
            movies = movieRepository.findAllByOrderByImdbRateDesc();
        }else {
            return "redirect:/movies";
        }
        int pageCount = (int) movieRepository.count() / 4;
        List<Integer> pageCounts = new ArrayList<>();
        for (int i = 0; i < pageCount; i++) {
            pageCounts.add(i);
        }
        map.addAttribute("moviesCount",movieRepository.count());
        map.addAttribute("genres", genreRepository.findAll());
        map.addAttribute("genre", new Genre());
        map.addAttribute("user", new User());
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.getPrincipal() != null && authentication.getPrincipal() instanceof CurrentUser) {
            CurrentUser principal = (CurrentUser) authentication.getPrincipal();
            map.addAttribute("currentUser", principal.getUser());
        }
        map.addAttribute("movies", movies);
        if(page != null) {
            return "moviegrid";
        }
        for (Movie movie : movies) {
            movie.setDescription(movie.getDescription().substring(0, 150) + "...");
        }
        return "moviegridfw";
    }

    @GetMapping("/moviesingle")
    public String singleMovie(@RequestParam("movieId") int id, ModelMap map) {
        Movie single = movieRepository.findOne(id);
        if (single != null) {
            map.addAttribute("singleMovie", single);
            map.addAttribute("user", new User());
            map.addAttribute("commentsCount", commentRepository.findAllByMovieId(id).size());
            boolean isUserAddFavorite = false;
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            if (authentication != null && authentication.getPrincipal() != null && authentication.getPrincipal() instanceof CurrentUser) {
                CurrentUser principal = (CurrentUser) authentication.getPrincipal();
                List<Movie> allByUsersIsContaining = movieRepository.findAllByUsersIsContaining(principal.getUser());
                if (!allByUsersIsContaining.contains(movieRepository.findOne(id))) {
                    isUserAddFavorite = true;
                }
                map.addAttribute("isUserAddFavorite", isUserAddFavorite);
                map.addAttribute("currentUser", principal.getUser());
            }
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
    public String searchMovie(ModelMap map, @RequestParam(value = "filmName", required = false) String filmName,
                              @RequestParam(value = "genreName", required = false) String genreName,
                              @RequestParam(value = "year", required = false) String year,
                              @RequestParam(value = "n", required = false) int number) {
        List<Movie> movies = null;
        if (!filmName.equals("") && !genreName.equals("") && !year.equals("")) {
            Genre genre = genreRepository.findOneByName(genreName);
            movies = movieRepository.findByTitleLikeAndMovieGenresAndYear(filmName + "%", genre, Integer.parseInt(year));
        } else if (!filmName.equals("") && !year.equals("")) {
            movies = movieRepository.findByYearAndTitleLike(Integer.parseInt(year), filmName + "%");
        } else if (!genreName.equals("") && !year.equals("")) {
            Genre genre = genreRepository.findOneByName(genreName);
            movies = movieRepository.findByMovieGenresAndYear(genre, Integer.parseInt(year));
        } else if (!filmName.equals("") && !genreName.equals("")) {
            Genre genre = genreRepository.findOneByName(genreName);
            movies = movieRepository.findByMovieGenresAndTitleLike(genre, filmName + "%");
        } else if (!filmName.equals("")) {
            movies = movieRepository.findAllByTitleLike(filmName + "%");
        } else if (!genreName.equals("")) {
            Genre genre = genreRepository.findOneByName(genreName);
            movies = movieRepository.findAllByMovieGenresIsContaining(genre);
        } else {
            movies = movieRepository.findAllByYear(Integer.parseInt(year));
        }
        for (Movie movie : movies) {
            movie.setDescription(movie.getDescription().substring(0, 150) + "...");
        }
        map.addAttribute("movies", movies);
        map.addAttribute("moviesCount",movies.size());
        map.addAttribute("genres", genreRepository.findAll());
        map.addAttribute("genre", new Genre());
        map.addAttribute("user", new User());
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.getPrincipal() != null && authentication.getPrincipal() instanceof CurrentUser) {
            CurrentUser principal = (CurrentUser) authentication.getPrincipal();
            map.addAttribute("currentUser", principal.getUser());
        }
        if(number == 1) {
            return "moviegrid";
        }else {
            return "moviegridfw";
        }
    }


    @GetMapping("/selectByGenre")
    public String selectMoviesByGenre(ModelMap map, @ModelAttribute("genreid") int genreId) {
        Genre genre = genreRepository.findOne(genreId);
        if (genre != null) {
            map.addAttribute("movies", movieRepository.findAllByMovieGenresIsContaining(genre));
            map.addAttribute("genres", genreRepository.findAll());
            map.addAttribute("user", new User());
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
            if (principal.getUser().getUserType() == UserType.ADMIN) {
                map.addAttribute("userType", true);
            } else {
                map.addAttribute("userType", false);
            }
        }
        Movie single = movieRepository.findOne(id);
        if (single != null) {
            map.addAttribute("singleMovie", single);
            map.addAttribute("comments", commentRepository.findAllByMovieId(single.getId()));
            map.addAttribute("modelComment", new Comment());
            map.addAttribute("user", new User());
            return "moveiCommentPage";
        } else {
            map.addAttribute("message", "Movie Not Found");
            return "404";
        }
    }

    @PostMapping("/addComment")
    public String addComment(@ModelAttribute("modelComment") Comment comment) {
        String message = comment.getMessage();
        List<BadWord> badWords = badWordRepository.findAll();
        StringBuilder sb = new StringBuilder();
        for (BadWord badWord : badWords) {
            for (int i = 0; i < badWord.getWord().length(); i++) {
                sb.append("*");
            }
            if (message.contains(badWord.getWord())) {
                message = message.replaceAll(badWord.getWord(), sb.toString());
                comment.setMessage(message);
            }
            sb = new StringBuilder();
        }
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
        map.addAttribute("user", new User());
        return "movieActors";
    }

    @GetMapping("/searchMovieByYear")
    public String getMoviesByYear(ModelMap map, @RequestParam("year") String year) {
        map.addAttribute("genres", genreRepository.findAll());
        map.addAttribute("genre", new Genre());
        map.addAttribute("user", new User());
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.getPrincipal() != null && authentication.getPrincipal() instanceof CurrentUser) {
            CurrentUser principal = (CurrentUser) authentication.getPrincipal();
            map.addAttribute("currentUser", principal.getUser());
        }
        try {
            int movieYear = Integer.parseInt(year);
            map.addAttribute("movies", movieRepository.findAllByYear(movieYear));
            return "moviegridfw";
        } catch (NumberFormatException e) {
            return "moviegridfw";
        }
    }
}