package org.rms.controllers;

import org.rms.models.ParentNode;
import org.rms.models.User;
import org.rms.services.RegistrationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by cufa-01 on 19/10/16.
 */

@Controller
@RequestMapping("/")
public class EmailController {

    @Autowired
    private RegistrationService registrationService;

    @RequestMapping(value = "email.action", method = RequestMethod.GET)
    public String emailPageDisplay(Model model) {
        model.addAttribute("parentNodeForm", new ParentNode());
        model.addAttribute("loginUser", new User());
        return "email";
    }


    @RequestMapping(value = "getRegisteredFamilyDetails.action", method = {RequestMethod.POST})
    public String getRegisteredFamilyDetails(@RequestParam("registeredEmail") String registeredEmail, Model model, HttpServletRequest request){
        ParentNode parentNode = registrationService.getRegisteredEntry(registeredEmail);
        HttpSession httpSession = request.getSession();
        httpSession.setAttribute("selectedParentNode", parentNode);
        model.addAttribute("parentNodeForm", parentNode);
        return "editregistration";
    }
}
