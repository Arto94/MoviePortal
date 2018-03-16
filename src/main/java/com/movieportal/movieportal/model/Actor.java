package com.movieportal.movieportal.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "actor")
@Entity
public class Actor {

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
    private int age;

    @NotEmpty(message = "description is empty")
    @Column
    private String description;

    @Column
    @NotEmpty(message = "city is empty")
    private String city;

    @Column
    @NotEmpty(message = "birthdat is empty")
    private String birthday;

    @Column
    @NotEmpty(message = "nationality is empty")
    private String nationality;
    @Column
    private String pic;
}
