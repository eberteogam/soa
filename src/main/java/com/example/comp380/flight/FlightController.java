package com.example.comp380.flight;

import com.example.comp380.airport.Airport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/flights")
public class FlightController {

    @Autowired
    private FlightService flightService;

//    @PostMapping("/createFlight")
//    public Flight createFlight(@RequestBody Flight flight) {
//        return flightService.saveFlight(flight);
//    }

//    public Flight getFlightById(Long id) {
//        return flightService.getFlightById(id);
//    }
//
//    public void deleteFlightById(Long id) {
//        flightService.deleteFlightById(id);
//    }
//
//    public void updateFlightById(Long id, Airport origin, Airport destination, String departureTime, String arrivalTime, int price) {
//        flightService.updateFlightById(id, origin, destination, departureTime, arrivalTime, price);
//    }
//
//    public List<Flight> getAllFlights() {
//        return flightService.getAllFlights();
//    }

}