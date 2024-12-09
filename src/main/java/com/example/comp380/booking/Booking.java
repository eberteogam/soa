package com.example.comp380.booking;

import com.example.comp380.passenger.Passenger;
import com.example.comp380.payment.Payment;
import com.example.comp380.user.User;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import jakarta.persistence.*;
import lombok.*;
import org.springframework.stereotype.Component;
import java.util.*;


@Entity
@Component
@Table(name = "users_booking")
@Getter
@Setter
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "bookingId")
public class Booking {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "booking_id")
    private Long bookingId;

    @ManyToOne
    @JoinColumn(name = "user_id")
    @JsonBackReference(value = "userBooking")
    private User user;

    @OneToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    @JoinColumn(name = "payment_id")
    @JsonManagedReference(value = "paymentBooking")
    private Payment payment;

    @ManyToMany
    @JoinTable(
            name="booking_passenger",
            joinColumns = @JoinColumn(name="booking_id"),
            inverseJoinColumns = @JoinColumn(name="passenger_id")
    )
    private Set<Passenger> passengers = new HashSet<>();

    @Column(name = "booking_confirmation_code")
    private String bookingConfirmationCode;

    @Column(name = "booking_is_round_trip")
    private Boolean isRoundTrip;
}