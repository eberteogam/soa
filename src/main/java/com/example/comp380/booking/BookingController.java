package com.example.comp380.booking;
//import org.springframework.beans.factory.annotation.*;
import com.example.comp380.passenger.Passenger;
import com.example.comp380.passenger.PassengerService;
import com.example.comp380.payment.Payment;
import com.example.comp380.payment.PaymentRepository;
import com.example.comp380.payment.PaymentService;
import com.example.comp380.user.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

import java.util.HashSet;
import java.util.List;
import java.util.Set;


@RestController
@RequestMapping("/bookings")
public class BookingController {
    @Autowired
    BookingService bookingService;

    @Autowired
    private PaymentService paymentService;
    @Autowired
    private PassengerService passengerService;

    @PostMapping("/createBooking")
    public ResponseEntity<Booking> createBooking(@RequestBody Booking booking) {
        String bookingConfirmationCode = String.format("%06d", (long) (Math.random() * 1000000));
        booking.setBookingConfirmationCode(bookingConfirmationCode);

        Payment payment = paymentService.getPaymentById(booking.getPayment().getPaymentId());
        booking.setPayment(payment);

        Set<Passenger> passengers = booking.getPassengers();
        for (Passenger passenger : passengers) {
            passengerService.createPassenger(passenger);
        }

        Booking createdBooking = bookingService.createBooking(booking);

        return new ResponseEntity<>(createdBooking, HttpStatus.CREATED);
    }

    @GetMapping("/{id}")
    public Booking getBookingById(@PathVariable Long id) {
        return bookingService.getBookingById(id);
    }

}