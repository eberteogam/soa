package com.example.comp380.booking;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookingService {

@Autowired
    BookingRepository bookingRepository;

    public Booking createBooking(Booking booking) {
        System.out.println("Received Booking2: " + booking);
        System.out.println("Received Code2:" + booking.getBookingConfirmationCode());
        return bookingRepository.save(booking);
    }
}

