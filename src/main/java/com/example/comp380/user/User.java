package com.example.comp380.user;

import com.example.comp380.booking.Booking;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;
import java.util.List;

@Entity
@Component
@Table(name = "users_user")
@Getter
@Setter

public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
    private Long userId;

    @OneToMany(mappedBy = "user")
    @JsonManagedReference(value = "userBooking")
    private List<Booking> bookings;


    @Column(name = "user_email")
    private String userEmail;

    @Column(name = "user_password")
    private String userPassword;
//    @Column(name = "user_isUserDeleted")
//    private  Boolean userIsUserDeleted;
}