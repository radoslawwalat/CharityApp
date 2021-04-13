package pl.coderslab.charity.controller;

import lombok.AllArgsConstructor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.model.User;
import pl.coderslab.charity.objects.ChangePasswordForm;
import pl.coderslab.charity.repository.UserRepository;
import pl.coderslab.charity.service.UserService;

import javax.servlet.http.HttpServletRequest;
import java.util.Locale;

@Controller
@AllArgsConstructor
public class UserController {
    private final UserRepository userRepository;
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;


    @GetMapping("/register")
    private String registerUser(Model model){
        User user = new User();
        model.addAttribute("user", user);
        return "user/registerUser";
    }

    @PostMapping("/register")
    private String handleRegisterUser(@ModelAttribute User user) {

        userService.saveUser(user);
        return "redirect:/login";

    }

    @GetMapping("/login")
    public String login() {

        return "user/loginUser";
    }


    @RequestMapping("/default")
    public String defaultAfterLogin(HttpServletRequest request) {
        if (request.isUserInRole("ROLE_ADMIN")) {
                return "redirect:/admin";
            }
            return "redirect:/profile";
    }


    @GetMapping("/profile")
    public String showProfile() {

        return "user/profile";
    }

    @GetMapping("/profile/editInfo")
    public String editUserInfo(Model model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username;
        if (principal instanceof UserDetails) {
            username = ((UserDetails)principal).getUsername();
        } else {
            username = principal.toString();
        }
        model.addAttribute("user", userRepository.findByUsername(username));
        return "user/userUpdateInfo";
    }
    @PostMapping("/profile/updateInfo")
    public String handleUserInfo(@ModelAttribute User user) {
        userRepository.save(user);
        return "redirect:/profile";
    }

    @GetMapping("/profile/editPassword")
    public String editPassword(Model model) {

        model.addAttribute("ChangePasswordForm", new ChangePasswordForm());
        return "user/userUpdatePassword";
    }

    @PostMapping("/profile/editPassword")
    public String handleEditPassword(@ModelAttribute ChangePasswordForm changePasswordForm) {

        if (!changePasswordForm.getPassword().equals(changePasswordForm.getRePassword())){
            return "redirect:/profile/editPassword";
        }

        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username;
        if (principal instanceof UserDetails) {
            username = ((UserDetails)principal).getUsername();
        } else {
            username = principal.toString();
        }
        User loggedUser = userRepository.findByUsername(username);

        if (passwordEncoder.matches(changePasswordForm.getOldPassword(), loggedUser.getPassword())) {
            loggedUser.setPassword(changePasswordForm.getPassword());
            userService.saveUser(loggedUser);
            return "redirect:/profile";
        } else {
            // password dont match

            return "redirect:/profile/editPassword";
        }
    }


}
