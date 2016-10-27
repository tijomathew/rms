<%--
  Created by IntelliJ IDEA.
  User: cufa-01
  Date: 19/10/16
  Time: 5:05 PM
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
    <script type="text/javascript">
        jQuery(document).ready(function () {
            $('#email-submit').click(function () {
                $("#email-submit").val('Searching Children');
                $("#email-form").submit();
            });
        });
    </script>
</head>


<body>
<%@ include file="headerTemplate.jsp" %>
<div style="width: 100%;height: 90%;">
    <div class="container">
        <ul class="nav nav-pills">
            <li><a href="showcounts.action">Show Counts</a></li>
            <li><a href="adduser.action">Add Users</a></li>
            <li><a href="checkinsearch.action">Check In</a></li>
            <li class="active"><a href="checkoutsearch.action">Check Out</a></li>
            <li><a href="getEditParentEntryForm.action">Edit</a></li>
            <li><a href="#">Report</a></li>
            <li><a href="logout.action">Logout</a></li>
        </ul>
    </div>
    <div class="mainWrapper">
        <div class="row row-offcanvas row-offcanvas-right">
            <div class="col-xs-12 col-sm-12">
                <div class="panel panel-default">
                    <div class="panel-heading headerColor">Search Criteria</div>
                    <div class="panel-body">
                        <form:form role="form" id="checkinsearch-form"
                                   action="${pageContext.request.contextPath}/checkoutview.action"
                                   method="post" modelAttribute="searchCheckOutParentNode">
                            <div class="row generalFormLayout">
                                <div class="col-md-12">
                                    <div class="col-md-6">
                                        <label for="firstName">Parent/Guardian First Name:</label>
                                        <form:input path="firstName" id="firstName" class="form-control"
                                                    placeholder="Parent/Guardian First Name"/>
                                    </div>
                                    OR
                                    <div class="col-md-6">
                                        <label for="lastName">Parent/Guardian Last Name:</label>
                                        <form:input path="lastName" id="lastName" class="form-control"
                                                    placeholder="Parent/Guardian Last Name"/>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="col-md-6">
                                        <label for="id">Family ID:</label>
                                        <form:input path="id" id="id" class="form-control"
                                                    placeholder="Family ID"/>
                                    </div>
                                    OR
                                    <div class="col-md-6">
                                        <label for="childBandCode">Child Band Code:</label>
                                        <form:input path="childBandCode" id="childBandCode"
                                                    class="form-control"
                                                    placeholder="Child Band Code"/>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="col-md-6">
                                        <label for="childFirstName">Child First Name:</label>
                                        <form:input path="childFirstName" id="childFirstName" class="form-control"
                                                    placeholder="Child First Name"/>
                                    </div>
                                    OR
                                    <div class="col-md-6">
                                        <label for="childLastName">Child Last Name:</label>
                                        <form:input path="childLastName" id="childLastName"
                                                    class="form-control" placeholder="Child Last Name"/>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div style="margin-top: 30px;">
                                        <input type="submit" value="Search" id="email-submit"
                                               class="btn btn-primary commonGreenBtn"/>
                                    </div>
                                </div>

                            </div>

                        </form:form>
                    </div>
                </div>
                <c:if test="${not hideErrorMessageDiv}">
                    <div style="font-size: 15px;text-align: center;color: #a94442;padding: 1px;margin: 8px auto;display:block;font-weight: bold"
                         class="alert alert-danger">Search not Found.
                    </div>
                </c:if>
                <c:if test="${not hideSuccessMessageDiv}">
                    <div class="alert alert-success" role="alert">
                        Successfully done Check-Out.
                    </div>
                </c:if>

            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp" %>

</body>
</html>
