package pl.coderslab.charity.controller;

import lombok.AllArgsConstructor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.charity.model.Category;
import pl.coderslab.charity.model.Donation;
import pl.coderslab.charity.model.Institution;
import pl.coderslab.charity.model.User;
import pl.coderslab.charity.repository.CategoryRepository;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;
import pl.coderslab.charity.repository.UserRepository;

import java.util.List;

@Controller
@AllArgsConstructor
public class DonationController {
    private final CategoryRepository categoryRepository;
    private final InstitutionRepository institutionRepository;
    private final DonationRepository donationRepository;
    private final UserRepository userRepository;



    @ModelAttribute("categories")
    public List<Category> returnAllCategories(){
        return categoryRepository.findAll();
    }

    @ModelAttribute("institutions")
    public List<Institution> returnAllInstitutions(){
        return institutionRepository.findAll();
    }

    @GetMapping("/donate")
    public String donationForm(Model model){
        Donation donation = new Donation();
        model.addAttribute("donation", donation);
        return "donation/donationForm";
    }

    @PostMapping("/donate")
    public String donationFormHandle(@ModelAttribute("donation") Donation donation){

        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username;
        if (principal instanceof UserDetails) {
            username = ((UserDetails)principal).getUsername();
        } else {
            username = principal.toString();
        }

        donation.setUser(userRepository.findByUsername(username));

        donationRepository.save(donation);

        return "donation/donationFinish";
    }
}
