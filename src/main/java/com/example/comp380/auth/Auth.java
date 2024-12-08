package com.example.comp380.auth;

import jakarta.persistence.Entity;
import org.springframework.stereotype.Component;
import lombok.*;

@Entity
@Component
@Getter
@Setter

public class Auth {
    @jakarta.persistence.Id
    private String username;

    private String password;
}
