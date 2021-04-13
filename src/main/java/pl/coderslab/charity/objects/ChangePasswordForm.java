package pl.coderslab.charity.objects;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChangePasswordForm {

    private String oldPassword;
    private String password;
    private String rePassword;

}
