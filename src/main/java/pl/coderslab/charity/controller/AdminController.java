package pl.coderslab.charity.controller;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.charity.model.User;
import pl.coderslab.charity.service.UserService;

@Controller
@AllArgsConstructor
public class AdminController {

    private final UserService userService;


    @GetMapping("/admin")
    public String showAdminPanel() {
        return "admin/adminPanel";
    }

    @PostMapping("/admin/saveAdmin")
    public String handleSaveAdmin(@ModelAttribute User user) {

        userService.saveAdmin(user);

        return "redirect:/admin/admins";
    }






}
