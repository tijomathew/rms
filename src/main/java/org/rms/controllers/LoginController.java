package org.rms.controllers;

import org.rms.models.ParentNode;
import org.rms.models.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by bibin on 13/10/16.
 */

@Controller
@RequestMapping("/")
public class LoginController {

    @RequestMapping(value = "login.action", method = RequestMethod.GET)
    public String loginPageDisplay(Model model) {
        model.addAttribute("loginUser", new User());
        return "login";
    }
}
