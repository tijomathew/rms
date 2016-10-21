<%--
  Created by IntelliJ IDEA.
  User: bibin
  Date: 13/10/16
  Time: 11:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="tagLibraryTemplate.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Event Manager</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <spring:url value="/resources/css/style.css" var="stylecss"/>

    <link href="${stylecss} " rel="stylesheet">
    <spring:url value="/resources/css/ui.jqgrid.css" var="jqgridcss"/>
    <link href="${jqgridcss} " rel="stylesheet">
    <spring:url value="/resources/css/layout.jqgrid.css" var="jqgridlayoutcss"/>
    <link href="${jqgridlayoutcss} " rel="stylesheet">
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <spring:url value="/resources/js/jquery.jqGrid.min.js" var="jqGrid"/>
    <script src="${jqGrid}" type="text/javascript"
            language="javascript"></script>
    <spring:url value="/resources/js/grid.locale-en.js" var="gridLocale"/>
    <script src="${gridLocale}" type="text/javascript"
            language="javascript"></script>
    <spring:url value="/resources/js/templates/reportinfo.js" var="template"/>
    <script src="${template}" type="text/javascript"
            language="javascript"></script>
    <script>
        jQuery(document).ready(function ()
        {
            setUpReportGrid();
            $('#pdfReport').click(function () {
                jQuery("<form action='" + encodeURI("pdfreport.action") + "' method='post' accept-charset='utf-8'" +"/>")
                        .appendTo('body').submit().remove();
            });
        });
    </script>
</head>
<body>
<%@ include file="headerTemplate.jsp" %>
<div>
    <table id="reportGrid"></table>
    <div id="reportGridPager"></div>
</div>
<button type="button" value="Finish" class="btn btn-primary commonGreenBtn" style="min-width:140px;"
        id="pdfReport">Pdf Report
</button>
<%@include file="footer.jsp" %>
</body>
</html>
