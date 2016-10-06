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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <spring:url value="/resources/css/style.css" var="stylecss"/>
    <link href="${stylecss} " rel="stylesheet">

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
                        /*$('#studentInfo div.form-group').each(function (idx) {
                         var $inputs = $(this).find(':input:not(button)');
                         $inputs.each(function () {
                         var $prop = $(this).attr('name').split(".")[1];
                         $(this).attr('name', 'studentNodeList[' + idx + '].' + $prop).attr('id', 'studentNodeList[' + idx + '].' + $prop);
                         });
                         });*/
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
                                .attr('class', 'panel-body form-group childRows')
                                .appendTo($('#studentInfo'));

                // Update the name attributes
                $clone
                        .find('[name="studentNodeList[0].id"]').val('').attr('name', 'studentNodeList[' + i + '].id').attr('id', 'id' + i).end()
                        .find('[name="studentNodeList[0].firstName"]').val('').attr('name', 'studentNodeList[' + i + '].firstName').attr('id', 'firstName' + i).end()
                        .find('[name="studentNodeList[0].lastName"]').val('').attr('name', 'studentNodeList[' + i + '].lastName').attr('id', 'lastName' + i).end()
                        .find('[name="studentNodeList[0].classDivision"]').val('').attr('name', 'studentNodeList[' + i + '].classDivision').attr('id', 'classDivision' + i).end()
                        .find('[name="studentNodeList[0].retreatSection"]').val('').attr('name', 'studentNodeList[' + i + '].retreatSection').attr('id', 'retreatSection' + i).end()
                        .find('[name="studentNodeList[0].dayOne"]').val('Oct-29').attr('checked', false).attr('name', 'studentNodeList[' + i + '].dayOne').attr('id', 'dayOne' + i).end()
                        .find('[name="studentNodeList[0].dayTwo"]').val('Oct-30').attr('checked', false).attr('name', 'studentNodeList[' + i + '].dayTwo').attr('id', 'dayTwo' + i).end()
                        .find('[name="studentNodeList[0].dayThree"]').val('Oct-31').attr('checked', false).attr('name', 'studentNodeList[' + i + '].dayThree').attr('id', 'dayThree' + i).end()
                        .find('[name="studentNodeList[0].dayFour"]').val('Nov-1').attr('checked', false).attr('name', 'studentNodeList[' + i + '].dayFour').attr('id', 'dayFour' + i).end()
                        .find('[name = actionButton]').removeAttr('class').attr('class', 'btn btn-default removeButton').text("Remove Student").find('.fa-plus').removeAttr('class').attr('class', 'fa fa-minus');

            }

        }

        function callSectionUpdate(elementId) {

            if(elementId != null){

                var selectedClass = $('#' + elementId).val();
                var sectionId = $('#' + elementId).closest('div.panel-body').find("input[id ^= retreatSection]").attr("id");

                switch (selectedClass) {
                    case "Class-3":
                    case "Class-4":
                    case "Class-5":
                    case "Class-6":
                        $('#' + sectionId).val("Junior");
                        $('#' + sectionId).closest('div.panel-body').find("[id ^= dayFour]").parent('.form-group').hide();
                        break;
                    case "Year-1":
                    case "Year-2":
                    case "Year-3":
                    case "Year-4":
                        $('#' + sectionId).val("Senior");
                        $('#' + sectionId).closest('div.panel-body').find("[id ^= dayFour]").parent('.form-group').hide();
                        break;
                    case "Year-5":
                    case "Year-6":
                    case "Graduate":
                    case "PG":
                        $('#' + sectionId).val("SuperSenior");
                        $('#' + sectionId).closest('div.panel-body').find("[id ^= dayFour]").parent('.form-group').show();
                        break;

                }

            }

        }

    </script>
</head>


<body>
<%@ include file="headerTemplate.jsp"%>
<form:form role="form" id="registration-form" modelAttribute="parentNodeForm"
           action="${pageContext.request.contextPath}/createregistration.action"
           method="post">
    <div class="mainWrapper">
        <div class="row row-offcanvas row-offcanvas-right">
            <div class="col-xs-12 col-sm-12">
                <h3 class="defaultBold">Retreat Registration Form</h3>
                    <div class="panel panel-default">
                        <div class="panel-heading headerColor">Parent Details</div>
                        <div class="panel-body">
                            <div class="row generalFormLayout">
                                <div class="col-md-3">
                                    <div class="form-group">

                                        <label for="massCentreName">MassCentre:</label>
                                        <form:select path="massCentreName" class="form-control">
                                            <form:option value="Beaumont">Beaumont</form:option>
                                            <form:option value="Blanchardstown">Blanchardstown</form:option>
                                            <form:option value="Bray">Bray</form:option>
                                            <form:option value="Inchicore">Inchicore</form:option>
                                            <form:option value="Lucan">Lucan</form:option>
                                            <form:option value="Phibsborough">Phibsborough</form:option>
                                            <form:option value="StJosephs">St.Joseph’s</form:option>
                                            <form:option value="Swords">Swords</form:option>
                                            <form:option value="Tallaght">Tallaght</form:option>
                                            <form:option value="Other">Other</form:option>
                                        </form:select>
                                    </div>

                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="firstName">First Name:</label>
                                        <form:input path="firstName" id = "firstName" class="form-control" required = "true"/>
                                    </div>

                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="lastName">Last Name:</label>
                                        <form:input path="lastName" id = "lastName" class="form-control" required = "true"/>
                                    </div>

                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="phoneNumber">Phone 1:</label>
                                        <form:input path="phoneNumber" class="form-control"  required = "true"/>
                                    </div>

                                </div>
                            </div>

                            <div class="row generalFormLayout">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="alternativePhoneNumber">Phone 2:</label>
                                        <form:input path="alternativePhoneNumber" class="form-control" required = "true"/>
                                    </div>

                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="alternativePhoneNumber">Email:</label>
                                        <form:input path="email" class="form-control" required = "true" type = "email"/>
                                    </div>

                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="houseNo">House No:</label>
                                        <form:input path="houseNo" class="form-control"/>
                                    </div>

                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="addressLineOne">Address Line-1:</label>
                                        <form:input path="addressLineOne" class="form-control"/>
                                    </div>

                                </div>
                            </div>

                            <div class="row generalFormLayout">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="addressLineTwo">Address Line-2:</label>
                                        <form:input path="addressLineTwo" class="form-control"/>
                                    </div>

                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="addressLineThree">Address Line-3:</label>
                                        <form:input path="addressLineThree" class="form-control"/>
                                    </div>

                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="county">County:</label>
                                        <form:input path="county" class="form-control"/>
                                    </div>

                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">

                                    </div>

                                </div>
                            </div>


                        </div>
                    </div>




                <div class="panel panel-default" id="studentInfo">
                    <div class="panel-heading headerColor">Student Details</div>
                    <div class="panel-body" id="studentInfoTemplate">

                        <div class="row generalFormLayout">
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="firstName">First Name:</label>
                                    <form:input path="studentNodeList[0].firstName" class="form-control" id="firstName0" required = "true"/>
                                    <form:hidden path="studentNodeList[0].id" class="form-control" id="id0"/>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="lastName"> Last Name:</label>
                                    <form:input class="form-control"
                                                path="studentNodeList[0].lastName" id="lastName0" required = "true"/>
                                </div>

                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="studentNodeList[0].classDivision">Class:</label>
                                    <form:select class="form-control" path="studentNodeList[0].classDivision"
                                                 id="classDivision0" onchange="callSectionUpdate($(this).attr('id'))">
                                        <form:option value="Class-3">Class-3</form:option>
                                        <form:option value="Class-4">Class-4</form:option>
                                        <form:option value="Class-5">Class-5</form:option>
                                        <form:option value="Class-6">Class-6</form:option>
                                        <form:option value="Year-1">Year-1</form:option>
                                        <form:option value="Year-2">Year-2</form:option>
                                        <form:option value="Year-3">Year-3</form:option>
                                        <form:option value="Year-4">Year-4</form:option>
                                        <form:option value="Year-5">Year-5</form:option>
                                        <form:option value="Year-6">Year-6</form:option>
                                        <form:option value="Graduate">Graduate</form:option>
                                        <form:option value="PG">PG</form:option>

                                    </form:select>
                                </div>

                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="studentNodeList[0].retreatSection">Section:</label>
                                    <form:input class="form-control" path="studentNodeList[0].retreatSection"
                                                id="retreatSection0" readonly="true"/>
                                </div>

                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <div class="col-md-3 text-center">
                                        <label>Oct-29</label><br/>
                                        <form:checkbox path="studentNodeList[0].dayOne"
                                                       id="dayOne0" value="Oct-29"/>

                                    </div>
                                    <div class="col-md-3 text-center">
                                        <label>Oct-30</label><br/>
                                        <form:checkbox path="studentNodeList[0].dayTwo"
                                                       id="dayTwo0" value="Oct-30"/>

                                    </div>
                                    <div class="col-md-3 text-center">
                                        <label>Oct-31</label><br/>
                                        <form:checkbox path="studentNodeList[0].dayThree"
                                                       id="dayThree0" value="Oct-31"/>

                                    </div>
                                    <div class="col-md-3 text-center">
                                        <label>Nov-1</label><br/>
                                        <form:checkbox path="studentNodeList[0].dayFour"
                                                       id="dayFour0" value="Nov-1"/>

                                    </div>
                                </div>
                            </div>
                        </div>



                        <button type="button" class="btn btn-default addButton" id="" name="actionButton">
                            Add Student
                        </button>



                        <!--<button type="button" class="btn btn-default addButton" id="" name="actionButton"><i class="fa fa-plus" style="color: #000000"></i></button>-->



                    </div>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading headerColor">Consent Form</div>
                    <div class="panel-body" id="consentInfoTemplate">

                        <div>
                            Dear Parents / Guardean,<br>
                            The consent form is necessary to allow Syro-Malabar catholic Community / Church to provide
                            the best ‘duty of care’ to the children in its care during the events as mentioned below. It
                            gives permission for your son / daughter to take part and also necessary to ensure
                            Children’s leaders are aware of any medical, learning issues associated with your son /
                            daughter so that we can give them a positive and engaging experience.<br>

                            Event / Activity : Christeen Retreat from October 29 to 1st November 2016 from 9.30 AM to
                            5.30 PM<br>
                            Venue : Phibblestown Community Centre, Clonee, Blanchardstown, Dublin -15.<br>
                            1. I have read all the information provided concerning the programme of the above
                            activity.<br>
                            2. I hereby give permission for my son / daughter / ward to participate in the above
                            activity.<br>
                            3. I accept that my child may be included in photos/videos from the above activity that
                            might be published by the parish.<br>
                            4. Syro- Malabar Catholic Community / Church only accept liability or responsibility for an
                            incident or accident caused by the negligence or breach of statutory duty of the
                            organisation its servants or agents.<br><br>
                        </div>

                        <div>
                            <form:checkbox path="consentSigned" style="width:15px;height:15px;"/> &nbsp;&nbsp;<strong>By checking the checkbox, you are giving your consent for the above   students.</strong>
                        </div>
                    </div>
                </div>
                <div style="text-align: center">
                    <button type="submit" class="btn btn-primary commonGreenBtn" style="min-width:140px;">Save</button>
                </div>




            </div>
        </div>
    </div>

</form:form>

<%@include file="footer.jsp" %>

</body>
</html>






