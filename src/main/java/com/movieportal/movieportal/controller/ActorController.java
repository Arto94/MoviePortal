package com.movieportal.movieportal.controller;

import com.movieportal.movieportal.model.Actor;
import com.movieportal.movieportal.model.Movie;
import com.movieportal.movieportal.repository.ActorRepository;
import com.movieportal.movieportal.repository.MovieRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class ActorController {
    @Autowired
    private ActorRepository actorRepository;
    @Autowired
    private MovieRepository movieRepository;

    @GetMapping("/actors")
    public String getActors(ModelMap map) {
        map.addAttribute("actors", actorRepository.findAll());
        return "actors";
    }

    @GetMapping("/singleActor")
    public String singleActor(@RequestParam("actorId") int id, ModelMap map) {
        Actor actor = actorRepository.findOne(id);
        List<Movie> movies = movieRepository.findAllByMovieActorsContaining(actor);
        map.addAttribute("actor", actor);
        map.addAttribute("movies", movies);
        return "singleactor";
    }

    @GetMapping("/deleteActor")
    public String removeActor(@RequestParam("actorId") int id) {
        actorRepository.delete(actorRepository.findOne(id));
        return "redirect:/basicTables";
    }

}
