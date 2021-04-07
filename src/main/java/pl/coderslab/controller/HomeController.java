package pl.coderslab.controller;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import pl.coderslab.model.Institution;
import pl.coderslab.repository.InstitutionRepository;

import java.util.List;

@Controller
@AllArgsConstructor
public class HomeController {

    private final InstitutionRepository institutionRepository;

//    @ModelAttribute("InstitutionsColOne")
//    public List<Institution> returnAllInstitutionsOne(Model model){
//        List<Institution> all = institutionRepository.findAll();
//        List<Institution> firstHalf = all.subList(0, (all.size() + 1)/2);
//        return firstHalf;
//    }
//    @ModelAttribute("InstitutionsColTwo")
//    public List<Institution> returnAllInstitutionsTwo(Model model){
//        List<Institution> all = institutionRepository.findAll();
//        List<Institution> secondHalf = all.subList((all.size() + 1)/2, all.size());
//        return secondHalf;
//    }

//    @GetMapping("/")
//    public String homeAction(Model model){
//        List<Institution> all = institutionRepository.findAll();
//        List<Institution> firstHalf = all.subList(0, (all.size() + 1)/2);
//        List<Institution> secondHalf = all.subList((all.size() + 1)/2, all.size());
//        model.addAttribute("InstitutionsColOne", all);
//        model.addAttribute("InstitutionsColTwo", secondHalf);
//        Institution obj = new Institution();
//        obj.setName("AAaaa");
//        obj.setDescription("bbbCcc");
//        model.addAttribute("institute", obj);
//        return "index";
//    }
}
