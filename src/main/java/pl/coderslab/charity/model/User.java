package pl.coderslab.charity.model;

import lombok.Getter;
import lombok.Setter;
import javax.persistence.*;
import javax.validation.constraints.Email;

@Entity
@Getter
@Setter
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String username;
    private String firstname;
    private String lastname;
    private String password;


    @ManyToOne
    private Role role;

    @Email
    private String email;

    @Column(name = "blocked", nullable = false, columnDefinition = "int default 0")
    private int blocked;



}
