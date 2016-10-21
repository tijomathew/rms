package org.rms.services;

import com.itextpdf.text.*;
import com.itextpdf.text.html.WebColors;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import org.apache.commons.lang.time.DurationFormatUtils;
import org.rms.models.ParentNode;
import org.rms.models.StudentNode;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * Created by cufa-03 on 20/10/16.
 */
@Service
public class PdfExportServiceImpl implements PdfExportService {
    private Document document;
    private PdfWriter writer;
    private PdfPTable table;
    private Integer columnSize;
    private Map<Integer, String> header;
    private String cellColour;
    Font fontBold;
    Font fontNormal;
    String reportName;
    BaseColor myColor;

    public PdfExportServiceImpl() {
        fontBold   = FontFactory.getFont("Verdana", 7, Font.BOLD);
        fontNormal = FontFactory.getFont("Verdana",7, Font.NORMAL);
    }
    @Override
    public File createPdfReport(List<ParentNode> parentNodes) throws DocumentException{
        this.cellColour = "#FFFFFF";
        document = new Document(PageSize.A4_LANDSCAPE);
        File tempDestFile = createTempPdfFile();//create a temporary pdf file in the temp directory of web server
        try {
            writer = PdfWriter.getInstance(document, new FileOutputStream(tempDestFile));//to get an instance of the PdfWriter
        } catch (DocumentException e) {
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        document.setPageSize(PageSize.A4.rotate());
        document.setMargins(75, 75, 100, 75);

        //A class to write the header and footer to the pdf
        PdfHeaderAndFooter event = new PdfHeaderAndFooter("Report");
        //writer.setBoxSize("headerBox", headerBox);
        writer.setPageEvent(event);

        document.open();

        for (ParentNode parentNode: parentNodes){


            table = new PdfPTable(4);//create a table with respective column size
            table.setSpacingBefore(5);
            table.setSpacingAfter(5);
            PdfPCell cell;
            //int rowSpan =data.get(user).get(log).size();
            int rowSpan =parentNode.getStudentNodeList().size();
            String heading = "Parent Name = " +  parentNode.getFirstName() + " " + parentNode.getLastName();
            cell = new PdfPCell(new Phrase(new Chunk(heading, fontBold)));
            cell.setRowspan(rowSpan + 1);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(cell);

            cell = new PdfPCell(new Phrase("Name", fontBold));// create cell
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(cell);
            cell = new PdfPCell(new Phrase("Class Division", fontBold));// create cell
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(cell);
            cell = new PdfPCell(new Phrase("Band Code", fontBold));// create cell
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(cell);
            cell.setRowspan(rowSpan);

            for (StudentNode studentNode: parentNode.getStudentNodeList()){
                addCellContentToPDFTable(studentNode.getFirstName() + " " + studentNode.getLastName(), fontNormal, Element.ALIGN_RIGHT);
                addCellContentToPDFTable(studentNode.getClassDivision() , fontNormal, Element.ALIGN_RIGHT);
                addCellContentToPDFTable(studentNode.getBandCode(), fontNormal, Element.ALIGN_RIGHT);
            }
            table.setWidthPercentage(100);  // set the width of the table to 100% of page
            document.add(table);  // Now add all this to the document

        }

        document.close();

        return tempDestFile;
    }
    public void addCellContentToPDFTable(Object obj, Font font,int alignment){
        PdfPCell cell = new PdfPCell(new Phrase(null != obj.toString()? obj.toString().replaceAll("[€|$] ", ""): "", font));
        if(this.cellColour!= null){
            myColor = WebColors.getRGBColor(this.cellColour);
            cell.setBackgroundColor(myColor);//sets the background colour for the totals cell
        }
        cell.setHorizontalAlignment(alignment);
        table.addCell(cell);//add the cell content to pdf

    }

    //function to create the temporary pdf file
    private File createTempPdfFile() {
        UUID uu_fileName = UUID.randomUUID();
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(System.getProperty("java.io.tmpdir"));
        stringBuilder.append(System.getProperty("file.separator"));
        stringBuilder.append("ecm_export" + uu_fileName.toString() + ".pdf");
        File tempFile = new File(stringBuilder.toString());
        return tempFile;
    }
}
