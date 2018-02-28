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
    public String getActors(ModelMap map,@RequestParam(value = "errorMessage", required = false) String errorMessage) {
        map.addAttribute("actors", actorRepository.findAll());
        map.addAttribute("errorMessage", errorMessage!=null? errorMessage : "");
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

    @GetMapping("/searchActor")
    public String searchMovie(ModelMap map,@RequestParam("actorName") String actorName) {
        List<Actor> actors = actorRepository.findAllByName(actorName);
        if (actors.size()==1) {
            return "redirect:/singleActor?actorId=" + actors.get(0).getId();
        }else if(actors.size()>1) {
            map.addAttribute("actors",actors);
            return "actors";
        } else {
            List<Actor> actorsContains = actorRepository.findAllByNameContaining(actorName);
            if(actorsContains.size()==0){
                return "redirect:/actors?errorMessage=No Actor in this Name";
            }else {
                map.addAttribute("actors", actorsContains);
                return "actors";
            }
        }
    }
}
