package com.movieportal.movieportal.controller;


import com.movieportal.movieportal.model.Blog;
import com.movieportal.movieportal.model.Movie;
import com.movieportal.movieportal.model.User;
import com.movieportal.movieportal.repository.ActorRepository;
import com.movieportal.movieportal.repository.BlogRepository;
import com.movieportal.movieportal.repository.MovieRepository;
import com.movieportal.movieportal.repository.UserRepository;
import com.movieportal.movieportal.security.CurrentUser;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.PageRequest;
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
import java.util.List;
import java.util.Random;


@Controller
public class MainController {

    @Autowired
    private MovieRepository movieRepository;

    @Value("${movieportal.product.upload.path}")
    private String imageUploadPath;

    @Autowired
    private ActorRepository actorRepository;

    @Autowired
    private BlogRepository blogRepository;

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String mainPage(ModelMap map, @RequestParam(value = "message", required = false) String message) {
        List<Movie> movies = movieRepository.findAll();
        Random random = new Random();
        int number = random.nextInt((int)movieRepository.count()/4);
        map.addAttribute("movies", movieRepository.findAllBy(new PageRequest(number,4)).getContent());
        map.addAttribute("user", new User());

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.getPrincipal() != null && authentication.getPrincipal() instanceof CurrentUser) {
            CurrentUser principal = (CurrentUser) authentication.getPrincipal();
            map.addAttribute("currentUser", principal.getUser());
        }
        map.addAttribute("message", message != null ? message : "");
        int actorPageNumber = random.nextInt((int)actorRepository.count()/4);
        map.addAttribute("actors",actorRepository.findAll(new PageRequest(actorPageNumber,4)).getContent());
        map.addAttribute("blog",blogRepository.findAll(new PageRequest(0,1)).getContent().get(0));
        map.addAttribute("ratedMovies", movieRepository.findAllByOrderByImdbRateDesc
                (new PageRequest(0,4)).getContent());
        return "index";
    }

    @RequestMapping(value = "/image", method = RequestMethod.GET)
    public void getImageAsByteArray(HttpServletResponse response, @RequestParam("fileName") String fileName) throws IOException {
        InputStream in = new FileInputStream(imageUploadPath + fileName);
        response.setContentType(MediaType.ALL_VALUE);
        IOUtils.copy(in, response.getOutputStream());
    }

    @GetMapping(value = "/")
    public String redirectHome() {
        return "redirect:/home";
    }

    @GetMapping("/404")
    public String Page404(ModelMap map) {
        map.addAttribute("message", "Page Not Found");
        return "404";
    }

    @GetMapping("/403")
    public String Page403(ModelMap map) {
        map.addAttribute("message", "Acces Denied");
        return "403";
    }

    @GetMapping("/402")
    public String Page402(ModelMap map) {
        map.addAttribute("message", "No Account in this email if you register verify your account");
        return "404";

    }
}


