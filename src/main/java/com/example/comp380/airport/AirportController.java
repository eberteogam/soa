package com.example.comp380.airport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.*;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;

import java.util.List;

@RestController
@RequestMapping("/airports")
@Tag(name = "", description = "")
public class AirportController {

    @Autowired
    private AirportService airportService;

    @GetMapping("/getAllAirports")
    @Operation(summary = "", description = "")
    public List<Airport> getAllAirports() {
        return airportService.getAllAirports();
    }

    @GetMapping("/{id}")
    public Airport getAirportById(@PathVariable Long id) {
        return airportService.getAirportById(id);
    }

}