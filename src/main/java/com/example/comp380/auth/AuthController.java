package com.example.comp380.auth;

import com.example.comp380.user.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.view.RedirectView;

@RestController
@RequestMapping("/auth")
public class AuthController {

    @Autowired
    private AuthService authService;

    @Autowired
    private UserService userService;

        @PostMapping("/login")
        public RedirectView login(@ModelAttribute AuthDTO authDTO, Model model) {
            return authService.login(authDTO, model);
        }

    @PostMapping("/signup")
    public RedirectView signup(@ModelAttribute AuthDTO authDTO, Model model) {
        if (authDTO.getUserEmail() == null || authDTO.getPassword() == null) {
            model.addAttribute("error", "Please provide both email and password.");
            return new RedirectView("/signup");
        }

        User user = new User();
        user.setUserEmail(authDTO.getUserEmail());
        user.setUserPassword(authDTO.getPassword());
        userService.saveUser(user);

        model.addAttribute("message", "Sign-up successful!");
        return new RedirectView("/login");
    }
}