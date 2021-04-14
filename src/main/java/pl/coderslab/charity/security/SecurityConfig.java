package pl.coderslab.charity.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import pl.coderslab.charity.service.SpringDataUserDetailsService;


@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SpringDataUserDetailsService customUserDetailsService() {
        return new SpringDataUserDetailsService(); }


    @Override
    public void configure(HttpSecurity http) throws Exception {

            http
                .authorizeRequests()
                    .antMatchers("/admin/**").hasAnyRole("ADMIN")
                    .antMatchers("/profile").hasAnyRole("USER", "ADMIN")
                    .antMatchers("/donate").hasAnyRole("USER", "ADMIN")
                    .and()
                .formLogin()
                    .loginPage("/login")
                    .defaultSuccessUrl("/default", true)
                    .and()
                .logout()
                    .logoutSuccessUrl("/")
                .permitAll()
                    .and()
                .exceptionHandling()
                    .accessDeniedPage("/login");
    }
}
