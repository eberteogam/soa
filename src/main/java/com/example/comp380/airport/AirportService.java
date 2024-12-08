package com.example.comp380.airport;

import com.example.comp380.airport.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class AirportService {

    @Autowired
    private AirportRepository airportRepository;

    public List<Airport> getAllAirports() {
        return airportRepository.findAll();
    }

    public Airport getAirportById(Long id) {
        return airportRepository.findById(id).orElse(null);
    }

}