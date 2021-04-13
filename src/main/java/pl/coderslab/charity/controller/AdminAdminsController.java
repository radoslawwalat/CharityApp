package pl.coderslab.charity.controller;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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



    @GetMapping("/admin/admins")
    public String showAdmins(Model model){

        model.addAttribute("user", new User());

        return "admin/adminAdmins";

    }

    @PostMapping("/admin/updateAdmin")
    public String handleAdminEdit(@ModelAttribute User user){
        userRepository.save(user);
        return "redirect:/admin/admins";
    }

    @GetMapping("/admin/admins/edit/{id}")
    public String editInstitution(@PathVariable long id, Model model) {
        model.addAttribute("user", userRepository.findById(id).get());
        return "admin/adminAdminsEdit";

    }

    @GetMapping("/admin/admins/delete/{id}")
    private String deleteInstitution(@PathVariable long id){
        userRepository.deleteById(id);
        return "redirect:/admin/admins";
    }



}
