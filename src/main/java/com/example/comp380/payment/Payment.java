package com.example.comp380.payment;
import com.example.comp380.booking.Booking;
import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

@Entity
@Component
@Table(name = "flights_payment")
@Getter
@Setter
public class Payment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "payment_id")
    private Long paymentId;

    @OneToOne(mappedBy = "payment")
    @JsonBackReference(value = "paymentBooking")
    private Booking booking;

    @Column(name = "payment_amount")
    private int paymentAmount;
}





