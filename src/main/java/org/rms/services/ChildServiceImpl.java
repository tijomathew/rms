package org.rms.services;

import org.rms.daos.ChildDao;
import org.rms.models.StudentNode;
import org.rms.visualizations.*;
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
    public Long getAllRegisteredStudentsOnCategoryAndOct29Wise(String category, String date, String property, String inOutFlag) {
        if (category == null) {
            throw new IllegalArgumentException("category cannot be null!!..");
        }
        if (date == null) {
            throw new IllegalArgumentException("date cannot be null!!..");
        }
        if (property == null) {
            throw new IllegalArgumentException("property cannot be null!!..");
        }

        return childDao.getAllRegisteredStudentsOnCategoryAndOct29Wise(category, date, property, inOutFlag);
    }

    @Override
    public Long getAllRegisteredStudentsOnCategoryAndNov1Wise(String inOutFlag) {

        return childDao.getAllRegisteredStudentsOnCategoryAndNov1Wise(inOutFlag);
    }

    @Override
    public ChartResultContainer getChartResultContainer(String tqx, String inOutFlag) {

        ChartResultContainer chartResultContainer = new ChartResultContainer();
        chartResultContainer.setVersion("0.6");
        chartResultContainer.setReqId(tqx);
        chartResultContainer.setStatus("ok");

        ChartTable chartTable = new ChartTable();

        chartTable.setCol(getChartColumns());

        chartResultContainer.setTable(chartTable);
        chartTable.setRows(getChartRows(inOutFlag));

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

    private List<ChartRow> getChartRows(String inOutFlag) {
        List<ChartRow> chartRowList = new ArrayList<>();

        String[] date = new String[]{"Oct-26", "Oct-27", "Oct-28"};
        String[] property = new String[]{"dayOne", "dayTwo", "dayThree"};

        for (int i = 0; i < 3; i++) {

            List<ChartCell> chartCellList = new ArrayList<>();

            ChartCell<String> chartCellDate = new ChartCell<>(date[i], date[i]);
            ChartCell<Long> chartCellJuniorCount = new ChartCell<>(getAllRegisteredStudentsOnCategoryAndOct29Wise("Junior", date[i], property[i], inOutFlag), getAllRegisteredStudentsOnCategoryAndOct29Wise("Junior", date[i], property[i], inOutFlag).toString());
            ChartCell<Long> chartCellSeniorCount = new ChartCell<>(getAllRegisteredStudentsOnCategoryAndOct29Wise("Senior", date[i], property[i], inOutFlag), getAllRegisteredStudentsOnCategoryAndOct29Wise("Senior", date[i], property[i], inOutFlag).toString());
            ChartCell<Long> chartCellSuperSeniorCount = new ChartCell<>(getAllRegisteredStudentsOnCategoryAndOct29Wise("SuperSenior", date[i], property[i], inOutFlag), getAllRegisteredStudentsOnCategoryAndOct29Wise("SuperSenior", date[i], property[i], inOutFlag).toString());


            ChartCell<Long> chartCellYouthCount = new ChartCell<>(0l, String.valueOf(0));

            chartCellList.add(chartCellDate);
            chartCellList.add(chartCellJuniorCount);
            chartCellList.add(chartCellSeniorCount);
            chartCellList.add(chartCellSuperSeniorCount);
            chartCellList.add(chartCellYouthCount);

            chartRowList.add(new ChartRow(chartCellList));
        }

        ChartCell<String> chartCellDate = new ChartCell<>("Oct-29", "Oct-29");
        ChartCell<Long> chartCellJuniorCount = new ChartCell<>(0l, String.valueOf(0));
        ChartCell<Long> chartCellSeniorCount = new ChartCell<>(0l, String.valueOf(0));
        ChartCell<Long> chartCellSuperSeniorCount = new ChartCell<>(0l, String.valueOf(0));

        ChartCell<Long> chartCellYouthCount = new ChartCell<>(getAllRegisteredStudentsOnCategoryAndNov1Wise(inOutFlag), getAllRegisteredStudentsOnCategoryAndNov1Wise(inOutFlag).toString());

        List<ChartCell> chartCellList = new ArrayList<>();

        chartCellList.add(chartCellDate);
        chartCellList.add(chartCellJuniorCount);
        chartCellList.add(chartCellSeniorCount);
        chartCellList.add(chartCellSuperSeniorCount);
        chartCellList.add(chartCellYouthCount);

        chartRowList.add(new ChartRow(chartCellList));

        return chartRowList;
    }

    @Override
    public List<StudentNode> getChildDetails(Long parentId) {
        return childDao.getChildDetails(parentId);
    }

    @Override
    public List<StudentNode> getChildsByIds(List<Long> childIds) {
        return childDao.getChildsByIds(childIds);
    }
}
