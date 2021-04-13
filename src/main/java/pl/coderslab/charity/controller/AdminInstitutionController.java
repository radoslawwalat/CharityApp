package pl.coderslab.charity.controller;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.charity.model.Institution;
import pl.coderslab.charity.repository.InstitutionRepository;

import java.util.List;

@Controller
@AllArgsConstructor
public class AdminInstitutionController {

    private final InstitutionRepository institutionRepository;


    @ModelAttribute("institutions")
    public List<Institution> returnAllInstitutions(){
        return institutionRepository.findAll();
    }

    @GetMapping("/admin/institutions")
    public String showAdminInstitutions(Model model){

        model.addAttribute("institution", new Institution());

        return "admin/adminInstitutions";
    }

    @PostMapping("/admin/institutions")
    public String handleNewInstitution(@ModelAttribute Institution institution){

        institutionRepository.save(institution);

        return "redirect:/admin/institutions";
    }

    @PostMapping("/admin/updateInstitution")
    public String updateEditedInstitution(@ModelAttribute Institution institution){
        institutionRepository.save(institution);

        return "redirect:/admin/institutions";
    }

    @GetMapping("/admin/institutions/edit/{id}")
    public String editInstitution(@PathVariable long id, Model model) {
        model.addAttribute("institution", institutionRepository.findById(id).get());
        return "admin/adminInstitutionsEdit";

    }

    @GetMapping("/admin/institutions/delete/{id}")
    private String deleteInstitution(@PathVariable long id){
        institutionRepository.deleteById(id);
        return "redirect:/admin/institutions";
    }
}
