package com.example.comp380.payment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/payments")
public class PaymentController {

    @Autowired
    private PaymentRepository paymentRepository;

    @PostMapping("/createPayment")
    public Payment createPayment(Payment payment) {
        return paymentRepository.save(payment);
    }

}

//First we have the PaymentController class. This class is annotated with @RestController and @RequestMapping("/payments").

// Search booking code page

// Add in the Flight Options page the airports name