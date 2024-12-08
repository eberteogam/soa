package com.example.comp380.user;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.security.crypto.password.PasswordEncoder;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

class UserServiceTest {
    @ExtendWith(MockitoExtension.class)
    @Mock
        private UserRepository userRepository;

        @Mock
        private PasswordEncoder passwordEncoder;

        @InjectMocks
        private UserService userService;

        @Test
        void testSaveUser() {
            // Arrange
            User user = new User();
            user.setUserEmail("test@example.com");
            user.setUserPassword("plainPassword");

            User savedUser = new User();
            savedUser.setUserId(1L);
            savedUser.setUserEmail("test@example.com");
            savedUser.setUserPassword("encodedPassword");

            when(passwordEncoder.encode("plainPassword")).thenReturn("encodedPassword");
            when(userRepository.save(any(User.class))).thenReturn(savedUser);

            // Act
            User result = userService.saveUser(user);

            // Assert
            assertNotNull(result);
            assertEquals("encodedPassword", result.getUserPassword());
            verify(passwordEncoder, times(1)).encode("plainPassword");
            verify(userRepository, times(1)).save(user);
        }
}