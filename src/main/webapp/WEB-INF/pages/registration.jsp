<%--
  Created by IntelliJ IDEA.
  User: bibin
  Date: 5/10/16
  Time: 9:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="tagLibraryTemplate.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>RMS</title>
    <spring:url value="/resources/css/styles.min.css" var="stylemincss"/>
    <link href="${stylemincss} " rel="stylesheet">
    <spring:url value="/resources/css/style.css" var="stylecss"/>
    <spring:url value="/resources/css/bootstrap.min.css" var="bootstrapCSS"/>
    <link href="${stylecss} " rel="stylesheet">
    <link href="${bootstrapCSS} " rel="stylesheet">
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function () {
            $('#studentInfo')
                // Add button click handler
                    .on('click', '.addButton', function () {
                        generateStudentTemplate();
                    })

                // Remove button click handler
                    .on('click', '.removeButton', function () {
                        var $row = $(this).parents('.form-group'),
                                index = $row.attr('studentNodes-index');

                        // Remove element containing the fields
                        $row.remove();
                        $('#studentInfo div.form-group').each(function (idx) {
                            var $inputs = $(this).find(':input:not(button)');
                            $inputs.each(function () {
                                var $prop = $(this).attr('name').split(".")[1];
                                $(this).attr('name', 'studentNodeList[' + idx + '].' + $prop).attr('id', 'studentNodeList[' + idx + '].' + $prop);
                            });
                        });
                    });

        });
    </script>
    <script type="text/javascript">
        function generateStudentTemplate() {
            var i = ($('.childRows').length + 1);

            if (i < 7) {
                var $template = $('#studentInfoTemplate'),
                        $clone = $template
                                .clone()
                                .attr('studentNodes-index', i)
                                .attr('id', 'child' + i)
                                .attr('class', 'form-group childRows')
                                .appendTo($('#studentInfo'));

                // Update the name attributes
                $clone
                        .find('[name="studentNodeList[0].id"]').val('').attr('name', 'studentNodeList[' + i + '].id').attr('id', 'id' + i).end()
                        .find('[name="studentNodeList[0].firstName"]').val('').attr('name', 'studentNodeList[' + i + '].firstName').attr('id', 'firstName' + i).end()
                        .find('[name="studentNodeList[0].lastName"]').val('').attr('name', 'studentNodeList[' + i + '].lastName').attr('id', 'lastName' + i).end()
                        .find('[name="studentNodeList[0].classDivision"]').val('').attr('name', 'studentNodeList[' + i + '].classDivision').attr('id', 'classDivision' + i).end()
                        .find('[name="studentNodeList[0].retreatSection"]').val('').attr('name', 'studentNodeList[' + i + '].retreatSection').attr('id', 'retreatSection' + i).end()
                        .find('[name="studentNodeList[0].dayOne"]').attr('checked', false).attr('name', 'studentNodeList[' + i + '].dayOne').attr('id', 'dayOne' + i).end()
                        .find('[name="studentNodeList[0].dayTwo"]').attr('checked', false).attr('name', 'studentNodeList[' + i + '].dayTwo').attr('id', 'dayTwo' + i).end()
                        .find('[name="studentNodeList[0].dayThree"]').attr('checked', false).attr('name', 'studentNodeList[' + i + '].dayThree').attr('id', 'dayThree' + i).end()
                        .find('[name="studentNodeList[0].dayFour"]').attr('checked', false).attr('name', 'studentNodeList[' + i + '].dayFour').attr('id', 'dayFour' + i).end()
                        .find('[name = actionButton]').removeAttr('class').attr('class', 'btn btn-default removeButton').find('.fa-plus').removeAttr('class').attr('class', 'fa fa-minus');

            }

        }

    </script>
</head>
<header class="navbar navbar-inverse navbar-fixed-top" role="banner">
    <a id="leftmenu-trigger" class="tooltips" data-toggle="tooltip" data-placement="bottom" title="Toggle Sidebar"></a>
    <a id="rightmenu-trigger" class="tooltips" data-toggle="tooltip" data-placement="bottom"></a>

    <div class="navbar-header pull-left">
        <a class="navbar-brand" href="#"><span id=image-text><span
                style="font-size: 27px;font-style: italic;">Syro-Malabar Catholic Church </span><br>Dublin-Ireland<br>Retreat Registration Form</span></a>
    </div>
</header>

<body>
<section id="login" style="height: 98%">
    <div class="container">
        <div class="row">
            <p class="col-xs-12">

            <p class="form-wrap">
                <form:form role="form" id="registration-form" modelAttribute="parentNodeForm"
                           action="${pageContext.request.contextPath}/createregistration.action"
                           method="post" class="form-inline">

            <div class="panel panel-primary">
                <div class="panel-heading">Parent Details</div>
                <div class="panel-body" id="parentInfoTemplate">
                    <div class="form-group">
                        <label for="massCentreName">MassCentre:</label>
                        <form:select path="massCentreName">
                            <form:option value="One">One</form:option>
                            <form:option value="Two">Two</form:option>
                            <form:option value="Three">Three</form:option>
                            <form:option value="Four">Four</form:option>
                            <form:option value="Five">Five</form:option>
                            <form:option value="Six">Six</form:option>
                            <form:option value="Seven">Seven</form:option>
                            <form:option value="Eight">Eight</form:option>
                            <form:option value="Nine">Nine</form:option>
                            <form:option value="Ten">Ten</form:option>
                        </form:select>
                    </div>
                    <div class="form-group">
                        <label for="firstName">First Name:</label>
                        <form:input path="firstName" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label for="lastName">Last Name:</label>
                        <form:input path="lastName" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label for="phoneNumber">Phone 1:</label>
                        <form:input path="phoneNumber" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label for="alternativePhoneNumber">Phone 2:</label>
                        <form:input path="alternativePhoneNumber" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label for="alternativePhoneNumber">Email:</label>
                        <form:input path="email" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label for="address">Address:</label>
                        <form:textarea path="address" class="form-control"/>
                    </div>
                </div>
            </div>

            <div class="panel panel-primary" id="studentInfo" s>
                <div class="panel-heading">Student Details</div>
                <div class="panel-body" id="studentInfoTemplate">
                    <div class="form-group">
                        <label for="firstName">First Name:</label>
                        <form:input path="studentNodeList[0].firstName" class="form-control" id="firstName0"/>
                        <form:hidden path="studentNodeList[0].id" class="form-control" id="id0"/>
                    </div>
                    <div class="form-group">
                        <label for="lastName"> Last Name:</label>
                        <form:input class="form-control"
                                    path="studentNodeList[0].lastName" id="lastName0"/>
                    </div>
                    <div class="form-group">
                        <label for="studentNodeList[0].classDivision">Class:</label>
                        <form:select class="form-control" path="studentNodeList[0].classDivision"
                                     id="classDivision0">
                            <form:option value="c3">Class-3</form:option>
                            <form:option value="c4">Class-4</form:option>
                            <form:option value="c5">Class-5</form:option>
                            <form:option value="c6">Class-6</form:option>
                            <form:option value="y1">Year-1</form:option>
                            <form:option value="y2">Year-2</form:option>
                            <form:option value="y3">Year-3</form:option>
                            <form:option value="y4">Year-4</form:option>
                            <form:option value="y5">Year-5</form:option>
                            <form:option value="y6">Year-6</form:option>
                            <form:option value="g">Graduate</form:option>
                            <form:option value="p">PG</form:option>
                            <form:option value="o">Other</form:option>
                        </form:select>
                    </div>
                    <div class="form-group">
                        <label for="studentNodeList[0].retreatSection">Section:</label>
                        <form:select class="form-control" path="studentNodeList[0].retreatSection"
                                     id="retreatSection0">
                            <form:option value="Junior">Junior</form:option>
                            <form:option value="Senior">Senior</form:option>
                            <form:option value="SuperSenior">Super Senior</form:option>
                            <form:option value="Other">Other</form:option>
                        </form:select>
                    </div>
                    <div class="form-group">
                        <label for="studentNodeList[0].dayOne">Oct-29:</label>
                        <form:checkbox class="form-control" path="studentNodeList[0].dayOne"
                                       id="dayOne0"/>
                    </div>
                    <div class="form-group">
                        <label for="studentNodeList[0].dayTwo">Oct-30:</label>
                        <form:checkbox class="form-control" path="studentNodeList[0].dayTwo"
                                       id="dayTwo0"/>
                    </div>
                    <div class="form-group">
                        <label for="studentNodeList[0].dayThree">Oct-31:</label>
                        <form:checkbox class="form-control" path="studentNodeList[0].dayThree"
                                       id="dayThree0"/>
                    </div>
                    <div class="form-group">
                        <label for="studentNodeList[0].dayFour">Nov-4:</label>
                        <form:checkbox class="form-control" path="studentNodeList[0].dayFour"
                                       id="dayFour0"/>
                    </div>
                    <p>
                        <button type="button" class="btn btn-default addButton" id="" name="actionButton"><i
                                class="fa fa-plus"></i></button>
                    </p>
                </div>
            </div>

            <div class="panel panel-primary">
                <div class="panel-heading">Consent Info</div>
                <div class="panel-body" id="consentInfoTemplate">
                    <div>
                        Dear Parents / Guardean,<br><br>
                        The consent form is necessary to allow Syro-Malabar catholic Community / Church to provide
                        the best ‘duty of care’ to the children in its care during the events as mentioned below. It
                        gives permission for your son / daughter to take part and also necessary to ensure
                        Children’s leaders are aware of any medical, learning issues associated with your son /
                        daughter so that we can give them a positive and engaging experience.<br><br>

                        Event / Activity : Christeen Retreat from October 29 to 1st November 2016 from 9.30 AM to
                        5.30 PM<br><br>
                        Venue : Phibblestown Community Centre, Clonee, Blanchardstown, Dublin -15.<br><br>
                        1. I have read all the information provided concerning the programme of the above
                        activity.<br><br>
                        2. I hereby give permission for my son / daughter / ward to participate in the above
                        activity.<br><br>
                        3. I accept that my child may be included in photos/videos from the above activity that
                        might be published by the parish.<br><br>
                        4. Syro- Malabar Catholic Community / Church only accept liability or responsibility for an
                        incident or accident caused by the negligence or breach of statutory duty of the
                        organisation its servants or agents.<br><br>
                    </div>
                    <form:checkbox path="consentSigned"/>By checking the checkbox, you are giving your consent
                    for the above
                    students.
                </div>
            </div>
            <input type="submit" value="Save"/>
            </form:form>
        </div>
    </div>
    <!-- /.col-xs-12 -->
    </div>
    <!-- /.row -->
    </div>
    <!-- /.container -->
</section>

<footer id="footer" style="margin-top: 3px; margin: auto" class="navbar-inverse">
    <div class="container" style="margin: auto;
    padding-top: 6px;">
        <div class="row">
            <div class="col-xs-12 ">
                <p style="color: #fff">RMS © - 2016</p>
            </div>
        </div>
    </div>
</footer>

</body>
</html>
