package com.movieportal.movieportal.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "company")
@Entity
public class Company {

    @Id
    @GeneratedValue
    private int id;

    @Column
    private String name;

    @Column
    private String picture;
}
