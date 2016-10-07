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
            $('#finishButton').click(function () {
                window.location.href = "http://www.syromalabar.ie/";
            });
        });
    </script>

</head>
<body>
<%@ include file="headerTemplate.jsp" %>

<div class="mainWrapper">
    <div class="row row-offcanvas row-offcanvas-right">
        <div class="col-xs-12 col-sm-12"></div>
        <h3 class="defaultBold" style="color: #40a297 !important;">Success</h3>

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
                            ${studentNodeEntry.dayOne}&nbsp;&nbsp;
                        </c:if><c:if test="${not empty studentNodeEntry.dayTwo}">
                            ${studentNodeEntry.dayTwo}&nbsp;&nbsp;
                        </c:if><c:if test="${not empty studentNodeEntry.dayThree}">
                            ${studentNodeEntry.dayThree}&nbsp;&nbsp;
                        </c:if><c:if test="${not empty studentNodeEntry.dayFour}">
                            ${studentNodeEntry.dayFour}
                        </c:if></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <div>
            <p>
                Dear ${sessionScope.parentNodeEntry.firstName} ${sessionScope.parentNodeEntry.lastName},
            </p>

            <p>
                The consent form is necessary to allow Syro-Malabar catholic Community / Church to provide
                the best ‘duty of care’ to the children in its care during the events as mentioned below. It
                gives permission for your son / daughter to take part and also necessary to ensure
                Children’s leaders are aware of any medical, learning issues associated with your son /
                daughter so that we can give them a positive and engaging experience.
            </p>

            <p>
                <i> Event / Activity : Christeen Retreat from October 29 to 1st November 2016 from 9.30 AM to
                    5.30 PM</i>
            </p>

            <p>
                <i>Venue : Phibblestown Community Centre, Clonee, Blanchardstown, Dublin -15.</i>
            </p>

            <p>
                1. I have read all the information provided concerning the programme of the above
                activity.<br>
                2. I hereby give permission for my son / daughter / ward to participate in the above
                activity.<br>
                3. I accept that my child may be included in photos/videos from the above activity that
                might be published by the parish.<br>
                4. Syro- Malabar Catholic Community / Church only accept liability or responsibility for an
                incident or accident caused by the negligence or breach of statutory duty of the
                organisation its servants or agents.<br>
            </p>

            <p class="alert alert-info fade in text-center" style="margin-top:30px;">
                <strong>Note!</strong> Please remember and bring ‘Student ID’ when you come for the retreat!.
            </p>

        </div>

        <div style="text-align: center">
            <button type="button" alue="Finish" class="btn btn-primary commonGreenBtn" style="min-width:140px;"
                    id="finishButton">Finish
            </button>
        </div>
    </div>
</div>
<div style="    bottom: 0;    width: 100%;">
    <%@include file="footer.jsp" %>

</div>
>

</body>
</html>
