package com.example.comp380.booking;
//import com.example.comp380.user.User;
//import com.example.comp380.payment.Payment;
import jakarta.persistence.*;
import org.springframework.stereotype.Component;

@Component
@Entity
@Table(name = "bookings")
public class Booking {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "booking_id")
    private Long bookingId;
//    @ManyToOne
//    @JoinColumn(name = "user_id")
    @Column(name = "user")
    private Long user;




//    @OneToOne
//    @JoinColumn(name = "payment_id")
//    private long paymentId;
//    private String bookingConfirmationCode;
//    private Boolean isOneWay;
//
//    public long getBookingId() {
//        return this.bookingId;
//    }
//
//    public long getUser() {
//        return this.user;
//    }
//
//    public long getPaymentId() {
//        return this.paymentId;
//    }
//
//    public String getBookingConfirmationCode() {
//        return this.bookingConfirmationCode;
//    }
//
//    public void setBookingId(Long bookingId) {
//        this.bookingId = bookingId;
//    }
//
//    public void setUser(Long user) {
//        this.user = user;
//    }
//
//    public void setPaymentId(long paymentId) {
//        this.paymentId = paymentId;
//    }
//
//    public void setBookingConfirmationCode(String bookingConfirmationCode) {
//        this.bookingConfirmationCode = bookingConfirmationCode;
//    }

}







