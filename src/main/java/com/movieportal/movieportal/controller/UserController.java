package com.movieportal.movieportal.controller;

import com.movieportal.movieportal.model.Movie;
import com.movieportal.movieportal.model.User;
import com.movieportal.movieportal.model.UserType;
import com.movieportal.movieportal.repository.*;
import com.movieportal.movieportal.security.CurrentUser;
import com.movieportal.movieportal.util.UserUtil;
import org.hibernate.validator.constraints.URL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.LinkedList;
import java.util.List;

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

    @RequestMapping(value = "/user", method = RequestMethod.GET)
    public String adminPage(ModelMap map) {
        map.addAttribute("user", userUtil.getPrincipal());
        map.addAttribute("newUser", new User());
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
    public String changeUserDetails(@ModelAttribute("user") User user) {
        User principal = userUtil.getPrincipal();
        if (!user.getPassword().equals("")) {
            principal.setPassword(passwordEncoder.encode(user.getPassword()));
        }

        if (!user.getEmail().equals("")) {
            principal.setEmail(user.getEmail());
        }
        if (!user.getName().equals("")) {
            principal.setName(user.getName());
        }
        if (!user.getSurname().equals("")) {
            principal.setSurname(user.getSurname());
        }
        userRepository.save(principal);
        return "redirect:/user";
    }

    @GetMapping("/userFavoriteMovies")
    public String userFavoriteMovies(ModelMap map, @RequestParam("userId") int userId) {
        User user = userRepository.findOne(userId);
        map.addAttribute("favoriteMovies", user.getMovies());
        map.addAttribute("user", user);
        return "userfavoritemovie";
    }

}
