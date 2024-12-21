package com.example.comp380.views;

import com.example.comp380.flight.Flight;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.Banner;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;


@Controller
public class ViewsController {

    @Autowired
    private ViewsService viewsService;

    @GetMapping("/selectedFlight")
    public String selectFlight(@RequestParam("flightId") String flightNumber,
                                                    @RequestParam("numPassengers") int numPassengers,
                                                    Model model) {
        Flight flight = viewsService.getFlightById(flightNumber);
        model.addAttribute("flight", flight);
        model.addAttribute("numPassengers", numPassengers);
        return "passenger";
    }

    @GetMapping("/searchFlights")
    public String searchFlights(@RequestParam("fromLocation") Long fromLocation,
                                                        @RequestParam("toLocation") Long toLocation,
                                                        @RequestParam("numPassengers") int numPassengers,
                                                        Model model) {
        List<Flight> flights = viewsService.searchFlightsByLocations(fromLocation, toLocation);
        model.addAttribute("flights", flights);
        model.addAttribute("fromLocation", fromLocation);
        model.addAttribute("toLocation", toLocation);
        model.addAttribute("numPassengers", numPassengers);
        return "flightoption";
    }


    @GetMapping("/flightoption")
    public String getAllFlights(Model model) {
        model.addAttribute("flights", viewsService.getAllFlights());
        return "flightoption";
    }

    @GetMapping("/home")
    public String home(Model model) {
        model.addAttribute("airports", viewsService.getAllAirports());
        return "index";
    }

    @GetMapping("/passenger")
    public String passenger() {
        return "passenger";
    }

    @PostMapping("/submitPassengerDetails")
    public String submitPassengerDetails(@RequestParam Map<String, String> passengerDetails, Model model) {

        viewsService.savePassengerDetails(passengerDetails);

        return "redirect:/payment";
    }

    @GetMapping("/payment")
    public String payment() {
        return "payment";
    }


    @GetMapping("/signup")
    public String signUp() {
        return "signup";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/user")
    public String User() {
        return "user";
    }
}
