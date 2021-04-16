package pl.coderslab.charity.controller.userProfile;


import lombok.AllArgsConstructor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
public class UserDonationsController {

    private final UserRepository userRepository;
    private final DonationRepository donationRepository;
    private final InstitutionRepository institutionRepository;
    private final CategoryRepository categoryRepository;

    @ModelAttribute("categories")
    public List<Category> returnAllCategories(){
        return categoryRepository.findAll();
    }

    @ModelAttribute("institutions")
    public List<Institution> returnAllInstitutions(){
        return institutionRepository.findAll();
    }

    @GetMapping("/profile/donations")
    public String showDonations(Model model){

        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username;
        if (principal instanceof UserDetails) {
            username = ((UserDetails)principal).getUsername();
        } else {
            username = principal.toString();
        }
        User loggedUser = userRepository.findByUsername(username);

        model.addAttribute("donations", donationRepository.selectAllByUserId(loggedUser.getId()));
        model.addAttribute("donation", new Donation());
        return "user/userDonations";
    }


    @GetMapping("/profile/donations/fulfill/{id}")
    private String switchFulfill(@PathVariable long id){
        Donation toSave = donationRepository.findById(id).get();

        if (toSave.getFulfilled() == 0) {
            toSave.setFulfilled(1);
        } else {
            toSave.setFulfilled(0);
        }
        donationRepository.save(toSave);
        return "redirect:/profile/donations";
    }

    @GetMapping("/profile/donations/delete/{id}")
    private String deleteDonation(@PathVariable long id){
        donationRepository.deleteById(id);
        return "redirect:/profile/donations";
    }


}
