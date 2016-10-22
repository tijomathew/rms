<%--
  Created by IntelliJ IDEA.
  User: bibin
  Date: 22/10/16
  Time: 11:33 AM
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
<p class="alert alert-info fade in text-center" style="margin-top:30px;">
    <strong>An E-mail entered is not registered with our system. Please enter the registered Email-ID</strong><br>
    <a href="email.action"> Go Back</a>
</p>
<%@include file="footer.jsp" %>
</body>
</html>
