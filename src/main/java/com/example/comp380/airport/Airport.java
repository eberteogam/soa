package com.example.comp380.airport;

import com.example.comp380.user.User;

import javax.persistence.*;

@Entity
public class Airport {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long airportId;
    private String airportName;
    private String airportCode;
    private String airportLocation;
    private String airportTimezone;

    // Getters and setters
}