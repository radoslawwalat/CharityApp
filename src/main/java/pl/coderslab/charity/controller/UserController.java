package pl.coderslab.charity.controller;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.charity.model.User;
import pl.coderslab.charity.repository.UserRepository;
import pl.coderslab.charity.service.UserService;

@Controller
@AllArgsConstructor
public class UserController {
    private final UserRepository userRepository;
    private final UserService userService;


    @GetMapping("/register")
    private String registerUser(Model model){
        User user = new User();
        model.addAttribute("user", user);
        return "user/registerUser";
    }

    @PostMapping("/register")
    private String handleRegisterUser(@ModelAttribute User user) {

        userService.saveAdmin(user);
        return "redirect:/login";

    }

    @GetMapping("/login")
    public String login() {

        return "user/loginUser";
    }
}
