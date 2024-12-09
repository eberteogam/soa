package com.example.comp380.passenger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/passengers")
public class PassengerController {

    @Autowired
    private PassengerService passengerService;

    @PostMapping("/createPassenger")
    public ResponseEntity<Passenger> createPassenger(@RequestBody Passenger passenger) {
        Passenger createdPassenger = passengerService.createPassenger(passenger);
        return new ResponseEntity<>(createdPassenger, HttpStatus.CREATED);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Passenger> getPassenger(@PathVariable Long id) {
        Passenger createdPassenger = passengerService.getPassenger(id);
        return new ResponseEntity<>(createdPassenger, HttpStatus.CREATED);
    }
}
