package com.example.comp380.booking;

import com.example.comp380.payment.Payment;
import com.example.comp380.user.User;
import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.*;
import org.springframework.stereotype.Component;

@Entity
@Component
@Table(name = "users_booking")
@Getter
@Setter
public class Booking {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "booking_id")
    private Long bookingId;

    @ManyToOne
    @JoinColumn(name = "user_id")
    @JsonBackReference
    private User user;

    @OneToOne
    @JoinColumn(name = "payment_id")
    private Payment paymentId;

    @Column(name = "booking_confirmation_code")
    private String bookingConfirmationCode;

    @Column(name = "booking_is_round_trip")
    private Boolean isRoundTrip;
}