package org.rms.services;

import com.itextpdf.text.DocumentException;
import org.rms.models.ParentNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.List;

/**
 * Created by cufa-03 on 19/10/16.
 */
@Service
public class ReportServiceImpl implements ReportService{

    @Autowired
    private ParentService parentService;

    @Autowired
    private PdfExportService pdfExportService;

    @Override
    public File getReport() throws DocumentException {
        List<ParentNode> parentNodeList = parentService.getParentNodes();
        File pdfFile = pdfExportService.createPdfReport(parentNodeList);
        return pdfFile;
    }
}
