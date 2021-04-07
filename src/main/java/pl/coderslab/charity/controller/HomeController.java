package pl.coderslab.charity.controller;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import pl.coderslab.charity.model.Institution;
import pl.coderslab.charity.repository.InstitutionRepository;

import java.util.List;

@Controller
@AllArgsConstructor
public class HomeController {

    private final InstitutionRepository institutionRepository;

    @ModelAttribute("InstitutionsColOne")
    public List<Institution> returnAllInstitutionsOne(Model model){
        List<Institution> all = institutionRepository.findAll();
        List<Institution> firstHalf = all.subList(0, (all.size() + 1)/2);
        return firstHalf;
    }
    @ModelAttribute("InstitutionsColTwo")
    public List<Institution> returnAllInstitutionsTwo(Model model){
        List<Institution> all = institutionRepository.findAll();
        List<Institution> secondHalf = all.subList((all.size() + 1)/2, all.size());
        return secondHalf;
    }

    @GetMapping("/")
    public String homeAction(){
        return "strona";
    }
}
