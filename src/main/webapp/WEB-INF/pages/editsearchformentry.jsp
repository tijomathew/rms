<%--
  Created by IntelliJ IDEA.
  User: tijo
  Date: 27/10/16
  Time: 9:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="tagLibraryTemplate.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Event Manager</title>
    <spring:url value="/resources/css/bootstrap.min.css" var="bootstrapcss"/>
    <link href="${bootstrapcss} " rel="stylesheet">

    <spring:url value="/resources/css/style.css" var="stylecss"/>
    <link href="${stylecss} " rel="stylesheet">

    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function () {
            $('#email-submit').click(function () {
                $("#email-submit").val('Searching');
                var isValid = false;
                $("input").each(function () {
                    var element = $(this);
                    if (element.val() != "") {
                        isValid = true;
                    }
                });

                if (isValid) {
                    $('#email-form').submit();
                } else {
                    alert('atleast enter a value for single input');
                }
            });
        });
    </script>
</head>


<body>
<%@ include file="headerTemplate.jsp" %>
<div class="container">
    <ul class="nav nav-pills">
        <li><a href="showcounts.action">Show Counts</a></li>
        <c:if test="${currentUser.systemRole == 'ADMIN'}">
            <li><a href="adduser.action">Add Users</a></li>
        </c:if>
        <li><a href="checkinsearch.action">Check In</a></li>
        <li><a href="checkoutsearch.action">Check Out</a></li>
        <li><a href="registration.action">Registration</a></li>
        <li class="active"><a href="getEditParentEntryForm.action">Edit</a></li>
        <li><a href="reportpage.action">Report</a></li>
        <li><a href="logout.action">Logout</a></li>
    </ul>
</div>
<div class="mainWrapper">
    <div class="row row-offcanvas row-offcanvas-right">
        <div class="col-xs-12 col-sm-12">
            <div class="panel panel-default">
                <div class="panel-heading headerColor">Search Criteria</div>
                <div class="panel-body">
                    <form:form role="form" id="email-form"
                               action="${pageContext.request.contextPath}/getRegisteredEntry.action"
                               method="post" modelAttribute="searchEditParent">
                        <div class="row generalFormLayout">
                            <div class="row generalFormLayout">
                                <div class="col-md-12">
                                    <div class="col-md-6">
                                        <label for="childId">Child ID:</label>
                                        <form:input path="childId" id="childId"
                                                    class="form-control"
                                                    placeholder="Child ID"/>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="col-md-6">
                                        <label for="childFirstName">Child First Name:</label>
                                        <form:input path="childFirstName" id="childFirstName" class="form-control"
                                                    placeholder="Child First Name"/>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="childLastName">Child Last Name:</label>
                                        <form:input path="childLastName" id="childLastName"
                                                    class="form-control" placeholder="Child Last Name"/>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="col-md-6">
                                        <label for="id">Family ID:</label>
                                        <form:input path="id" id="id" class="form-control"
                                                    placeholder="Family ID"/>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="col-md-6">
                                        <label for="firstName">Parent/Guardian First Name:</label>
                                        <form:input path="firstName" id="firstName" class="form-control"
                                                    placeholder="Parent/Guardian First Name"/>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="lastName">Parent/Guardian Last Name:</label>
                                        <form:input path="lastName" id="lastName" class="form-control"
                                                    placeholder="Parent/Guardian Last Name"/>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div style="margin-top: 30px;">
                                        <input type="submit" value="Edit" id="email-submit"
                                               class="btn btn-primary commonGreenBtn" style="width: 124px;"/>
                                    </div>
                                </div>

                            </div>

                        </div>

                    </form:form>
                </div>
            </div>
            <c:if test="${not hideErrorMessageDiv}">
                <div style="font-size: 15px;text-align: center;color: #a94442;padding: 1px;margin: 8px auto;display:block"
                     class="alert alert-danger">Search not Found.
                </div>
            </c:if>

        </div>
    </div>
</div>

<%@include file="footer.jsp" %>

</body>
</html>