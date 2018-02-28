package com.movieportal.movieportal.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

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
    private String name;

    @Column
    private String surname;

    @Column
    private String nationality;

    @Column
    private int age;

    @Column(name = "all_movie_count")
    private int moviesCount;

}
