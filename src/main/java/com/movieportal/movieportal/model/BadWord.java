package com.movieportal.movieportal.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "bad_word")
@Entity
public class BadWord {

    @Id
    @GeneratedValue
    private int id;
    @Column
    private String word;
}
