package org.rms.services;

import org.rms.daos.ChildDao;
import org.rms.visualizations.ChartCol;
import org.rms.visualizations.ChartResultContainer;
import org.rms.visualizations.ChartRow;
import org.rms.visualizations.ChartTable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by bibin on 13/10/16.
 */

@Service
@Transactional
public class ChildServiceImpl implements ChildService {

    @Autowired
    private ChildDao childDao;

    private List<ChartCol> chartColList;

    public ChildServiceImpl() {
        chartColList = new ArrayList<>();
    }

    @Override
    public Long getAllRegisteredStudentsOnCategoryAndOct29Wise(String category) {
        if (category == null) {
            throw new IllegalArgumentException("category cannot be null!!..");
        }

        return childDao.getAllRegisteredStudentsOnCategoryAndOct29Wise(category);
    }

    @Override
    public Long getAllRegisteredStudentsOnCategoryAndOct30Wise(String category) {
        if (category == null) {
            throw new IllegalArgumentException("category cannot be null!!..");
        }

        return childDao.getAllRegisteredStudentsOnCategoryAndOct30Wise(category);
    }

    @Override
    public Long getAllRegisteredStudentsOnCategoryAndOct31Wise(String category) {
        if (category == null) {
            throw new IllegalArgumentException("category cannot be null!!..");
        }

        return childDao.getAllRegisteredStudentsOnCategoryAndOct31Wise(category);
    }

    @Override
    public Long getAllRegisteredStudentsOnCategoryAndNov1Wise(String category) {
        if (category == null) {
            throw new IllegalArgumentException("category cannot be null!!..");
        }

        return childDao.getAllRegisteredStudentsOnCategoryAndNov1Wise(category);
    }

    @Override
    public ChartResultContainer getChartResultContainer(String tqx) {

        ChartResultContainer chartResultContainer = new ChartResultContainer();
        chartResultContainer.setVersion("0.6");
        chartResultContainer.setReqId(tqx);
        chartResultContainer.setStatus("ok");

        ChartTable chartTable = new ChartTable();

        chartTable.setCol(getChartColumns());

        chartResultContainer.setTable(chartTable);
        chartTable.setRows(getChartRows());

        return chartResultContainer;
    }

    private List<ChartCol> getChartColumns() {
        if (chartColList.isEmpty()) {

            ChartCol chartColOne = new ChartCol("date", "Date", "date", "string");
            ChartCol chartColTwo = new ChartCol("junior", "Junior", "junior", "number");
            ChartCol chartColThree = new ChartCol("senior", "Senior", "senior", "number");
            ChartCol chartColFour = new ChartCol("superSenior", "Super Senior", "superSenior", "number");
            ChartCol chartColFive = new ChartCol("youth", "Youth", "youth", "number");

            chartColList.add(chartColOne);
            chartColList.add(chartColTwo);
            chartColList.add(chartColThree);
            chartColList.add(chartColFour);
            chartColList.add(chartColFive);
        }
        return chartColList;
    }

    private List<ChartRow> getChartRows() {
        List<ChartRow> chartRowList = new ArrayList<>();
        String[] dates = new String[]{"Oct-29", "Oct-30", "Oct-31", "Nov-1"};
        String[] category = new String[]{"Junior", "Senior", "SuperSenior"};

        return chartRowList;
    }
}
