package com.movieportal.movieportal.controller;


import com.movieportal.movieportal.model.*;
import com.movieportal.movieportal.repository.*;
import com.movieportal.movieportal.security.CurrentUser;
import com.movieportal.movieportal.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

@Controller
public class AdminController {

    @Autowired
    private ActorRepository actorRepository;

    @Autowired
    private CompanyRepository companyRepository;

    @Autowired
    private DirectorRepository directorRepository;

    @Autowired
    private GenreRepository genreRepository;

    @Autowired
    private MovieRepository movieRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserUtil userUtil;

    @RequestMapping(value = "/admin/basicFormElements", method = RequestMethod.GET)
    public String basicForms(ModelMap map, @RequestParam(value = "actorMessage", required = false) String actorMessage, @RequestParam(value = "genreMessage", required = false) String genreMessage,
                             @RequestParam(value = "companyMessage", required = false) String companyMessage, @RequestParam(value = "directorMessage", required = false) String directorMessage,
                             @RequestParam(value = "movieMessage", required = false) String movieMessage) {
        map.addAttribute("actor", new Actor());
        map.addAttribute("company", new Company());
        map.addAttribute("director", new Director());
        map.addAttribute("genre", new Genre());
        map.addAttribute("movie", new Movie());
        map.addAttribute("genres", genreRepository.findAll());
        map.addAttribute("actors", actorRepository.findAll());
        map.addAttribute("directors", directorRepository.findAll());
        map.addAttribute("companies", companyRepository.findAll());
        map.addAttribute("admin", userUtil.getPrincipal());
        map.addAttribute("actorMessage", actorMessage != null ? actorMessage : "");
        map.addAttribute("genreMessage", genreMessage != null ? genreMessage : "");
        map.addAttribute("companyMessage", companyMessage != null ? companyMessage : "");
        map.addAttribute("directorMessage", directorMessage != null ? directorMessage : "");
        map.addAttribute("movieMessage", movieMessage != null ? movieMessage : "");
        return "basic-form-elements";
    }

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String adminPage(ModelMap map) {
        map.addAttribute("movieCount", movieRepository.findAll().size());
        map.addAttribute("userCount", userRepository.findAll().size());
        map.addAttribute("actorCount", actorRepository.findAll().size());
        map.addAttribute("directorCount", directorRepository.findAll().size());
        map.addAttribute("genreCount", genreRepository.findAll().size());
        map.addAttribute("companyCount", companyRepository.findAll().size());
        map.addAttribute("user", userUtil.getPrincipal());
        return "admin";
    }

    @PostMapping(value = "/admin/addActor")
    public String addActor(@Valid @ModelAttribute("actor") Actor actor, BindingResult result, @RequestParam("actorImage") MultipartFile multipartFile) throws IOException {
        StringBuilder sb = new StringBuilder();
        if (result.hasErrors()) {
            for (ObjectError objectError : result.getAllErrors()) {
                sb.append(objectError.getDefaultMessage() + "<br>");
            }
            return "redirect:/admin/basicFormElements?actorMessage=" + sb.toString();
        }
        String picName = System.currentTimeMillis() + "_" + multipartFile.getOriginalFilename();
        File file = new File("C:\\Users\\XTreme.ws\\Desktop\\mvc\\" + picName);
        multipartFile.transferTo(file);
        actor.setPic(picName);
        actorRepository.save(actor);
        return "redirect:/admin/basicFormElements";
    }

    @PostMapping(value = "/admin/addDirector")
    public String addDirector(@Valid @ModelAttribute("director") Director director, BindingResult result) {
        StringBuilder sb = new StringBuilder();
        if (result.hasErrors()) {
            for (ObjectError objectError : result.getAllErrors()) {
                sb.append(objectError.getDefaultMessage() + "<br>");
            }
            return "redirect:/admin/basicFormElements?directorMessage=" + sb.toString();
        }
        directorRepository.save(director);
        return "redirect:/admin/basicFormElements";
    }

    @PostMapping(value = "/admin/addGenre")
    public String addGenre(@Valid @ModelAttribute("genre") Genre genre, BindingResult result) {
        StringBuilder sb = new StringBuilder();
        if (result.hasErrors()) {
            for (ObjectError objectError : result.getAllErrors()) {
                sb.append(objectError.getDefaultMessage() + "<br>");
            }
            return "redirect:/admin/basicFormElements?genreMessage=" + sb.toString();
        }
        if (genreRepository.findOneByName(genre.getName()) == null) {
            genreRepository.save(genre);
        }
        return "redirect:/admin/basicFormElements";
    }

    @PostMapping(value = "/admin/addCompany")
    public String addCompany(@Valid @ModelAttribute("company") Company company, BindingResult result) throws IOException {
        int size = 0;
        StringBuilder sb = new StringBuilder();
        if (result.hasErrors()) {
            for (ObjectError objectError : result.getAllErrors()) {
                if (size > 0) {
                    sb.append(objectError.getDefaultMessage() + "<br>");
                }
                size++;
            }
            return "redirect:/admin/basicFormElements?companyMessage=" + sb.toString();
        }
        companyRepository.save(company);
        return "redirect:/admin/basicFormElements";
    }

    @PostMapping(value = "/admin/addMovie")
    public String addMovie(@Valid @ModelAttribute("movie") Movie movie, BindingResult result, @RequestParam("picture") MultipartFile multipartFile, @RequestParam("movieGenres") String movieGenres, @RequestParam("movieActors") String movieActors, @RequestParam("movieDirectors") String movieDirectors) throws IOException {
        int size = 0;
        StringBuilder sb = new StringBuilder();
        if (result.hasErrors()) {
            for (ObjectError objectError : result.getAllErrors()) {
                if (size > 0) {
                    sb.append(objectError.getDefaultMessage() + "<br>");
                }
                size++;
            }
            return "redirect:/admin/basicFormElements?movieMessage=" + sb.toString();
        }
        String picName = System.currentTimeMillis() + "_" + multipartFile.getOriginalFilename();
        File file = new File("C:\\Users\\XTreme.ws\\Desktop\\mvc\\" + picName);
        multipartFile.transferTo(file);
        movie.setPicture(picName);
        String[] genres = movieGenres.split(",");
        List<Genre> genreList = new LinkedList<>();
        for (String genre : genres) {
            genreList.add(genreRepository.findOneByName(genre));
        }
        movie.setMovieGenres(genreList);
        String[] actors = movieActors.split(",");
        List<Actor> actorList = new LinkedList<>();
        for (String actor : actors) {
            actorList.add(actorRepository.findOneByName(actor));
        }
        movie.setMovieActors(actorList);
        String[] directors = movieDirectors.split(",");
        List<Director> directorList = new LinkedList<>();
        for (String director : directors) {
            directorList.add(directorRepository.findOneByName(director));
        }
        movie.setMovieDirectors(directorList);
        movieRepository.save(movie);
        return "redirect:/admin/basicFormElements";
    }

    @GetMapping("/basicTables")
    public String getAll(ModelMap map) {
        map.addAttribute("users", userRepository.findAll());
        map.addAttribute("actors", actorRepository.findAll());
        map.addAttribute("movies", movieRepository.findAll());
        map.addAttribute("genres", genreRepository.findAll());
        map.addAttribute("directos", directorRepository.findAll());
        map.addAttribute("companies", companyRepository.findAll());
        map.addAttribute("admin", userUtil.getPrincipal());
        return "tables";
    }

    @GetMapping("/admin/deleteCompany")
    public String deleteCompany(@RequestParam("companyId") int id) {
        companyRepository.delete(companyRepository.findOne(id));
        return "redirect:/basicTables";
    }

    @GetMapping("/admin/deleteDirector")
    public String deleteDirector(@RequestParam("directorId") int id) {
        directorRepository.delete(directorRepository.findOne(id));
        return "redirect:/basicTables";
    }

    @GetMapping("/admin/deleteGenre")
    public String deleteGenre(@RequestParam("genreId") int id) {
        genreRepository.delete(genreRepository.findOne(id));
        return "redirect:/basicTables";
    }

    @GetMapping("/admin/deleteMovie")
    public String deleteMovie(@RequestParam("movieId") int id) {
        movieRepository.delete(movieRepository.findOne(id));
        return "redirect:/basicTables";
    }
    @GetMapping("/admin/deleteActor")
    public String removeActor(@RequestParam("actorId") int id) {
        actorRepository.delete(actorRepository.findOne(id));
        return "redirect:/basicTables";
    }
}
