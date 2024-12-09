package com.example.comp380.flight;

import com.example.comp380.airport.Airport;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.*;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;
import java.util.List;

@Entity
@Component
@Table(name = "flights_flight")
@Getter
@Setter

public class Flight {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "flight_id")
    private Long flightId;

    @Column(name = "flight_number")
    private String flightNumber;

    @ManyToOne
    @JoinColumn(name ="airport_id_departure")
    @JsonBackReference(value = "airportDeparture")
    private Airport airportDeparture;

    @ManyToOne
    @JoinColumn(name = "airport_id_destination")
    @JsonBackReference(value = "airportDestination")
    private  Airport airportDestination;

    @Column(name = "flight_departure_time")
    private Timestamp flightDepartureTime;

    @Column(name = "flight_destination_time")
    private Timestamp flightDestinationTime;

    @Column(name = "flight_price")
    private int flightPrice;
}