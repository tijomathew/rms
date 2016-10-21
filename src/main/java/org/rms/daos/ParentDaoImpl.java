package org.rms.daos;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.CriteriaSpecification;
import org.rms.models.ParentNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by cufa-03 on 19/10/16.
 */
@Repository
@Transactional
public class ParentDaoImpl implements ParentDao{

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<ParentNode> getParentNodes() {
        return sessionFactory.getCurrentSession().createCriteria(ParentNode.class).
                setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY).list();
    }
}
