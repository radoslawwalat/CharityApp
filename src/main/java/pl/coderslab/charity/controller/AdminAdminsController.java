package pl.coderslab.charity.controller;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import pl.coderslab.charity.model.Institution;
import pl.coderslab.charity.model.User;
import pl.coderslab.charity.repository.UserRepository;

import java.util.List;

@Controller
@AllArgsConstructor
public class AdminAdminsController {

    private final UserRepository userRepository;

    @ModelAttribute("admins")
    public List<User> returnAllAdmins(){
        return userRepository.selectAllAdmins();
    }

    @ModelAttribute("users")
    public List<User> returnAllUsers() { return userRepository.findAll();}

}
