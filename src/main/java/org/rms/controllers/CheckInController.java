package org.rms.controllers;

import org.rms.models.ParentNode;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by tijo on 24/10/16.
 */

@Controller
@RequestMapping("/")
public class CheckInController {

    @RequestMapping(value = "checkinsearch.action", method = RequestMethod.GET)
    public String checkInPageDisplay(Model model) {
        model.addAttribute("searchParentNode", new ParentNode());
        return "checkinsearchentry";
    }
}
