package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.Institution;

public interface InstitutionRepository extends JpaRepository<Institution, Long> {

}
