<%--
  Created by IntelliJ IDEA.
  User: tijo
  Date: 19/10/16
  Time: 4:54 PM
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
    <spring:url value="/resources/css/leftslider.css" var="slidercss"/>

    <link href="${stylecss} " rel="stylesheet">
    <link href="${slidercss} " rel="stylesheet">

    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>

    <script type="text/javascript">
        jQuery(document).ready(function () {


            $('#addUserButton').click(function () {

                var $form = $('#userForm');
                var data = $('#userForm').serialize();

                $.ajax({
                    type: $form.attr('method'),
                    url: $form.attr('action'),
                    data: data,
                    success: function (response) {
                        if (response == 'success') {
                            $('#changePasswordContainer').show();
                            $('#passwordMismatchContainer').show();
                        }
                        else if (response == 'mailfail') {
                            $('#changePasswordContainer').hide();
                            $('#passwordMismatchContainer').hide();
                            $('#successContainer').show();
                        } else if (response == 'fail') {
                            $('#changePasswordContainer').hide();
                            $('#passwordMismatchContainer').hide();
                            $('#successContainer').show();
                        }

                    }
                });
            });
        });

    </script>
</head>
<body>
<%@ include file="headerTemplate.jsp" %>
<div style="width: 100%;height: 90%;">
    <%@ include file="leftmenupanel.jsp" %>
    <form:form modelAttribute="newUser"
               action="${pageContext.request.contextPath}/addnewuser.action"
               method="post" id="userForm"
               class="form-horizontal nomargin">

        <div class="tab-content">

            <div class="tab-pane active" id="user1">

                <div class="col-md-12">
                    <div class="panel">

                        <div class="form-group">
                            <label for="systemRole"
                                   class="col-sm-2 control-label required">System
                                Role</label>

                            <div class="col-sm-3">
                                <form:select
                                        path="systemRole"
                                        id="systemRole"
                                        class="form-control toaddUnderScore">
                                    <form:option value="ORGANIZER">ORGANIZER</form:option>
                                    <form:option value="RETREAT_USER">RETREAT USER</form:option>
                                </form:select>
                            </div>
                        </div>


                        <div class="form-group">

                            <label for="email"
                                   class="col-sm-2 control-label required">Email</label>

                            <div class="col-sm-3"
                                 id="email">
                                <form:input
                                        path="email"
                                        id="email"
                                        class="form-control"/>
                            </div>
                            <div style="margin-top:10px" class="row">
                                <div class="col-sm-12 controls text-center">
                                    <input class="btn btn-lg btn-success btn-block" type="button" value="Add User"
                                           id="addUserButton"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form:form>
</div>
<div style="font-size: 15px;text-align: center;color: #a94442;padding: 1px;margin: 8px auto;display:block"
     class="alert alert-danger" id="passwordMismatchContainer">Passwords are mismatching.
</div>

<div class="alert alert-success" role="alert" id="successContainer">
    Password is updated successfully.<br/>
    Please <a href="login.action"> re-login</a> to continue the system use.
</div>
<%@include file="footer.jsp" %>
</body>
</html>
