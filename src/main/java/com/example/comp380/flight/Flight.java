package com.example.comp380.flight;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Flight {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long flightId;
    private Long airportIdDeparture;
    private Long airportIdDestination;
    private String flightDepartureTime;
    private String flightArrivalTime;
    private int flightPrice;

    // Getters and setters
}