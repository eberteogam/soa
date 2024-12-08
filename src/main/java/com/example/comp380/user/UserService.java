package com.example.comp380.user;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public User saveUser(User user) {
        user.setUserPassword(passwordEncoder.encode(user.getUserPassword()));
        return  userRepository.save(user);
    }

    public User getUserById(Long id) {
        return userRepository.findById(id).orElse(null);
    }

    //    public void deleteUser(Long id) {
    //        userRepository.deleteById(id);
    //    }

//   public List<User> getAllUsers() {
//        return userRepository.findAll();
//    }
}