package org.rms.controllers;

import org.rms.enums.SystemRole;
import org.rms.models.ParentNode;
import org.rms.models.User;
import org.rms.services.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;

/**
 * Created by bibin on 13/10/16.
 */

@Controller
@RequestMapping("/")
public class LoginController {

    @Autowired
    private LoginService loginService;

    @RequestMapping(value = "login.action", method = RequestMethod.GET)
    public String loginPageDisplay(Model model) {
        model.addAttribute("loginUser", new User());
        return "login";
    }

    @RequestMapping(value = "loggedin.action", method = RequestMethod.POST)
    public String verifyUser(@ModelAttribute("loginUser") @Valid User user, BindingResult result, Model model) {
        User loggedInUser;

        try {
            loggedInUser = loginService.verifyLoggedInUser(user.getEmail(), user.getPassword());
            if (loggedInUser != null) {
                if (loggedInUser.getAlreadyLoggedIn()) {
                    if (loggedInUser.getSystemRole().equals(SystemRole.ADMIN)) {
                        return "admin";
                    } else if (loggedInUser.getSystemRole().equals(SystemRole.ORGANIZER)) {
                        return "registerationcounts";
                    } else if (loggedInUser.getSystemRole().equals(SystemRole.RETREAT_USER)) {

                    }
                } else {
                    return "changepassword";
                }

            } else {
                result.addError(new ObjectError("loginErrorDisplay", new String[]{"LoginCredentialsError"}, new String[]{}, "Username or Password is invalid in our system. Please re-enter correct one."));
            }

        } catch (IllegalArgumentException ex) {
            System.out.println("The authentication and authorization of the user is failed in the system");
        }

        return "login";
    }
}
