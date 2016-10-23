<%--
  Created by IntelliJ IDEA.
  User: bibin
  Date: 13/10/16
  Time: 11:22 AM
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

</head>
<body>
<%@ include file="headerTemplate.jsp" %>
<section id="login" style="height: 98%;margin-top: 74px;">
    <form:form class="form-horizontal" action="${pageContext.request.contextPath}/loggedin.action"
               modelAttribute="loginUser" id="login-form">
        <div class="form-group">
            <label class="control-label col-sm-2" for="email">Email:</label>

            <div class="col-sm-10">
                <form:input path="email" class="form-control" id="email" placeholder="email" required="true"/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="pwd">Password:</label>

            <div class="col-sm-10">
                <form:password path="password" class="form-control" id="pwd" placeholder="Password"
                               required="true"/>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <form:errors class="alert alert-danger" role="alert" id="loginErrorDisplay"></form:errors>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10" style="text-align: center;">
                <input type="submit" class="btn btn-primary addButton commonGreenBtn" style="position: absolute;
    top: 50%;width: 215px;" value="Log in"/>
            </div>
        </div>
    </form:form>
</section>
<%@include file="footer.jsp" %>
</body>
</html>
