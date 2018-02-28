package com.movieportal.movieportal.controller;

import com.movieportal.movieportal.model.User;
import com.movieportal.movieportal.model.UserType;
import com.movieportal.movieportal.repository.UserRepository;
import com.movieportal.movieportal.security.CurrentUser;
import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.security.authentication.jaas.SecurityContextLoginModule;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;

import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;


@Controller
public class LoginController {
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private UserRepository userRepository;

    @PostMapping(value = "/addUser")
    public String saveUser(@Valid @ModelAttribute("user") User user, BindingResult result, @RequestParam("picture") MultipartFile multipartFile) throws IOException {
        StringBuilder sb = new StringBuilder();
        if (result.hasErrors()) {
            for (ObjectError objectError : result.getAllErrors()) {
                sb.append(objectError.getDefaultMessage() + "<br>");
            }
            return "redirect:/home?message=" + sb.toString();
        }
        String picName = System.currentTimeMillis() + "_" + multipartFile.getOriginalFilename();
        File file = new File("C:\\Users\\XTreme.ws\\Desktop\\mvc\\" + picName);
        multipartFile.transferTo(file);
        user.setPicUrl(picName);
        user.setUserType(UserType.USER);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepository.save(user);
        return "redirect:/home";
    }

    @GetMapping(value = "/login")
    public String login() {
        return "redirect:/home";
    }

    @GetMapping(value = "/loginsucces")
    public String userOrAdminPage() {
        CurrentUser principal = (CurrentUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal.getRole() == UserType.ADMIN) {
            return "redirect:/admin";
        }
        return "redirect:/user";
    }
}
