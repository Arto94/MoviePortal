package com.movieportal.movieportal.controller;


import com.movieportal.movieportal.model.Movie;
import com.movieportal.movieportal.model.User;
import com.movieportal.movieportal.repository.MovieRepository;
import com.movieportal.movieportal.security.CurrentUser;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Controller
public class MainController {

    @Autowired
    private MovieRepository movieRepository;

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String mainPage(ModelMap map, @RequestParam(value = "message", required = false) String message) {

        List<Movie> movies = movieRepository.findAll();
        if(movies.size()<5){
            map.addAttribute("movies",movies);
        }else {
            Random random = new Random();
            int index = random.nextInt(movies.size()-1);

            List<Movie> selectMovies = new ArrayList<>();
            for (int i = 0; i < 5;index++, i++) {
                selectMovies.add(movies.get(index));
                if(index == movies.size()-1) {
                    index = 0;
                }
            }
            map.addAttribute("movies", selectMovies);

        }



        map.addAttribute("user", new User());
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.getPrincipal() != null && authentication.getPrincipal() instanceof CurrentUser) {
            CurrentUser principal = (CurrentUser) authentication.getPrincipal();
            map.addAttribute("currentUser", principal.getUser());
        }
        map.addAttribute("message", message!= null ? message : "");
        return "index";
    }

    @RequestMapping(value = "/image", method = RequestMethod.GET)
    public void getImageAsByteArray(HttpServletResponse response, @RequestParam("fileName") String fileName) throws IOException {
        InputStream in = new FileInputStream("C:\\Users\\XTreme.ws\\Desktop\\mvc\\" + fileName);
        response.setContentType(MediaType.ALL_VALUE);
        IOUtils.copy(in, response.getOutputStream());
    }

    @GetMapping(value = "/")
    public String redirectHome() {
        return "redirect:/home";
    }

}


