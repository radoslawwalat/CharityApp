package pl.coderslab.charity.controller;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import pl.coderslab.charity.model.Donation;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.model.Institution;
import pl.coderslab.charity.repository.InstitutionRepository;

import java.util.List;

@Controller
@AllArgsConstructor
public class HomeController {

    private final InstitutionRepository institutionRepository;
    private final DonationRepository donationRepository;

    @ModelAttribute("InstitutionsColOne")
    public List<Institution> returnAllInstitutionsOne(Model model){
        List<Institution> all = institutionRepository.findAll();
        return all.subList(0, (all.size() + 1)/2);
    }
    @ModelAttribute("InstitutionsColTwo")
    public List<Institution> returnAllInstitutionsTwo(Model model){
        List<Institution> all = institutionRepository.findAll();
        return all.subList((all.size() + 1)/2, all.size());
    }

    @ModelAttribute("quantityOfGoods")
    public int returnAllInstitutions(Model model){
        List<Donation> all = donationRepository.selectAllFulfilled();
        int result = 0;
        for (Donation don : all) {
            result += don.getQuantity();
        }
        return result;
    }
    @ModelAttribute("quantityOfDonation")
    public int countDonation(){
        return donationRepository.countAllFulfilled();
    }



    @GetMapping("/")
    public String homeAction(){
        return "index";
    }
}
