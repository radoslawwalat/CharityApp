package pl.coderslab.charity.controller;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@AllArgsConstructor
public class AdminController {




    @GetMapping("/admin")
    public String showAdminPanel() {
        return "admin/adminPanel";
    }





}
