<%--
  Created by IntelliJ IDEA.
  User: tijo
  Date: 6/10/16
  Time: 10:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="tagLibraryTemplate.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>RMS</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <spring:url value="/resources/css/style.css" var="stylecss"/>
    <link href="${stylecss} " rel="stylesheet">

    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function () {

        });
    </script>

</head>


<body>
<%@ include file="headerTemplate.jsp"%>
<div class="mainWrapper">
    <div class="row row-offcanvas row-offcanvas-right">
        <div class="col-xs-12 col-sm-12"></div>
        <h3 class="defaultBold" style="color: #843534 !important;">Failure</h3>
        <div>

            <p class="alert alert-danger text-center" style="margin-top:30px;">
                <strong>Failure!</strong> Your registration is failed. Please make sure that your email ID is not
                registered with our system.
            </p>

        </div>


    </div>
</div>
<div style="    position: fixed;    bottom: 0;    width: 100%;">
<%@include file="footer.jsp" %>

</div>

</body>
</html>