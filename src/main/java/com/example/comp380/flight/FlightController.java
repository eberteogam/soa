package com.example.comp380.flight;

import com.example.comp380.airport.Airport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/flights")
public class FlightController {

    @Autowired
    private FlightService flightService;

    @PostMapping("/createFlight")
    public Flight createFlight(@RequestBody Flight flight) {
        return flightService.saveFlight(flight);
    }

    @GetMapping("/{id}")
    public Flight getFlightById(@PathVariable Long id) {
        return flightService.getFlightById(id);
    }

    @GetMapping("/getAllFlights")
    public List<Flight> getAllFlights() {
        return flightService.getAllFlights();
    }



//
//    public void deleteFlightById(Long id) {
//        flightService.deleteFlightById(id);
//    }
//
//    public void updateFlightById(Long id, Airport origin, Airport destination, String departureTime, String arrivalTime, int price) {
//        flightService.updateFlightById(id, origin, destination, departureTime, arrivalTime, price);
//    }
//


}