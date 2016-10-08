package org.rms.services;


import org.rms.models.ParentNode;

/**
 * Created by tijo on 8/10/16.
 */
public interface MailService {

    Boolean sendRegistrationDetailsWithConsentForm(ParentNode registeredUser);
}
