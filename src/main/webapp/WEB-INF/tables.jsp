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
                    <ul class="collapse nav" id="forms">
                        <li>
                            <a href="/admin/basicFormElements">
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

            </ul>
            <!-- /.side-nav -->
        </div>
        <!-- /.navbar-collapse -->
    </nav>
    <!-- /.navbar-side -->
    <!-- end SIDE NAVIGATION -->

    <!-- begin MAIN PAGE CONTENT -->
    <div id="page-wrapper">
        <div class="page-content" style="padding-top: 20px">
            <div class="row">
                <div class="col-lg-6">
                    <div class="portlet portlet-default">
                        <div class="portlet-heading">
                            <div class="portlet-title">
                                <h4>Actor Table</h4>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="portlet-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th>First Name</th>
                                        <th>Last Name</th>
                                        <th>Age</th>
                                    </tr>
                                    </thead>
                                    <c:forEach items="${actors}" var="actor">
                                        <tbody>
                                        <tr>
                                            <td>${actor.name}</td>
                                            <td>${actor.surname}</td>
                                            <td>${actor.age}</td>
                                            <td><a href="/deleteActor?actorId=${actor.id}">X</a></td>
                                        </tr>
                                        </tbody>
                                    </c:forEach>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- /.portlet -->

                    <!-- /.portlet -->
                </div>

                <div class="row">
                    <div class="col-lg-6">
                        <div class="portlet portlet-default">
                            <div class="portlet-heading">
                                <div class="portlet-title">
                                    <h4>Company Table</h4>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="portlet-body">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <th>Company Name</th>
                                        </tr>
                                        </thead>
                                        <c:forEach items="${companies}" var="companie">
                                            <tbody>
                                            <tr>
                                                <td>${companie.name}</td>
                                                <td><a href="/deleteCompany?companyId=${companie.id}">X</a></td>
                                            </tr>
                                            </tbody>
                                        </c:forEach>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="portlet portlet-default">
                        <div class="portlet-heading">
                            <div class="portlet-title">
                                <h4>Director Table</h4>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="portlet-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th>Director Name</th>
                                    </tr>
                                    </thead>
                                    <c:forEach items="${directos}" var="user">
                                        <tbody>
                                        <tr>
                                            <td>${user.name}</td>
                                            <td><a href="/deleteDirector?directorId=${user.id}">X</a></td>
                                        </tr>
                                        </tbody>
                                    </c:forEach>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-6">
                    <div class="portlet portlet-default">
                        <div class="portlet-heading">
                            <div class="portlet-title">
                                <h4>Genres Table</h4>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="portlet-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th>Genre Name</th>
                                    </tr>
                                    </thead>
                                    <c:forEach items="${genres}" var="user">
                                        <tbody>
                                        <tr>
                                            <td>${user.name}</td>
                                            <td><a href="/deleteGenre?genreId=${user.id}">X</a></td>
                                        </tr>
                                        </tbody>
                                    </c:forEach>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-6">
                    <div class="portlet portlet-default">
                        <div class="portlet-heading">
                            <div class="portlet-title">
                                <h4>Movie Table</h4>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="portlet-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th>Movie Name</th>
                                        <th>Movie Pic</th>
                                    </tr>
                                    </thead>
                                    <c:forEach items="${movies}" var="movie">
                                        <tbody>
                                        <tr>
                                            <td>${movie.title}</td>
                                            <td><img src="/image?fileName=${movie.picture} " style="height: 90px "></td>
                                            <td><a href="/deleteMovie?movieId=${movie.id}">X</a></td>
                                        </tr>
                                        </tbody>
                                    </c:forEach>
                                </table>
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

            <!-- /#logout -->
            <!-- Logout Notification jQuery -->
            <script src="../js/plugins/popupoverlay/logout.js"></script>
            <!-- HISRC Retina Images -->
            <script src="../js/plugins/hisrc/hisrc.js"></script>

            <!-- PAGE LEVEL PLUGIN SCRIPTS -->

            <!-- THEME SCRIPTS -->
            <script src="../js/flex.js"></script>
        </div>
    </div>
</body>

</html>
