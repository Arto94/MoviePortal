package com.movieportal.movieportal.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "genre")
@Entity
public class Genre {

    @Id
    @GeneratedValue
    private int id;

    @Column
    private String name;
}
