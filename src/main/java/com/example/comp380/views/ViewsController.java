package com.example.comp380.views;

import com.example.comp380.flight.Flight;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.Banner;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;


@Controller
public class ViewsController {

    @Autowired
    private ViewsService viewsService;

    @GetMapping("/selectedFlight")
    public String selectFlight(@RequestParam("flightId") String flightNumber, Model model) {
        Flight flight = viewsService.getFlightById(flightNumber);
        System.out.println("flightss");
        System.out.println(flight);
        model.addAttribute("flight", flight);
        return "passenger";
    }

    @GetMapping("/searchFlights")
    public String searchFlights(@RequestParam("fromLocation") Long fromLocation,  @RequestParam("toLocation") Long toLocation,  Model model) {
        List<Flight> flights = viewsService.searchFlightsByLocations(fromLocation, toLocation);
        model.addAttribute("flights", flights);
        model.addAttribute("fromLocation", fromLocation);
        model.addAttribute("toLocation", toLocation);
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
