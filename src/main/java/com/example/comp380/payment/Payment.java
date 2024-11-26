package com.example.comp380.payment;
import com.example.comp380.booking.Booking;
import com.example.comp380.flight.Flight;
import jakarta.persistence.*;

@Entity
public class Payment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long paymentId;

    @OneToOne(mappedBy = "paymentId")
    private Booking booking;

    private int paymentReceipt;

    public Long getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(Long paymentId) {
        this.paymentId = paymentId;
    }

    public Booking getBooking() {
        return booking;
    }

    public void setBooking(Booking booking) {
        this.booking = booking;
    }

    public int getPaymentReceipt() {
        return paymentReceipt;
    }

    public void setPaymentReceipt(int paymentReceipt) {
        this.paymentReceipt = paymentReceipt;
    }
}