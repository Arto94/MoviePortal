package com.movieportal.movieportal.controller;

import com.movieportal.movieportal.jwt.JwtTokenUtil;
import com.movieportal.movieportal.mail.EmailServiceImpl;
import com.movieportal.movieportal.model.User;
import com.movieportal.movieportal.model.UserType;
import com.movieportal.movieportal.repository.UserRepository;
import com.movieportal.movieportal.security.CurrentUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;


@Controller
public class LoginController {
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private UserRepository userRepository;


    @Autowired
    private EmailServiceImpl emailService;
    @Autowired
    private JwtTokenUtil jwtTokenUtil;

    @PostMapping(value = "/addUser")
    public String saveUser(@Valid @ModelAttribute("user") User user, BindingResult result, @RequestParam("picture") MultipartFile multipartFile) throws IOException {
        StringBuilder sb = new StringBuilder();
        if (result.hasErrors()) {
            for (ObjectError objectError : result.getAllErrors()) {
                sb.append(objectError.getDefaultMessage() + "<br>");
            }
            return "redirect:/home?message=" + sb.toString();
        }
        if (userRepository.findOneByEmail(user.getEmail()) == null) {
            if(user.getPassword().length()<=6){
                return "redirect:/home?message=password must be 6 symbols";
            }
            String picName = System.currentTimeMillis() + "_" + multipartFile.getOriginalFilename();
            File file = new File("C:\\Users\\XTreme.ws\\Desktop\\mvc\\" + picName);
            multipartFile.transferTo(file);
            user.setPicUrl(picName);
            user.setUserType(UserType.USER);
            user.setPassword(passwordEncoder.encode(user.getPassword()));
            user.setVerify(false);
            userRepository.save(user);
            String token = jwtTokenUtil.generateToken(new CurrentUser(user));
            String message = String.format("Hi %s, You are successfully registered to our cool portal. Please visit by  \"http://localhost:8088/verify?token=%s\" this link to verify your account", user.getName(), token);
            emailService.sendSimpleMessage(user.getEmail(), "Welcome", message);
            return "redirect:/home";
        } else {
            return "redirect:/home?message=" + user.getEmail() + " email is exists";
        }
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


    @GetMapping("/verify")
    public String verifyUser(@RequestParam("token") String token) {
        String email = jwtTokenUtil.getUsernameFromToken(token);
        User oneByEmail = userRepository.findOneByEmail(email);
        oneByEmail.setVerify(true);
        userRepository.save(oneByEmail);
        return "redirect:/home";
    }
}
