package org.rms.daos;

import org.hibernate.SessionFactory;
import org.rms.models.ParentNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * Created by bibin on 5/10/16.
 */

@Repository
public class RegistrationDaoImpl implements RegistrationDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public ParentNode saveRegistrationEntry(ParentNode parentNode) {
        try {
            sessionFactory.getCurrentSession().save(parentNode);
            return parentNode;
        } catch (Exception e) {
            return null;
        }
    }
}
