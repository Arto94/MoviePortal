package com.movieportal.movieportal.controller;

import com.movieportal.movieportal.model.*;
import com.movieportal.movieportal.repository.BlogCommentRepository;
import com.movieportal.movieportal.repository.BlogRepository;
import com.movieportal.movieportal.security.CurrentUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BlogController {

    @Autowired
    private BlogRepository blogRepository;

    @Autowired
    private BlogCommentRepository blogCommentRepository;

    @GetMapping("/blog")
    public String blog(ModelMap map) {
        map.addAttribute("blogs", blogRepository.findAll());
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.getPrincipal() != null && authentication.getPrincipal() instanceof CurrentUser) {
            CurrentUser principal = (CurrentUser) authentication.getPrincipal();
            map.addAttribute("currentUser", principal.getUser());
        }
        map.addAttribute("user", new User());
        return "bloglist";
    }

    @GetMapping("/blogDetail")
    public String blogDetail(ModelMap map, @RequestParam("id") int id) {
        Blog blog = blogRepository.findOne(id);
        if(blog != null) {
            map.addAttribute("blog", blog);
        }else {
            map.addAttribute("message", "Blog Not Found");
            return "404";
        }
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.getPrincipal() != null && authentication.getPrincipal() instanceof CurrentUser) {
            CurrentUser principal = (CurrentUser) authentication.getPrincipal();
            map.addAttribute("currentUser", principal.getUser());
            map.addAttribute("model", new BlogComment());
            if (principal.getUser().getUserType() == UserType.ADMIN) {
                map.addAttribute("userType", true);
            } else {
                map.addAttribute("userType", false);
            }
        }
        map.addAttribute("blogComments", blogCommentRepository.findAllByBlogId(id));
        map.addAttribute("user", new User());
        return "blogdetail";
    }

    @PostMapping("/addBlogComment")
    public String addComment(@ModelAttribute("model") BlogComment blogComment) {
        blogCommentRepository.save(blogComment);
        return "redirect:/blogDetail?id=" + blogComment.getBlog().getId();
    }

    @GetMapping("/getBlogComments")
    public String getMovieComments(ModelMap map, @RequestParam("blogId") int id) {
        map.addAttribute("blogComments", blogCommentRepository.findAllByBlogId(id));
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.getPrincipal() != null && authentication.getPrincipal() instanceof CurrentUser) {
            CurrentUser principal = (CurrentUser) authentication.getPrincipal();
            if (principal.getUser().getUserType() == UserType.ADMIN) {
                map.addAttribute("userType", true);
            } else {
                map.addAttribute("userType", false);
            }
        }
        return "getBlogComments";
    }
}