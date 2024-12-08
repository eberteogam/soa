package com.example.comp380.views;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ViewsController {

    @GetMapping("/flightoption")
    public String flightOption() {
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
        return "user";
    }

    @GetMapping("/signup")
    public String signUp() {
        return "signup";
    }

    @GetMapping("/user")
    public String User() {
        return "user";
    }



}
