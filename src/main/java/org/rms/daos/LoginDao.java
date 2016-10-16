package org.rms.daos;

import org.rms.models.User;

/**
 * LoginDao description
 * User: tijo
 */
public interface LoginDao {

    public User getUserByUserEmail(String loginUserEmail);
}
