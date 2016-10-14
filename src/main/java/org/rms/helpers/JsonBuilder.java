package org.rms.helpers;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.rms.serializers.ChartResultRowSerializer;
import org.rms.visualizations.ChartResultRow;

import java.util.List;

/**
 * Created by tijo on 2/12/15.
 */
public final class JsonBuilder {

    private static Gson gson;

    public static String convertToJson(Object objectToConvert) {
        if (gson == null)
            gson = new GsonBuilder().registerTypeAdapter(ChartResultRow.class, new ChartResultRowSerializer()).create();
        return gson.toJson(objectToConvert);
    }

    public static <T> List<T> generateSubList(Integer page, Integer rows, Integer totalRecords, List<T> recordList) {
        int fromIndex = 0, toIndex = 0;
        fromIndex = ((page * rows) - rows);
        toIndex = page * rows;
        if (totalRecords < toIndex) {
            toIndex = totalRecords;
        }
        if (fromIndex < 0) {
            fromIndex = 0;
            toIndex = totalRecords;
        }
        return recordList.subList(fromIndex, toIndex);
    }
}
