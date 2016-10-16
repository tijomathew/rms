<%--
  Created by IntelliJ IDEA.
  User: bibin
  Date: 16/10/16
  Time: 8:37 PM
  To change this template use File | Settings | File Templates.
--%>
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
            $('#changePasswordContainer').show();
            $('#successContainer').hide();
            $('#passwordMismatchContainer').hide();

            $('#changePasswordButton').click(function () {
                globalSubmissionOfForms('changePasswordForm');
            });
        });

    </script>

</head>
<body>
<%@ include file="headerTemplate.jsp" %>
<div>
<form:form modelAttribute="changePasswordUser"
           action="${pageContext.request.contextPath}/changepassword.action"
           id="changePasswordForm" method="post" class="form-horizontal">
    <div class="form-group">
        <div class="col-sm-11" style="padding-right: 0px;">
            <form:password path="newPassword" id="login-username" class="form-control"
                           placeholder="New Password"/>
            <form:hidden path="email"/>
        </div>
        <div class="col-sm-1" style="padding-top: 8px;padding-left: 8px;">
                            <span class="glyphicon glyphicon-question-sign" aria-hidden="true" data-toggle="tooltip"
                                  data-placement="top" title="enter new password"></span>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-11" style="padding-right: 0px;">
            <form:password path="confirmPassword" id="login-password" class="form-control"
                           placeholder="Confirm Password"/>
        </div>
        <div class="col-sm-1" style="padding-top: 8px;padding-left: 8px;">
                            <span class="glyphicon glyphicon-question-sign" aria-hidden="true" data-toggle="tooltip"
                                  data-placement="top" title="confirm new password"></span>
        </div>
    </div>
    <div style="font-size: 15px;text-align: center;color: #a94442;padding: 1px;margin: 8px auto;display:block" class="alert alert-danger" id="passwordMismatchContainer">Passwords are mismatching.</div>
    <div style="margin-top:10px" class="row">
        <div class="col-sm-12 controls text-center">
            <input class="btn btn-lg btn-success btn-block" type="button" value="Change Password"
                   id="changePasswordButton"/>
        </div>
    </div>
</form:form>
</div>
<%@include file="footer.jsp" %>
</body>
</html>
