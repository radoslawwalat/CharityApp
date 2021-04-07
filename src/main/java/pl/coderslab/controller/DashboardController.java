package pl.coderslab.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.coderslab.model.Institution;
import pl.coderslab.repository.InstitutionRepository;

import java.util.List;

@Controller
public class DashboardController {

    private final InstitutionRepository institutionRepository;

    public DashboardController(InstitutionRepository institutionRepository) {
        this.institutionRepository = institutionRepository;
    }

//    @RequestMapping(value = "/app", method = RequestMethod.GET)
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
//        return "home";
//    }
}
