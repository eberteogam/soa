package com.example.comp380.passenger;

import com.example.comp380.booking.Booking;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.*;
import jakarta.persistence.*;
import lombok.*;
import org.springframework.stereotype.Component;

import java.util.*;

@Component
@Entity
@Getter
@Setter
@Table(name = "users_passenger")
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "passengerId")
public class Passenger {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "passenger_id")
    private Long passengerId;

    @Column(name = "passenger_name")
    private String passengerName;

    @Column(name = "passenger_last_name")
    private String passengerLastName;

    @Column(name = "passenger_contact_number")
    private String passengerContactNumber;

    @ManyToMany(mappedBy="passengers")
    private Set<Booking> bookings = new HashSet<>();
}
