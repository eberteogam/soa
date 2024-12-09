package com.example.comp380.views;

import com.example.comp380.airport.Airport;
import com.example.comp380.airport.AirportService;
import com.example.comp380.flight.Flight;
import com.example.comp380.flight.FlightRepository;
import com.example.comp380.flight.FlightService;
import com.example.comp380.passenger.Passenger;
import com.example.comp380.passenger.PassengerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;

@Service
public class ViewsService {

    @Autowired
    private FlightService flightService;
    @Autowired
    private AirportService airportService;
    @Autowired
    private FlightRepository flightRepository;
    @Autowired
    private PassengerService passengerService;

    public List<Flight> getAllFlights() {
        return flightService.getAllFlights();
    }

    public List<Airport> getAllAirports() {
        return airportService.getAllAirports();
    }

    public List<Flight> searchFlightsByLocations(Long fromLocation, Long toLocation) {
        return flightRepository.findByAirportDeparture_AirportIdAndAirportDestination_AirportId(fromLocation, toLocation);
    }

    public Flight getFlightById(String flightNumber) {
        return flightService.getFlightById(Long.parseLong(flightNumber));
    }

    public Passenger createPassenger(Passenger passenger) {
        return passengerService.createPassenger(passenger);
    }
}
