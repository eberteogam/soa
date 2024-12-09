package com.example.comp380.views;

import com.example.comp380.flight.Flight;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;


@Controller
public class ViewsController {

    @Autowired
    private ViewsService viewsService;

    @GetMapping("/flightoption")
    public String getAllFlights(Model model) {
        viewsService.getAllFlights(model);
        return "flightoption";
    }

    @GetMapping("/home")
    public String home() {
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
