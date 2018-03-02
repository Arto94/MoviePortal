package com.movieportal.movieportal.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


import javax.persistence.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "comment")
@Entity
public class Comment {

    @Id
    @GeneratedValue
    private int id;


    @Column
    private String message;

    @ManyToOne
    private User user;
    @ManyToOne
    private Movie movie;

    @Column
    private String date;
}
