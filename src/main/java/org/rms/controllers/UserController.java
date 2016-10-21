package org.rms.controllers;

import org.apache.commons.lang3.RandomStringUtils;
import org.rms.models.User;
import org.rms.services.LoginService;
import org.rms.services.MailService;
import org.rms.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by tijo on 19/10/16.
 */

@Controller
@RequestMapping("/")
public class UserController {

    @Autowired
    private LoginService loginService;

    @Autowired
    private UserService userService;

    @Autowired
    private MailService mailService;

    public static final String keySpace = "abcdefghijklmnopqrstuvxyzABCDEFGHIJKLMNOPQRSTUVXYZ123456789";

    @RequestMapping(value = "adduser.action", method = RequestMethod.GET)
    public String userPageDisplay(Model model) {
        model.addAttribute("newUser", new User());
        return "adduser";
    }

    @RequestMapping(value = "/addnewuser.action", method = RequestMethod.POST)
    public
    @ResponseBody
    Object addUser(@ModelAttribute("newUser") User user) {
        User userExists = loginService.getUserByEmail(user.getEmail());
        if (userExists == null) {
            String generatedPassword = RandomStringUtils.random(8, keySpace);
            user.setPassword(generatedPassword);
            userService.addUserSM(user);
            if (mailService.sendNewUserPassword(user)) {
                user.setSendMailFlag(true);
                userService.addUserSM(user);
                return "success";
            } else {
                return "mailfail";
            }
        }
        return "fail";
    }
}
