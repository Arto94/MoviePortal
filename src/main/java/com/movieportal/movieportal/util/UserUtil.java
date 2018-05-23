package com.movieportal.movieportal.util;

import com.movieportal.movieportal.model.Actor;
import com.movieportal.movieportal.model.User;
import com.movieportal.movieportal.security.CurrentUser;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Component
public class UserUtil {

    public User getPrincipal() {
        CurrentUser currentUser = (CurrentUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (currentUser == null) {
            return null;
        }
        return currentUser.getUser();
    }

    public List<Actor> mix(List<Actor> actors) {
        Random random = new Random();
        List<Actor> actorList = new ArrayList<>();
        int mix = 1 + random.nextInt(3);
        switch (mix) {
            case 1:
                actorList.add(actors.get(0));
                actorList.add(actors.get(1));
                actorList.add(actors.get(2));
                break;
            case 2:
                actorList.add(actors.get(0));
                actorList.add(actors.get(2));
                actorList.add(actors.get(1));
                break;
            case 3:
                actorList.add(actors.get(1));
                actorList.add(actors.get(0));
                actorList.add(actors.get(2));
                break;
            case 4:
                actorList.add(actors.get(1));
                actorList.add(actors.get(2));
                actorList.add(actors.get(0));
                break;
            case 5:
                actorList.add(actors.get(2));
                actorList.add(actors.get(0));
                actorList.add(actors.get(1));
                break;
            case 6:
                actorList.add(actors.get(2));
                actorList.add(actors.get(1));
                actorList.add(actors.get(0));
                break;
            default:
                actorList.add(actors.get(0));
                actorList.add(actors.get(1));
                actorList.add(actors.get(2));
        }
        return actorList;
    }
}
