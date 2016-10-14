<%--
  Created by IntelliJ IDEA.
  User: bibin
  Date: 13/10/16
  Time: 11:35 AM
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

    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="http://www.google.com/jsapi"></script>

    <script type="text/javascript">
        google.load("visualization", "1", {packages: ["table"]});

        function runCountQuery(contextPath) {

            var opts = {sendMethod: 'auto'};
            var url = "/viewcounts.action";

            var query = new google.visualization.Query(contextPath + url + '?tqx=reqId:1', opts);

            // Send the query with a callback function.
            query.send(handleCountsQueryResponse);


        }

        function handleCountsQueryResponse(response) {
            if (response.isError()) {
                alert('Error in query: ' + response.getMessage() + ' ' + response.getDetailedMessage());
                return;
            }
            var data = response.getDataTable();
            var table = new google.visualization.Table(document.getElementById('table_div'));

            var cssClassNames = {
                'headerRow': 'italic-darkblue-font large-font bold-font',
                'tableRow': '',
                'oddTableRow': 'beige-background',
                'selectedTableRow': '',
                'hoverTableRow': '',
                'headerCell': 'gold-border',
                'tableCell': '',
                'rowNumberCell': ''
            };

            var options = {'showRowNumber': true, 'cssClassNames': cssClassNames, width: '100%'};

            table.draw(data, options);

        }

        $(document).ready(function () {
            runCountQuery("${pageContext.request.contextPath}");
        });
    </script>

</head>
<body>
<%@ include file="headerTemplate.jsp" %>
<div id="table_div" style="margin: 65px;"></div>
<%@include file="footer.jsp" %>

</body>
</html>
