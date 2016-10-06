package org.rms.services;

import org.rms.daos.RegistrationDao;
import org.rms.models.ParentNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

/**
 * Created by bibin on 5/10/16.
 */

@Service
@Transactional
public class RegistrationServiceImpl implements RegistrationService {

    @Autowired
    private RegistrationDao registrationDao;

    @Override
    public ParentNode saveRegistrationEntry(ParentNode parentNode) {
        if (parentNode == null) {
            throw new IllegalArgumentException("Parent Node cannot be null!!..");
        }
        return registrationDao.saveRegistrationEntry(parentNode);
    }
}
