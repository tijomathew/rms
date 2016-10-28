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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <spring:url value="/resources/css/style.css" var="stylecss"/>
    <link href="${stylecss} " rel="stylesheet">

    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function () {
            $('#email-submit').click(function () {
                $("#email-submit").val('Searching');
                $("#email-form").submit();
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
                <div class="panel-heading headerColor">Enter Email</div>
                <div class="panel-body">
                    <form:form role="form" id="email-form"
                               action="${pageContext.request.contextPath}/getRegisteredEntry.action"
                               method="post" modelAttribute="searchEditParent">
                        <div class="row generalFormLayout">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="registeredEmail">Registered Email:<span
                                            style="color: red">*</span></label>
                                    <form:input path="email" id="registeredEmail" class="form-control" required="true"
                                                placeholder="Registered Email"/>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input type="submit" value="Submit" id="email-submit"
                                               class="btn btn-primary commonGreenBtn"/>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </form:form>
                </div>
            </div>
            <c:if test="${not hideErrorMessageDiv}">
                <div style="font-size: 15px;text-align: center;color: #a94442;padding: 1px;margin: 8px auto;display:block"
                     class="alert alert-danger">The entered mailID do not registered with our system!!Please try with
                    another emailID.
                </div>
            </c:if>

        </div>
    </div>
</div>

<%@include file="footer.jsp" %>

</body>
</html>