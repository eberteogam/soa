package com.example.comp380.airport;

import com.example.comp380.flight.Flight;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.*;
import org.springframework.stereotype.Component;

import java.util.List;


@Entity
@Component
@Table(name = "flights_airport")
@Getter
@Setter

public class Airport {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "airport_id")
    private Long airportId;

//    @OneToMany(mappedBy = "flight")
//    @JsonBackReference
//    private Airport airport;


//    @ManyToOne(mappedBy = "airportDestination")
//    private Flight airportDestination;

    @Column(name = "airport_name")
    private String airportName;

    @Column(name = "airport_code")
    private String airportCode;

    @Column(name = "airport_location")
    private String airportLocation;

    @Column(name = "airport_time_zone")
    private String airportTimezone;
}