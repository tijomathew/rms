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
</head>


<body>
<%@ include file="headerTemplate.jsp" %>
  <div class="mainWrapper">
    <div class="row row-offcanvas row-offcanvas-right">
      <div class="col-xs-12 col-sm-12">
        <h3 class="defaultBold">Email Form</h3>

        <div class="panel panel-default">
          <div class="panel-heading headerColor">Enter Email Details</div>
          <div class="panel-body">
          <form role="form" id="email-form"
             action="${pageContext.request.contextPath}/getRegisteredFamilyDetails.action"
             method="post">
            <div class="row generalFormLayout">
              <div class="col-md-6">
                <div class="form-group">
                  <label for="registeredEmail">Registered Email:<span style="color: red">*</span></label>
                  <input name="registeredEmail" id="registeredEmail" class="form-control" required="true" placeholder="First Name"/>
                </div>
              </div>

              <div class="col-md-6">
                <div class="form-group">
                  <input type="submit" value="Submit"/>
                </div>
              </div>

            </div>

          </form>
          </div>
        </div>




      </div>
    </div>
  </div>

<%@include file="footer.jsp" %>

</body>
</html>
