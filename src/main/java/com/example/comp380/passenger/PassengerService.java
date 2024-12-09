package com.example.comp380.passenger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class PassengerService {

    @Autowired
    private PassengerRepository passengerRepository;

    public Passenger createPassenger(Passenger passenger) {
        return passengerRepository.save(passenger);
    }

    public Passenger getPassenger(Long id) {
        return passengerRepository.findById(id).orElse(null);
    }
}
