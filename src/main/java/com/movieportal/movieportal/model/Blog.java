package com.movieportal.movieportal.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "blog")
@Entity
public class Blog {

    @Id
    @GeneratedValue
    private int id;
    @Column
    @NotEmpty(message = "name is empty")
    private String name;
    @Column
    @NotEmpty(message = "description is empty")
    private String description;
    @Column
    @NotEmpty(message = "date is empty")
    private String date;
    @Column
    private String picture;
}
