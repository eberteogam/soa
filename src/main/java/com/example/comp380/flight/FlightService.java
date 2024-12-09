package  com.example.comp380.flight;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.comp380.airport.Airport;
import com.example.comp380.airport.AirportService;

import java.util.List;

@Service
public class FlightService {

    @Autowired
    private FlightRepository flightRepository;

    @Autowired
    private AirportService airportService;

    public Flight saveFlight(Flight flight) {
        return flightRepository.save(flight);
    }

    public Flight getFlightById(Long id) {
        return flightRepository.findById(id).orElse(null);
    }

    public List<Flight> getAllFlights() {
        return flightRepository.findAll();
    }

//    public Flight saveFlight(Flight flight) {
//        Airport departureAirport = airportService.getAirportById(flight.getAirportDeparture().getAirportId());
//        flight.setAirportDeparture(departureAirport);
//        return flightRepository.save(flight);
//    }




//    POST http://localhost:8080/flights/createFlight
//
//    Add a "flightNumber": "123" in table fligths and when creating a flight
//
//
//
//    Question
//1. Why ".getAirportId()); " in the following
//    Airport departureAirport = airportService.getAirportById(flight.getAirportDeparture().getAirportId());
//2. In the response I get the following airportDeparture and airportDestination, I think this shouldn't be one to one relationship.
//
//            "flightId": 19,
//            "airportDeparture": {
//        "airportId": 5,
//                "airportDeparture": null,
//                "airportDestination": null,
//                "airportName": "Denver International Airport",
//                "airportCode": "DEN",
//                "airportLocation": "Denver, CO",
//                "airportTimezone":

//    public Flight getFlightById(Long id) {
//        return flightRepository.findById(id).orElse(null);
//    }

//    public void deleteFlightById(Long id) {
//        flightRepository.deleteById(id);
//    }
//
//    public List<Flight> getAllFlights() {
//        return flightRepository.findAll();
//    }
}



