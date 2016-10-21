package org.rms.controllers;

import org.rms.models.ParentNode;
import org.rms.models.StudentNode;
import org.rms.models.User;
import org.rms.services.MailService;
import org.rms.services.RegistrationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by cufa-01 on 19/10/16.
 */

@Controller
@RequestMapping("/")
public class EditRegistrationController {

    @Autowired
    private RegistrationService registrationService;

    @Autowired
    private MailService mailService;

    @RequestMapping(value = "editregistration.action", method = RequestMethod.POST)
    public String registerationProcess(@ModelAttribute("parentNodeForm") ParentNode parentNode, HttpServletRequest httpServletRequest) {
        List<StudentNode> studentNodeList = parentNode.getStudentNodeList();
        List<StudentNode> removeEmptyStudentList = new ArrayList<>();
        for (StudentNode studentNode : studentNodeList) {
            if (studentNode.getFirstName() != null && studentNode.getLastName() != null) {
                if (!studentNode.getFirstName().isEmpty() && !studentNode.getLastName().isEmpty()) {
                    studentNode.setParentNode(parentNode);
                } else {
                    removeEmptyStudentList.add(studentNode);
                }
            } else {
                removeEmptyStudentList.add(studentNode);
            }
        }

        for (StudentNode studentNode : removeEmptyStudentList) {
            if (studentNodeList.contains(studentNode)) {
                studentNodeList.remove(studentNode);
            }
        }

       // if (!registrationService.checkEmailAlreadyRegistered(parentNode.getEmail())) {
            ParentNode savedParentNode = registrationService.saveRegistrationEntry(parentNode);
            List<StudentNode> studentNodesToUpdateWithBandCode = savedParentNode.getStudentNodeList();

            List<StudentNode> updatedStudentNodes = new ArrayList<>();

            Integer lengthOfMassCentreName = savedParentNode.getMassCentreName().length();
            String concatMassCentreCode = lengthOfMassCentreName >= 3 ? savedParentNode.getMassCentreName().substring(0, 3) : savedParentNode.getMassCentreName();

            for (StudentNode studentNode : studentNodesToUpdateWithBandCode) {
                String bandCode = concatMassCentreCode.toUpperCase() + "-" + savedParentNode.getId() + "-" + studentNode.getId();
                studentNode.setBandCode(bandCode);
                updatedStudentNodes.add(studentNode);
            }
            savedParentNode.setStudentNodeList(updatedStudentNodes);

           //Boolean emailSentForRegisteredParent = mailService.sendRegistrationDetailsWithConsentForm(savedParentNode);

            Boolean emailSentForRegisteredParent = true;

            if (emailSentForRegisteredParent) {
                savedParentNode.setEmailSent(true);
            } else {
                savedParentNode.setEmailSent(false);
            }

            registrationService.saveRegistrationEntry(savedParentNode);

            HttpSession session = httpServletRequest.getSession();
            session.setAttribute("parentNodeEntry", savedParentNode);

            return "registrationsuccess";
       // }

    }
}