<%--
  Created by IntelliJ IDEA.
  User: bibin
  Date: 5/10/16
  Time: 9:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
  $(document).ready(function () {
    $('#logout').click(function () {
      $('#logoutForm').submit();
    });
  });
</script>

<header class="navbar navbar-inverse navbar-fixed-top" role="banner">
  <a id="leftmenu-trigger" class="tooltips" data-toggle="tooltip" data-placement="bottom" title="Toggle Sidebar"></a>
  <a id="rightmenu-trigger" class="tooltips" data-toggle="tooltip" data-placement="bottom"></a>

  <div class="navbar-header pull-left">
    <a class="navbar-brand" href="#"><span id=image-text><span
            style="font-size: 27px;font-style: italic;">CUFA </span>Secure File Transfer Site</span></a>
  </div>
  <ul class="nav navbar-nav pull-right toolbar">
    <%--    <li class="dropdown">
          <a href="#" class="dropdown-toggle username" data-toggle="dropdown">
            <span class="hidden-xs">pintujacob@cufa.ie<i class="fa fa-caret-down"></i></span>
            <spring:url value="/resources/images/dangerfield.png" var="dangerimageURL"/>
            <img src="${dangerimageURL}" alt="Dangerfield"/>
          </a>
          <ul class="dropdown-menu userinfo arrow">
            <li class="username">
              <a href="#">
                <div class="pull-left"><img src="${dangerimageURL}" alt="Jeff Dangerfield"/></div>
                <div class="pull-right"><h5>pintujacob@cufa.ie</h5>
                  <small>Logged in as <span>pintujacob@cufa.ie</span></small>
                </div>
              </a>
            </li>
            <li class="userlinks">
              <ul class="dropdown-menu">
                <li><a href="#">Edit Profile <i class="pull-right fa fa-pencil"></i></a></li>
                <li><a href="#">Account <i class="pull-right fa fa-cog"></i></a></li>
                <li><a href="#">Help <i class="pull-right fa fa-question-circle"></i></a></li>
                <li class="divider"></li>
                <li><a href="${pageContext.request.contextPath}/logOut.action" class="text-right">Sign Out</a></li>
              </ul>
            </li>
          </ul>
        </li>--%>
    <li><i class="fa fa-sign-out fa-2x logoutImage" id="logout" title="Logout"></i>
      <form:form method="post" action="loggedout.action" id="logoutForm">
      </form:form>
      </a></li>
    <%--<li><a class="username"><span id="userName">${user.firstName} ${user.lastName} </span></a></li>--%>

    <%--<li><a id="cufahelp" class="helpBtn" name="help"
           href="${pageContext.request.contextPath}/shared/CUFA_User_Help.pdf" title="Help"
           target="_blank"><i class="fa fa-info fa-2x"></i></a></li>

    <li><a href="#" class=" userSettingsBtn settingBtn" name="usersettings"><i class="fa fa-cog fa-2x"></i></a></li>--%>

    <%--<li><a><i class="fa fa-pencil-square-o fa-2x"></i></a></li>--%>


  </ul>


</header>
