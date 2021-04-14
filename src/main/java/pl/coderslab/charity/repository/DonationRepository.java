package pl.coderslab.charity.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.coderslab.charity.model.Donation;

import java.util.List;

public interface DonationRepository extends JpaRepository<Donation, Long> {

    @Query(value ="select sum(fulfilled) from donation where fulfilled = 1", nativeQuery = true)
    int countAllFulfilled();

    @Query(value ="select * from donation where fulfilled = 1", nativeQuery = true)
    List<Donation> selectAllFulfilled();

    @Query(value= "select * from donation where user_id = ?1", nativeQuery = true)
    List<Donation> selectAllByUserId(long id);
}
