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
                $("#email-submit").val('Sending Password');
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
            <li><a href="#">Edit</a></li>
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
                                   action="${pageContext.request.contextPath}/getEmail.action"
                                   method="post" modelAttribute="searchParentNode">
                            <div class="row generalFormLayout">
                                <div class="col-md-12">
                                    <div class="col-md-6">
                                        <label for="email">Email:</label>
                                        <form:input path="email" id="email" class="form-control"
                                                    placeholder="Registered Email"/>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="id">Family ID:</label>
                                        <form:input path="id" id="id" class="form-control" placeholder="Family ID"/>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="col-md-6">
                                        <label for="id">Phone No.1:</label>
                                        <form:input path="phoneNumber" id="phoneNumber" class="form-control"
                                                    placeholder="Phone No1"/>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="id">Phone No.2:</label>
                                        <form:input path="alternativePhoneNumber" id="alternativePhoneNumber"
                                                    class="form-control" required="true"
                                                    placeholder="Phone No.2"/>
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


            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp" %>
</body>
</html>
