package com.example.comp380.auth;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.*;

@Getter
@Setter
public class AuthDTO {
        @NotNull
        @Email
        private String userEmail;

        @NotNull
        @Size(min = 6)
        private String password;
}