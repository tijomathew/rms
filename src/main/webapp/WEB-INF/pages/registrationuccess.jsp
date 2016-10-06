<%--
  Created by IntelliJ IDEA.
  User: bibin
  Date: 5/10/16
  Time: 2:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="tagLibraryTemplate.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List,org.rms.models.ParentNode" %>
<%@ page import="org.rms.models.StudentNode" %>
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
            <div class="col-xs-12">
                <div class="alert alert-success fade in">
                    You have successfully registered and given consent to below given students for attending Christine
                    retreat!!..<strong>Your family ID is ${sessionScope.parentNodeEntry.id}</strong> and Student IDs are
                    given below.
                </div>
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>Student ID</th>
                            <th>Name</th>
                            <th>Class</th>
                            <th>Section</th>
                            <th>Dates</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${sessionScope.parentNodeEntry.studentNodeList}" var="studentNodeEntry">
                            <tr>
                                <td>${studentNodeEntry.id}</td>
                                <td>${studentNodeEntry.firstName} ${studentNodeEntry.lastName} </td>
                                <td>${studentNodeEntry.classDivision}</td>
                                <td>${studentNodeEntry.retreatSection}</td>
                                <td><c:if test="${not empty studentNodeEntry.dayOne}">
                                    ${studentNodeEntry.dayOne}<br>
                                </c:if><c:if test="${not empty studentNodeEntry.dayTwo}">
                                    ${studentNodeEntry.dayTwo}<br>
                                </c:if><c:if test="${not empty studentNodeEntry.dayThree}">
                                    ${studentNodeEntry.dayThree}<br>
                                </c:if><c:if test="${not empty studentNodeEntry.dayFour}">
                                    ${studentNodeEntry.dayFour}
                                </c:if></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

                <div>
                    Dear ${sessionScope.parentNodeEntry.firstName} ${sessionScope.parentNodeEntry.lastName},<br>
                    The consent form is necessary to allow Syro-Malabar catholic Community / Church to provide
                    the best ‘duty of care’ to the children in its care during the events as mentioned below. It
                    gives permission for your son / daughter to take part and also necessary to ensure
                    Children’s leaders are aware of any medical, learning issues associated with your son /
                    daughter so that we can give them a positive and engaging experience.<br>

                    Event / Activity : Christeen Retreat from October 29 to 1st November 2016 from 9.30 AM to
                    5.30 PM<br>
                    Venue : Phibblestown Community Centre, Clonee, Blanchardstown, Dublin -15.<br>
                    1. I have read all the information provided concerning the programme of the above
                    activity.<br>
                    2. I hereby give permission for my son / daughter / ward to participate in the above
                    activity.<br>
                    3. I accept that my child may be included in photos/videos from the above activity that
                    might be published by the parish.<br>
                    4. Syro- Malabar Catholic Community / Church only accept liability or responsibility for an
                    incident or accident caused by the negligence or breach of statutory duty of the
                    organisation its servants or agents.<br>
                </div>

                <div class="alert alert-info fade in">
                    <strong>Note!</strong> Please remember and bring ‘Student ID’ when you come for the retreat!.
                </div>
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
