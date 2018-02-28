<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Flex Admin - Responsive Admin Theme</title>

    <!-- PACE LOAD BAR PLUGIN - This creates the subtle load bar effect at the top of the page. -->
    <link href="../css/pace.css" rel="stylesheet">
    <script src="../js/plugins/pace/pace.js"></script>

    <!-- GLOBAL STYLES - Include these on every page. -->
    <link href="../css/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Ubuntu:300,400,500,700,300italic,400italic,500italic,700italic'
          rel="stylesheet" type="text/css">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
          rel="stylesheet" type="text/css">
    <link href="../icons/font-awesome/css/font-awesome.min.css" rel="stylesheet">

    <!-- PAGE LEVEL PLUGIN STYLES -->

    <!-- THEME STYLES - Include these on every page. -->
    <link href="../css/style1.css" rel="stylesheet">
    <link href="../css/plugins1.css" rel="stylesheet">

    <!-- THEME DEMO STYLES - Use these styles for reference if needed. Otherwise they can be deleted. -->
    <link href="../css/demo.css" rel="stylesheet">

    <!--[if lt IE 9]>
    <script src="../js/html5shiv.js"></script>
    <script src="../js/respond.min.js"></script>
    <![endif]-->

</head>

<body>

<div id="wrapper">

    <!-- begin TOP NAVIGATION -->

    <!-- begin SIDE NAVIGATION -->
    <nav class="navbar-side" role="navigation">
        <div class="navbar-collapse sidebar-collapse collapse">
            <ul id="side" class="nav navbar-nav side-nav">
                <!-- begin SIDE NAV USER PANEL -->
                <li class="side-user hidden-xs">
                    <img class="img-circle" src="/image?fileName=${admin.picUrl}" alt="">
                    <p class="welcome">
                        <i class="fa fa-key"></i> Logged in as
                    </p>
                    <p class="name tooltip-sidebar-logout">
                        ${admin.name}
                        <span class="last-name">${admin.surname}</span>
                    </p>
                </li>
                <li class="panel">
                    <a href="javascript:" data-parent="#side" data-toggle="collapse" class="accordion-toggle"
                       data-target="#forms">
                        <i class="fa fa-edit"></i> Forms <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="collapse nav in" id="forms">
                        <li>
                            <a class="active" href="/admin/basicFormElements">
                                <i class="fa fa-angle-double-right"></i> Basic Elements
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="panel">
                    <a href="/admin" data-parent="#side" data-toggle="collapse" class="accordion-toggle"
                       data-target="#forms">
                        <i class="fa fa-edit"></i> Home Page<i class="fa fa-caret-down"></i>
                    </a>
                </li>
                <!-- end FORMS DROPDOWN -->

                <!-- begin TABLES DROPDOWN -->
                <li class="panel">
                    <a href="/basicTables" data-parent="#side" data-toggle="collapse" class="accordion-toggle"
                       data-target="#forms">
                        Tables
                    </a>
                </li>

            </ul>
        </div>
    </nav>
    <div id="page-wrapper">

        <div class="page-content">
            <div class="row">
                <div class="col-lg-6">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="portlet portlet-default">
                                <div class="portlet-heading">
                                    <div class="portlet-title">
                                        <h4>Actor Form </h4>
                                    </div>
                                    <div class="portlet-widgets">
                                        <a data-toggle="collapse" data-parent="#accordion"
                                           href="basic-form-elements.html#basicFormExample"><i
                                                class="fa fa-chevron-down"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div id="basicFormExample" class="panel-collapse collapse in">
                                    <div class="portlet-body">
                                        <spring:form modelAttribute="actor" action="/admin/addActor" method="post"
                                                     enctype="multipart/form-data">
                                            <div class="form-group">
                                                <spring:input path="name" cssClass="form-control"
                                                              id="exampleInputEmail1" placeholder="Name"></spring:input>
                                            </div>
                                            <div class="form-group">
                                                <spring:input path="surname" cssClass="form-control"
                                                              id="exampleInputEmail1"
                                                              placeholder="Surname"></spring:input>
                                            </div>
                                            <div class="form-group">
                                                <spring:input path="nationality" cssClass="form-control"
                                                              id="exampleInputEmail1"
                                                              placeholder="Nationality"></spring:input>
                                            </div>
                                            <div class="form-group">
                                                <spring:input path="age" cssClass="form-control" id="exampleInputEmail1"
                                                              placeholder="Age"></spring:input>
                                            </div>
                                            <input type="file" name="actorImage">
                                            <button type="submit" class="btn btn-default">Add</button>
                                        </spring:form>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-12">

                            <div class="portlet portlet-default">
                                <div class="portlet-heading">
                                    <div class="portlet-title">
                                        <h4>Director Form </h4>
                                    </div>
                                    <div class="portlet-widgets">
                                        <a data-toggle="collapse" data-parent="#accordion"
                                           href="basic-form-elements.html#basicFormExample"><i
                                                class="fa fa-chevron-down"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div id="basicFormExample" class="panel-collapse collapse in">
                                    <div class="portlet-body">
                                        <spring:form modelAttribute="director" action="/admin/addDirector"
                                                     method="post">
                                            <div class="form-group">
                                                <spring:input path="name" cssClass="form-control"
                                                              id="exampleInputEmail1" placeholder="Name"></spring:input>
                                            </div>
                                            <div class="form-group">
                                                <spring:input path="surname" cssClass="form-control"
                                                              id="exampleInputEmail1"
                                                              placeholder="Surname"></spring:input>
                                            </div>

                                            <div class="form-group">
                                                <spring:input path="nationality" cssClass="form-control"
                                                              id="exampleInputEmail1"
                                                              placeholder="Nationality"></spring:input>
                                            </div>
                                            <div class="form-group">
                                                <spring:input path="age" cssClass="form-control" id="exampleInputEmail1"
                                                              placeholder="Age"></spring:input>
                                            </div>
                                            <button type="submit" class="btn btn-default">Add</button>
                                        </spring:form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="portlet portlet-green">
                                <div class="portlet-heading">
                                    <div class="portlet-title">
                                        <h4>Add Company</h4>
                                    </div>
                                    <div class="portlet-widgets">
                                        <a data-toggle="collapse" data-parent="#accordion"
                                           href="basic-form-elements.html#inlineFormExample"><i
                                                class="fa fa-chevron-down"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div id="inlineFormExample" class="panel-collapse collapse in">
                                    <div class="portlet-body">
                                        <spring:form cssClass="form-inline" action="/admin/addCompany"
                                                     modelAttribute="company" method="post"
                                                     enctype="multipart/form-data">
                                            <div class="form-group">
                                                <spring:input path="name" cssClass="form-control"
                                                              id="exampleInputEmail2"
                                                              placeholder="Enter Company name"></spring:input>
                                            </div>
                                            <br>
                                            <div class="form-group">
                                                <input type="file" class="form-control" id="exampleInputPassword2"
                                                       name="picture">
                                            </div>
                                            <input type="submit" class="btn btn-default" value="ADD"></input>
                                        </spring:form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="portlet portlet-blue">
                                <div class="portlet-heading">
                                    <div class="portlet-title">
                                        <h4>Add Genre</h4>
                                    </div>
                                    <div class="portlet-widgets">
                                        <a data-toggle="collapse" data-parent="#accordion"
                                           href="basic-form-elements.html#horizontalFormExample"><i
                                                class="fa fa-chevron-down"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div id="horizontalFormExample" class="panel-collapse collapse in">
                                    <div class="portlet-body">
                                        <spring:form action="/admin/addGenre" modelAttribute="genre" method="post"
                                                     cssClass="form-horizontal">
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-2 control-label">Name</label>
                                                <div class="col-sm-10">
                                                    <spring:input path="name" placeholder="Name" cssClass="form-control"
                                                                  id="inputEmail3"></spring:input>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-offset-2 col-sm-10">
                                                    <button type="submit" class="btn btn-default">ADD</button>
                                                </div>
                                            </div>
                                        </spring:form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="portlet portlet-red">
                                <div class="portlet-heading">
                                    <div class="portlet-title">
                                        <h4>Add Movie</h4>
                                    </div>
                                    <div class="portlet-widgets">
                                        <a data-toggle="collapse" data-parent="#accordion"
                                           href="basic-form-elements.html#formControls"><i
                                                class="fa fa-chevron-down"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div id="formControls" class="panel-collapse collapse in">
                                    <div class="portlet-body">
                                        <spring:form cssClass="form-horizontal" action="/admin/addMovie"
                                                     modelAttribute="movie" method="post" enctype="multipart/form-data">
                                            <div class="form-group">
                                                <label for="textInput" class="col-sm-2 control-label">Title</label>
                                                <div class="col-sm-10">
                                                    <spring:input path="title" cssClass="form-control"
                                                                  id="textInput"></spring:input>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="textInputDisabled" class="col-sm-2 control-label">Description</label>
                                                <div class="col-sm-10">
                                                    <spring:input path="description" cssClass="form-control"
                                                                  id="textInput"></spring:input>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="textInputDisabled"
                                                       class="col-sm-2 control-label">Year</label>
                                                <div class="col-sm-10">
                                                    <spring:input path="year" cssClass="form-control"
                                                                  id="textInput"></spring:input>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="textInputDisabled"
                                                       class="col-sm-2 control-label">Country</label>
                                                <div class="col-sm-10">
                                                    <spring:input path="country" cssClass="form-control"
                                                                  id="textInput"></spring:input>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="textInputDisabled" class="col-sm-2 control-label">Movie Time
                                                    Minutes</label>
                                                <div class="col-sm-10">
                                                    <spring:input path="movieTime" cssClass="form-control"
                                                                  id="textInput"></spring:input>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label for="textInputDisabled"
                                                       class="col-sm-2 control-label">Budget</label>
                                                <div class="col-sm-10">
                                                    <spring:input path="budget" cssClass="form-control"
                                                                  id="textInput"></spring:input>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="textInputDisabled" class="col-sm-2 control-label">Trailer
                                                    Path</label>
                                                <div class="col-sm-10">
                                                    <spring:input path="movieTrailer" cssClass="form-control"
                                                                  id="textInput"></spring:input>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Genres</label>
                                                <div class="col-sm-10">
                                                    <c:forEach items="${genres}" var="user">

                                                        ${user.name},
                                                    </c:forEach>
                                                    <div class="checkbox">

                                                        <div class="checkbox">
                                                            <spring:input path="movieGenres" cssClass="form-control"
                                                                          id="textInput"></spring:input>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Actors</label>
                                                <div class="col-sm-10">
                                                    <c:forEach items="${actors}" var="actor">

                                                        ${actor.name},
                                                    </c:forEach>
                                                    <div class="checkbox">
                                                        <spring:input path="movieActors" cssClass="form-control"
                                                                      id="textInput"></spring:input>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Directors</label>
                                                <div class="col-sm-10">
                                                    <c:forEach items="${directors}" var="user">

                                                        ${user.name},
                                                    </c:forEach>
                                                    <div class="checkbox">
                                                        <spring:input path="movieDirectors" cssClass="form-control"
                                                                      id="textInput"></spring:input>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Company</label>
                                                <div class="col-sm-10">
                                                    <div class="checkbox">
                                                        <spring:select path="company">
                                                            <c:forEach items="${companies}" var="company">
                                                                <spring:option
                                                                        value="${company.id}">${company.name}</spring:option>
                                                            </c:forEach>
                                                        </spring:select>
                                                    </div>
                                                </div>
                                                <input type="file" name="picture">
                                                <button type="submit" class="btn btn-default">ADD</button>
                                            </div>
                                        </spring:form>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /#wrapper -->

<!-- GLOBAL SCRIPTS -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="../js/plugins/bootstrap/bootstrap.min.js"></script>
<script src="../js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="../js/plugins/popupoverlay/jquery.popupoverlay.js"></script>
<script src="../js/plugins/popupoverlay/defaults.js"></script>
<!-- Logout Notification Box -->

<!-- /#logout -->
<!-- Logout Notification jQuery -->
<script src="../js/plugins/popupoverlay/logout.js"></script>
<!-- HISRC Retina Images -->
<script src="../js/plugins/hisrc/hisrc.js"></script>

<!-- PAGE LEVEL PLUGIN SCRIPTS -->

<!-- THEME SCRIPTS -->
<script src="../js/flex.js"></script>

</body>

</html>
