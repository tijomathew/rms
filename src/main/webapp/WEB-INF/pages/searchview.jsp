<%--
  Created by IntelliJ IDEA.
  User: bibin
  Date: 28/10/16
  Time: 10:50 PM
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
                window.location.href = "searchviewentry.action";
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
            <c:if test="${currentUser.systemRole == 'ADMIN'}">
                <li><a href="adduser.action">Add Users</a></li>
            </c:if>
            <li><a href="checkinsearch.action">Check In</a></li>
            <li><a href="checkoutsearch.action">Check Out</a></li>
            <li><a href="registration.action">Registration</a></li>
            <li><a href="getEditParentEntryForm.action">Edit</a></li>
            <li class="active"><a href="searchviewentry.action">Search</a></li>
            <li><a href="reportpage.action">Report</a></li>
            <li><a href="logout.action">Logout</a></li>
        </ul>
    </div>
    <div class="mainWrapper">
        <div class="row row-offcanvas row-offcanvas-right">
            <br class="col-xs-12 col-sm-12">
            <br class="panel panel-default">

            <div class="panel-heading headerColor">Search Result</div>
            <br class="panel-body">
            <br class="col-md-12">

            <label>Mass Centre
                Name: </label> <c:if
                test="${not empty searchParent.massCentreName}">${searchParent.massCentreName}</c:if> </br>
            <label>Parent/Guardian's
                Name: </label> <c:if
                test="${not empty searchParent.firstName}">${searchParent.firstName}</c:if><c:if
                test="${not empty searchParent.lastName}"> ${searchParent.lastName}</c:if>
            <label>Phone - 1: </label>   <c:if
                test="${not empty searchParent.phoneNumber}">${searchParent.phoneNumber}</c:if></br>
            <label>Phone -2: </label> <c:if
                test="${not empty searchParent.alternativePhoneNumber}"> ${searchParent.alternativePhoneNumber}</c:if>
            <label>Email: </label>   <c:if
                test="${not empty searchParent.email}">${searchParent.email}</c:if></br>
            <label>Address:</label>
            <c:if test="${not empty searchParent.houseNo}"> ${searchParent.houseNo}</c:if>
            <c:if
                    test="${not empty searchParent.addressLineOne}"> ${searchParent.addressLineOne}</c:if>
            <c:if
                    test="${not empty searchParent.addressLineTwo}"> ${searchParent.addressLineTwo}</c:if>
            <c:if
                    test="${not empty searchParent.addressLineThree}"> ${searchParent.addressLineThree}</c:if>

        </div>
        <div class="col-md-12">
            <c:forEach items="${searchParent.studentNodeList}" var="element"
                       varStatus="count">
                <div class="col-md-3">
                    <label>Child's Name:</label><c:if
                        test="${not empty element.firstName}">${element.firstName} </c:if><c:if
                        test="${not empty element.lastName}"> ${element.lastName}</c:if>
                </div>
                <div class="col-md-3">
                    <label>Section:</label><span style="background-color: red;color: white"><c:if
                        test="${not empty element.retreatSection}">${element.retreatSection}</c:if></span></br>
                </div>
                <div class="col-md-2">
                    <label>Band Code:</label><span><c:if
                        test="${not empty element.bandCode}">${element.bandCode}</c:if></span></br>
                </div>
                <div class="col-md-4">
                    <label>Days:</label>
                    <c:if
                            test="${not empty element.dayOne}">${element.dayOne}, </c:if>
                    <c:if
                            test="${not empty element.dayTwo}">${element.dayTwo} , </c:if>
                    <c:if
                            test="${not empty element.dayThree}">${element.dayThree} , </c:if>
                    <c:if
                            test="${not empty element.dayFour}">${element.dayFour}  </c:if>

                </div>

            </c:forEach>
            <div class="col-md-12">
                <div style="margin-top: 30px;">
                    <input type="button" value="Go back" id="email-submit"
                           class="btn btn-primary commonGreenBtn"/>
                </div>
            </div>

        </div>

    </div>
</div>


</div>
</div>
</div>
</div>
<%@include file="footer.jsp" %>

</body>
</html>
