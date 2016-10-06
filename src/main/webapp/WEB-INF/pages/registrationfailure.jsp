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
    <spring:url value="/resources/css/styles.min.css" var="stylemincss"/>
    <link href="${stylemincss} " rel="stylesheet">
    <spring:url value="/resources/css/style.css" var="stylecss"/>
    <spring:url value="/resources/css/bootstrap.min.css" var="bootstrapCSS"/>
    <link href="${stylecss} " rel="stylesheet">
    <link href="${bootstrapCSS} " rel="stylesheet">
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function () {

        });
    </script>

</head>
<header class="navbar navbar-inverse navbar-fixed-top" role="banner">
    <a id="leftmenu-trigger" class="tooltips" data-toggle="tooltip" data-placement="bottom" title="Toggle Sidebar"></a>
    <a id="rightmenu-trigger" class="tooltips" data-toggle="tooltip" data-placement="bottom"></a>

    <div class="navbar-header pull-left">
        <a class="navbar-brand" href="#"><span id=image-text><span
                style="font-size: 27px;font-style: italic;">Syro-Malabar Catholic Church </span><br>Dublin-Ireland</span></a>
    </div>
</header>

<body>
<section id="login" style="height: 98%">
    <div class="container">
        <div class="row">
            <div class="alert alert-danger">
                <strong>Failure!</strong> Your registration is failed. Please make sure that your email ID is not
                registered with our system.
            </div>
        </div>
    </div>
    <!-- /.col-xs-12 -->
    </div>
    <!-- /.row -->
    </div>
    <!-- /.container -->
</section>

<%@include file="footer.jsp" %>

</body>
</html>