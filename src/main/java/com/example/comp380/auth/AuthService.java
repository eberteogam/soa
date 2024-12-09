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
            return new RedirectView("/user");
        }
            return new RedirectView("/login");
    }
}
