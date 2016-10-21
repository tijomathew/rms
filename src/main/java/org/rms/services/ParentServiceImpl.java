package org.rms.services;

import org.rms.daos.ParentDao;
import org.rms.models.ParentNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by cufa-03 on 19/10/16.
 */
@Service
public class ParentServiceImpl implements ParentService{

    @Autowired
    private ParentDao dao;

    @Override
    public List<ParentNode> getParentNodes() {
        return dao.getParentNodes();
    }
}
