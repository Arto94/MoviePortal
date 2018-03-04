package com.movieportal.movieportal.controller;

import com.movieportal.movieportal.repository.BlogRepository;
import com.movieportal.movieportal.security.CurrentUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BlogController {

    @Autowired
    private BlogRepository blogRepository;

    @GetMapping("/blog")
    public String blog(ModelMap map) {
        map.addAttribute("blogs",blogRepository.findAll());
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.getPrincipal() != null && authentication.getPrincipal() instanceof CurrentUser) {
            CurrentUser principal = (CurrentUser) authentication.getPrincipal();
            map.addAttribute("currentUser", principal.getUser());
        }
        return "bloglist";
    }


    @GetMapping("/blogDetail")
    public String blogDetail(ModelMap map,@RequestParam("id") int id) {
        map.addAttribute("blog",blogRepository.findOne(id));
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.getPrincipal() != null && authentication.getPrincipal() instanceof CurrentUser) {
            CurrentUser principal = (CurrentUser) authentication.getPrincipal();
            map.addAttribute("currentUser", principal.getUser());
        }
        return "blogdetail";

    }
}
