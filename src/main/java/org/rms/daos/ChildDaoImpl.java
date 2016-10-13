package org.rms.daos;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.rms.models.StudentNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * Created by bibin on 13/10/16.
 */

@Repository
public class ChildDaoImpl implements ChildDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Long getAllRegisteredStudentsOnCategoryAndOct29Wise(String category) {
        Long registeredStudentCounts = 0l;
        registeredStudentCounts = (Long) sessionFactory.getCurrentSession().createCriteria(StudentNode.class, "studentNode").add(Restrictions.eq("studentNode.retreatSection", category)).add(Restrictions.eq("studentNode.dayOne", "Oct-29")).setProjection(Projections.rowCount()).uniqueResult();
        if (registeredStudentCounts == null) {
            registeredStudentCounts = 0l;
        }
        return registeredStudentCounts;
    }

    @Override
    public Long getAllRegisteredStudentsOnCategoryAndOct30Wise(String category) {
        Long registeredStudentCounts = 0l;
        registeredStudentCounts = (Long) sessionFactory.getCurrentSession().createCriteria(StudentNode.class, "studentNode").add(Restrictions.eq("studentNode.retreatSection", category)).add(Restrictions.eq("studentNode.dayTwo", "Oct-30")).setProjection(Projections.rowCount()).uniqueResult();
        if (registeredStudentCounts == null) {
            registeredStudentCounts = 0l;
        }
        return registeredStudentCounts;
    }

    @Override
    public Long getAllRegisteredStudentsOnCategoryAndOct31Wise(String category) {
        Long registeredStudentCounts = 0l;
        registeredStudentCounts = (Long) sessionFactory.getCurrentSession().createCriteria(StudentNode.class, "studentNode").add(Restrictions.eq("studentNode.retreatSection", category)).add(Restrictions.eq("studentNode.dayThree", "Oct-31")).setProjection(Projections.rowCount()).uniqueResult();
        if (registeredStudentCounts == null) {
            registeredStudentCounts = 0l;
        }
        return registeredStudentCounts;
    }

    @Override
    public Long getAllRegisteredStudentsOnCategoryAndNov1Wise(String category) {
        Long registeredStudentCounts = 0l;
        registeredStudentCounts = (Long) sessionFactory.getCurrentSession().createCriteria(StudentNode.class, "studentNode").add(Restrictions.eq("studentNode.retreatSection", category)).add(Restrictions.eq("studentNode.dayFour", "Nov-1")).setProjection(Projections.rowCount()).uniqueResult();
        if (registeredStudentCounts == null) {
            registeredStudentCounts = 0l;
        }
        return registeredStudentCounts;
    }
}
