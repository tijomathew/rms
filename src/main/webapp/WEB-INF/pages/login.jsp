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
<section id="login" style="height: 98%">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div class="form-wrap">
                    <h1>Log in with your account</h1>
                    <form:form role="form" action="${pageContext.request.contextPath}/loggedin.action"
                               modelAttribute="loginUser" id="login-form">
                        <div class="form-group">
                            <label for="email" class="sr-only">Email</label>
                            <form:input path="email" class="form-control" placeholder="email" required="true"/>
                        </div>
                        <div class="form-group">
                            <label for="password" class="sr-only">Password</label>
                            <form:password path="password" class="form-control" placeholder="Password" required="true"/>
                        </div>
                        <input type="submit" id="btn-login" class="btn btn-custom btn-lg btn-block" value="Log in"
                               style="font-weight: bold">
                        <form:errors class="alert alert-danger" role="alert" id="loginErrorDisplay"></form:errors>
                    </form:form>
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
