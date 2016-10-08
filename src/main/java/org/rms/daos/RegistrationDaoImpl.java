package org.rms.daos;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
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
            sessionFactory.getCurrentSession().saveOrUpdate(parentNode);
            return parentNode;
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public Boolean alreadyRegisteredEmail(String email) {
        Long countOfEmail = (Long) sessionFactory.getCurrentSession().createCriteria(ParentNode.class, "parentNode").add(Restrictions.eq("parentNode.email", email)).setProjection(Projections.rowCount()).uniqueResult();
        return countOfEmail > 0;
    }
}
