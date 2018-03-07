package com.movieportal.movieportal.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

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
    @NotEmpty(message = "name is empty")
    private String name;

    @Column
    @NotEmpty(message = "surname is empty")
    private String surname;

    @Column
//    @Email(message = "email is not valid")
    @NotEmpty(message = "email is empty")
    private String email;

    @Column
    @NotEmpty(message = "password is empty")
    private String password;

    @Column(name = "pic_url")
    private String picUrl;

    @Column(name = "created_date")
    private String createDate;


    @Enumerated(value = EnumType.STRING)
    @Column(name = "user_type")
    private UserType userType;

    @Column
    private boolean verify;

    @ManyToMany(cascade = CascadeType.MERGE)
    @JoinTable(
            name = "wish",
            joinColumns = {@JoinColumn(name = "user_id")},
            inverseJoinColumns = {@JoinColumn(name = "movie_id")})
    List<Movie> movies = new LinkedList<>();

}