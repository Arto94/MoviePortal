package com.movieportal.movieportal.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "blog_comment")
@Entity
public class BlogComment {

    @Id
    @GeneratedValue
    private int id;


    @Column
    private String message;

    @ManyToOne
    private User user;

    @ManyToOne
    private Blog blog;

    @Column
    private String date;
}
