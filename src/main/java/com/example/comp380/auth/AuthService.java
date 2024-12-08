package com.example.comp380.auth;

import com.example.comp380.user.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.view.RedirectView;


@Service
public class AuthService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public AuthDTO register(AuthDTO authDTO) {
        return authDTO;
    }

    //logging using email and password
    public RedirectView login(AuthDTO authDTO) {
        User user = userRepository.findByUserEmail(authDTO.getUserEmail());
        if (user != null && passwordEncoder.matches(authDTO.getPassword(), user.getUserPassword())) {

            System.out.println("User model");
            System.out.println("User ID: " + user.getUserId());
            System.out.println("User Email: " + user.getUserEmail());
            System.out.println("Auth model");
            System.out.println("User Email: " + authDTO.getUserEmail());
            System.out.println("User Password: " + authDTO.getPassword());

            return new RedirectView("/user");
        }
        System.out.println("Didn't match");
        System.out.println("User Password: " + authDTO.getPassword());
        return new RedirectView("/login");
    }
}
