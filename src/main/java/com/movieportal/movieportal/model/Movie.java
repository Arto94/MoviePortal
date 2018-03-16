package com.movieportal.movieportal.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.NotEmpty;

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
    @NotEmpty(message = "title is empty")
    private String title;

    @Column
    @NotEmpty(message = "description is empty")
    private String description;

    @Column
    private int year;

    @Column
    @NotEmpty(message = "country is empty")
    private String country;

    @Column(name = "movie_time")
    @NotEmpty(message = "movie time is empty")
    private String movieTime;

    @Column
    private String picture;

    @Column(name = "imdb_rate")
    private String imdbRate;

    @Column(name = "movie_trailer")
    private String movieTrailer;

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(
            name = "movie_genre",
            joinColumns = {@JoinColumn(name = "movie_id")},
            inverseJoinColumns = {@JoinColumn(name = "genre_id")})
    List<Genre> movieGenres = new LinkedList<>();

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(
            name = "actor_movie",
            joinColumns = {@JoinColumn(name = "movie_id")},
            inverseJoinColumns = {@JoinColumn(name = "actor_id")})
    List<Actor> movieActors = new LinkedList<>();

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(
            name = "director_movie",
            joinColumns = {@JoinColumn(name = "movie_id")},
            inverseJoinColumns = {@JoinColumn(name = "director_id")})
    List<Director> movieDirectors = new LinkedList<>();

    @ManyToMany(mappedBy = "movies")
    private List<User> users;

    @Override
    public String toString() {
        return "Movie{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", year=" + year +
                ", country='" + country + '\'' +
                ", movieTime='" + movieTime + '\'' +
                ", picture='" + picture + '\'' +
                ", movieTrailer='" + movieTrailer + '\'' +
                ", movieGenres=" + movieGenres +
                ", movieActors=" + movieActors +
                ", movieDirectors=" + movieDirectors +
                '}';
    }
}
