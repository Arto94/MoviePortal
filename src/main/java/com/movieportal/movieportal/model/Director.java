package com.movieportal.movieportal.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;


@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "director")
@Entity
public class Director {

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
    @NotEmpty(message = "nationality is empty")
    private String nationality;

    @Column
    private int age;

    @Column(name = "all_movie_count")
    private int moviesCount;

}
