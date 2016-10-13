package org.rms.daos;

import org.rms.models.StudentNode;

import java.util.List;

/**
 * Created by bibin on 13/10/16.
 */
public interface ChildDao {

    Long getAllRegisteredStudentsOnCategoryAndOct29Wise(String category);

    Long getAllRegisteredStudentsOnCategoryAndOct30Wise(String category);

    Long getAllRegisteredStudentsOnCategoryAndOct31Wise(String category);

    Long getAllRegisteredStudentsOnCategoryAndNov1Wise(String category);

}
