package com.movieportal.movieportal.util;

import com.movieportal.movieportal.model.User;
import com.movieportal.movieportal.security.CurrentUser;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

@Component
public class UserUtil {

    public User getPrincipal() {
        CurrentUser currentUser = (CurrentUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (currentUser == null) {
            return null;
        }
        return currentUser.getUser();
    }
}
