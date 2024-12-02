package com.example.comp380.airport;

import jakarta.persistence.*;
import lombok.*;
import org.springframework.stereotype.Component;


@Entity
@Component
@Table
@Getter
@Setter
public class Airport {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "airport_id")
    private Long airportId;

    @Column(name = "airport_name")
    private String airportName;

    @Column(name = "airport_code")
    private String airportCode;

    @Column(name = "airport_location")
    private String airportLocation;

    @Column(name = "airport_time_zone")
    private String airportTimezone;
}