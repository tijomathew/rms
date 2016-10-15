package org.rms.services;

import org.rms.visualizations.ChartResultContainer;

/**
 * Created by bibin on 13/10/16.
 */
public interface ChildService {

    Long getAllRegisteredStudentsOnCategoryAndOct29Wise(String category, String date, String property);

    Long getAllRegisteredStudentsOnCategoryAndOct30Wise(String category);

    Long getAllRegisteredStudentsOnCategoryAndOct31Wise(String category);

    Long getAllRegisteredStudentsOnCategoryAndNov1Wise();

    ChartResultContainer getChartResultContainer(String tqx);
}
