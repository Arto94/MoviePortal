package com.movieportal.movieportal.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.NotEmpty;

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
    @NotEmpty(message = "name is empty")
    private String name;

}
