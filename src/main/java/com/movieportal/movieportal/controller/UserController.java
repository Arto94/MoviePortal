package com.movieportal.movieportal.controller;


import com.movieportal.movieportal.model.Actor;
import com.movieportal.movieportal.model.Movie;
import com.movieportal.movieportal.model.User;
import com.movieportal.movieportal.model.UserType;
import com.movieportal.movieportal.repository.*;
import com.movieportal.movieportal.security.CurrentUser;
import com.movieportal.movieportal.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;


@Controller
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserUtil userUtil;
    @Autowired
    private MovieRepository movieRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private ActorRepository actorRepository;

    @Value("${movieportal.product.upload.path}")
    private String imageUploadPath;

    @RequestMapping(value = "/user", method = RequestMethod.GET)
    public String adminPage(ModelMap map) {
        map.addAttribute("newUser", new User());
        CurrentUser currentUser = (CurrentUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        map.addAttribute("user", currentUser.getUser());
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.getPrincipal() != null && authentication.getPrincipal() instanceof CurrentUser) {
            CurrentUser principal = (CurrentUser) authentication.getPrincipal();
            map.addAttribute("currentUser", principal.getUser());
        }
        return "userprofile";
    }

    @GetMapping(value = "/Profile")
    public String userPage(@RequestParam("userId") int id) {
        User user = userRepository.findOne(id);
        if (user.getUserType() == UserType.ADMIN) {
            return "redirect:/admin";
        }
        return "redirect:/user";
    }



    @PostMapping("/changeUserDetails")
    public String changeUserDetails(@ModelAttribute("user") User user) throws IOException {
        User principal = userUtil.getPrincipal();
        if (!user.getName().equals("")) {
            principal.setName(user.getName());
        }
        if (!user.getSurname().equals("")) {
            principal.setSurname(user.getSurname());
        }

        userRepository.save(principal);
        return "redirect:/user";
    }

    @PostMapping("/changeUserPassword")
    public String changeUserPassword(@RequestParam("newPassword") String newPassword,
                                     @RequestParam("confirmPassword") String confirmPassword){
        User principal = userUtil.getPrincipal();
        if(newPassword.equals(confirmPassword)) {
            principal.setPassword(newPassword);
            principal.setPassword(passwordEncoder.encode(principal.getPassword()));
            userRepository.save(principal);
        }
        return "redirect:/user";
    }

    @GetMapping("/userFavoriteMovies")
    public String userFavoriteMovies(ModelMap map, @RequestParam("userId") int userId,
                                     @RequestParam(value = "n",required = false) String page) {
        User user = userRepository.findOne(userId);
        List<Movie> movies = user.getMovies();
        for (Movie movie : movies) {
            movie.setDescription(movie.getDescription().substring(0,150));
        }
        map.addAttribute("favoriteMovies",movies );
        map.addAttribute("user", user);
        if(page!=null) {
            return "userfavoritegrid";
        }
        return "userfavoritemovie";
    }

    private Movie getRandomMovie() {
        Random random = new Random();
        int count = (int) movieRepository.count();
        int movieId = random.nextInt(count);
        List<Movie> movies = movieRepository.findAll();
        Movie movie = movies.subList(movieId, movieId + 1).get(0);
        return movie;
    }

    @GetMapping("/kinoman")
    public String kinoman(ModelMap map,@RequestParam(value = "answer", required = false) Integer answer)  {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.getPrincipal() != null && authentication.getPrincipal() instanceof CurrentUser) {
            CurrentUser principal = (CurrentUser) authentication.getPrincipal();
            map.addAttribute("currentUser", principal.getUser());
        } else {
            return "redirect:/home";
        }
        map.addAttribute("user", new User());

        Movie movie = getRandomMovie();
        map.addAttribute("movie", movie);

        List<Actor> finalActorList = getRandomActors(movie);
        if(answer==null) {
            answer = 0;
        }
        map.addAttribute("answer",answer);

        map.addAttribute("actors", finalActorList);
        return "kinoman";
    }

    private List<Actor> getRandomActors(Movie movie) {

        Random random = new Random();

        List<Actor> actors = actorRepository.findAll();
        Actor movieActor = movie.getMovieActors().get(random.nextInt(movie.getMovieActors().size()));

        List<Actor> finalActorList = new ArrayList<>();
        finalActorList.add(movieActor);

        for (Actor removeActor : movie.getMovieActors()) {
            actors.remove(removeActor);
        }

        int index = random.nextInt(actors.size());
        if (index > actors.size() - 3) {
            index = actors.size() - 3;
        }
        finalActorList.add(actors.get(index));
        finalActorList.add(actors.get(index + 1));
        finalActorList = userUtil.mix(finalActorList);
        return finalActorList;
    }

    @PostMapping("/answerKinoman")
    public String answer(ModelMap map, @RequestParam("name") String name, @RequestParam("surname") String surname,
                         @RequestParam("movieId") int id) {
        Movie movie = movieRepository.findOne(id);
        List<Actor> movieActors = movie.getMovieActors();
        boolean answer = false;
        for (Actor movieActor : movieActors) {
            if (movieActor.getName().equals(name) && movieActor.getSurname().equals(surname)) {
                answer = true;
            }
        }
        int yourAnswer = 2;
        if (answer) {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            CurrentUser principal = (CurrentUser) authentication.getPrincipal();
            principal.getUser().setAnswerCount(principal.getUser().getAnswerCount() + 1);
            userRepository.save(principal.getUser());
            yourAnswer = 1;
        }
        return "redirect:/kinoman?answer="+yourAnswer;
    }
}
