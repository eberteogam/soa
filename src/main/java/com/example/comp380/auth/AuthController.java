package com.example.comp380.auth;

import com.example.comp380.user.User;
import com.example.comp380.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/auth")
public class AuthController {

    @Autowired
    private UserService userService;

    @PostMapping("/login")
    public ResponseEntity<String> login(@RequestBody Auth auth) {
        return ResponseEntity.ok("Login successful");
    }

//    @PostMapping("/signup")
//    public ResponseEntity<Auth> signup(@RequestBody Auth auth) {
//        User user = new User();
//        user.setUserEmail(auth.getUsername());
//        user.setUserPassword(auth.getPassword());
//        userService.saveUser(user);
//        return new ResponseEntity<>(auth, HttpStatus.CREATED);
//    }

    @PostMapping("/signup")
    public String signup(@ModelAttribute AuthDTO authDTO, Model model) {
        if (authDTO.getUserEmail() == null || authDTO.getPassword() == null) {
            model.addAttribute("error", "Please provide both email and password.");
            return "signup";
        }

        User user = new User();
        user.setUserEmail(authDTO.getUserEmail());
        user.setUserPassword(authDTO.getPassword());
        userService.saveUser(user);

        model.addAttribute("message", "Sign-up successful!");
        return "signup-success";
    }
}
