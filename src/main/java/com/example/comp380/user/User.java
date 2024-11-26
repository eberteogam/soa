package com.example.comp380.user;

import com.example.comp380.booking.Booking;
import jakarta.persistence.*;
import java.util.List;

@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long userId;
    private String userEmail;
    private String userPassword;
    private String userCreatedAt;
    @OneToMany(mappedBy = "user_id")
    private List<Booking> bookings;
    public User(){}

    public long gerUser(){
        return this.userId;
    }

    public String getUserEmail(){
        return this.userEmail;
    }

    public String getUserPassword(){
        return this.userPassword;
    }
    public String getUserCreatedAt(){
        return this.userCreatedAt;
    }

    public List<Booking> getBookings(){
        return bookings;
    }

    public void setUserId(long userId){
        this.userId = userId;
    }
    public void setUserEmail(String email){
        this.userEmail = email;
    }
    public  void setUserPassword(String superPassword){
        this.userPassword = superPassword;
    }
    public void setUserCreatedAt(String createdAt){
        this.userCreatedAt = createdAt;
    }
    public void SetBookings(List<Booking> bookings) {
        this.bookings = bookings;
    }
}
