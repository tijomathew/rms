package org.rms.daos;

import com.sun.org.apache.xerces.internal.dom.ChildNode;
import org.rms.models.StudentNode;

import java.util.List;

/**
 * Created by bibin on 13/10/16.
 */
public interface ChildDao {

    Long getAllRegisteredStudentsOnCategoryAndOct29Wise(String category, String date, String property);

    Long getAllRegisteredStudentsOnCategoryAndOct30Wise(String category);

    Long getAllRegisteredStudentsOnCategoryAndOct31Wise(String category);

    Long getAllRegisteredStudentsOnCategoryAndNov1Wise();

    List<StudentNode> getChildDetails(Long parentId);
}
