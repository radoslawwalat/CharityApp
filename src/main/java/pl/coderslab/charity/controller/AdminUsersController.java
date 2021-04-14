package pl.coderslab.charity.controller;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.charity.model.User;
import pl.coderslab.charity.repository.RoleRepository;
import pl.coderslab.charity.repository.UserRepository;
import pl.coderslab.charity.service.UserService;

import java.util.List;

@Controller
@AllArgsConstructor
public class AdminUsersController {

    private final UserRepository userRepository;
    private final UserService userService;
    private final RoleRepository roleRepository;

    @ModelAttribute("users")
    public List<User> returnAllUsers() { return userRepository.selectAllUsers(); }

    @GetMapping("/admin/users")
    public String showUsers(Model model){

        model.addAttribute("user", new User());

        return "admin/adminUsers";

    }

    @PostMapping("/admin/updateUser")
    public String handleUserEdit(@ModelAttribute User user){
        userRepository.save(user);
        return "redirect:/admin/users";
    }

    @GetMapping("/admin/users/edit/{id}")
    public String editUser(@PathVariable long id, Model model) {
        model.addAttribute("user", userRepository.findById(id).get());
        model.addAttribute("roles", roleRepository.findAll());
        return "admin/adminUsersEdit";

    }

    @GetMapping("/admin/users/delete/{id}")
    private String deleteUser(@PathVariable long id){
        userRepository.deleteById(id);
        return "redirect:/admin/users";
    }
    @GetMapping("/admin/users/block/{id}")
    private String blockUser(@PathVariable long id){
        User toSave = userRepository.findById(id).get();

        if (toSave.getBlocked() == 0) {
            toSave.setBlocked(1);
        } else {
            toSave.setBlocked(0);
        }
        userRepository.save(toSave);
        return "redirect:/admin/users";
    }

    @PostMapping("/admin/saveUser")
    private String handleAddNewUserByAdmin(@ModelAttribute User user) {
        userService.saveUser(user);
        return "redirect:/admin/users";

    }
}
