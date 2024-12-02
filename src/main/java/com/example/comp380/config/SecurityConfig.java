package com.example.comp380.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.core.userdetails.*;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;
import static org.springframework.security.config.Customizer.withDefaults;

@Configuration
public class SecurityConfig{ //public class SecurityConfig {
//    Encoder Method for Hashing Passwords provided by spring-boot-starter-security'
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    //  Overriding the default userDetailsService because the password given by default in the terminal
    //  is not hashed and the passwordEncoder requires a BCryptPasswordEncoder
    @Bean
    public UserDetailsService userDetailsService() {
        UserDetails user = User.builder()
                .username("teo")
                .password(this.passwordEncoder().encode("password"))
                .roles("ADMIN", "USER")
                .build();
        return new InMemoryUserDetailsManager(user);
    }

    //  Disabling CSRF and requiring authentication for all requests with Basic Authentication
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                .csrf(AbstractHttpConfigurer::disable)
                .authorizeHttpRequests(authorize -> authorize
//                        .requestMatchers("users/createUser").permitAll()
//                        .requestMatchers("/users/createUser").authenticated()
                        .anyRequest().authenticated()
                )
                .httpBasic(withDefaults());
        return http.build();
    }
}