package com.movieportal.movieportal.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.LinkedList;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "user")
@Entity
public class User {

    @Id
    @GeneratedValue
    private int id;

    @Column
    private String name;

    @Column
    private String surname;

    @Column
    private String email;

    @Column
    private String password;

    @Column(name = "pic_url")
    private String picUrl;

    @Column(name = "created_date")
    private String createDate;

    @Enumerated(value = EnumType.STRING)
    @Column(name = "user_type")
    private UserType userType;

    @ManyToMany(cascade = CascadeType.MERGE)
    @JoinTable(
            name = "wish",
            joinColumns = {@JoinColumn(name = "user_id")},
            inverseJoinColumns = {@JoinColumn(name = "movie_id")})
    List<Movie> movies = new LinkedList<>();
}