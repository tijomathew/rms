package org.rms.services;

import org.rms.visualizations.ChartResultContainer;

/**
 * Created by bibin on 13/10/16.
 */
public interface ChildService {

    Long getAllRegisteredStudentsOnCategoryAndOct29Wise(String category);

    Long getAllRegisteredStudentsOnCategoryAndOct30Wise(String category);

    Long getAllRegisteredStudentsOnCategoryAndOct31Wise(String category);

    Long getAllRegisteredStudentsOnCategoryAndNov1Wise(String category);

    ChartResultContainer getChartResultContainer(String tqx);
}
