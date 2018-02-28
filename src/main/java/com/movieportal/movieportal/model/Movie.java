package com.movieportal.movieportal.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.LinkedList;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "movie")
@Entity
public class Movie {

    @Id
    @GeneratedValue
    private int id;

    @Column
    private String title;

    @Column
    private String description;

    @Column
    private int year;

    @Column(name = "create_date")
    private String createDate;

    @Column
    private String country;

    @Column
    private String budget;

    @Column(name = "movie_time")
    private String movieTime;

    @Column
    private String picture;

    @ManyToOne
    private Company company;

    @Column(name = "movie_trailer")
    private String movieTrailer;

    @ManyToMany(cascade = CascadeType.MERGE)
    @JoinTable(
            name = "movie_genre",
            joinColumns = {@JoinColumn(name = "movie_id")},
            inverseJoinColumns = {@JoinColumn(name = "genre_id")})
    List<Genre> movieGenres = new LinkedList<>();

    @ManyToMany(cascade = CascadeType.MERGE)
    @JoinTable(
            name = "actor_movie",
            joinColumns = {@JoinColumn(name = "movie_id")},
            inverseJoinColumns = {@JoinColumn(name = "actor_id")})
    List<Actor> movieActors = new LinkedList<>();

    @ManyToMany(cascade = CascadeType.MERGE)
    @JoinTable(
            name = "director_movie",
            joinColumns = {@JoinColumn(name = "movie_id")},
            inverseJoinColumns = {@JoinColumn(name = "director_id")})
    List<Director> movieDirectors = new LinkedList<>();
}
