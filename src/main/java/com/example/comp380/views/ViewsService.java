package com.example.comp380.views;

import com.example.comp380.flight.Flight;
import com.example.comp380.flight.FlightService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;

@Service
public class ViewsService {

    @Autowired
    private FlightService flightService;

    public void getAllFlights(Model model) {
        List<Flight> flights = flightService.getAllFlights();
        model.addAttribute("flights", flights);
    }
}
