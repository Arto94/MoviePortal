<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Flex Admin - Responsive Admin Theme</title>

    <!-- PACE LOAD BAR PLUGIN - This creates the subtle load bar effect at the top of the page. -->
    <link href="../css/pace.css" rel="stylesheet" type="text/css">
    <link href="../css/fontcc.css" rel="stylesheet" type="text/css">
    <link href="../css/fontss.css" rel="stylesheet" type="text/css">
    <script src="../js/plugins/pace/pace.js"></script>
    <!-- GLOBAL STYLES - Include these on every page. -->
    <link href="../css/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Ubuntu:300,400,500,700,300italic,400italic,500italic,700italic'
          rel="stylesheet" type="text/css">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
          rel="stylesheet" type="text/css">
    <link href="../css/fonts/font-awesome/css/font-awesome.css" rel="stylesheet">

    <!-- PAGE LEVEL PLUGIN STYLES -->
    <link href="../css/plugins/messenger/messenger.css" rel="stylesheet">
    <link href="../css/plugins/messenger/messenger-theme-flat.css" rel="stylesheet">
    <link href="../css/plugins/daterangepicker/daterangepicker-bs3.css" rel="stylesheet">
    <link href="../css/plugins/morris/morris.css" rel="stylesheet">
    <link href="../css/plugins/jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet">
    <link href="../css/plugins/datatables/datatables.css" rel="stylesheet">

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
    <nav class="navbar-top" role="navigation">

        <!-- begin BRAND HEADING -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle pull-right" data-toggle="collapse"
                    data-target=".sidebar-collapse">
                <i class="fa fa-bars"></i> Menu
            </button>
            <div class="navbar-brand">
                <a href="index.html">
                    <img src="../img/flex-admin-logo.png" data-1x="img/flex-admin-logo@1x.png"
                         data-2x="img/flex-admin-logo@2x.png" class="hisrc img-responsive" alt="">
                </a>
            </div>
        </div>
        <!-- end BRAND HEADING -->
    </nav>
    <!-- /.navbar-top -->
    <!-- end TOP NAVIGATION -->

    <!-- begin SIDE NAVIGATION -->
    <nav class="navbar-side" role="navigation">
        <div class="navbar-collapse sidebar-collapse collapse">
            <ul id="side" class="nav navbar-nav side-nav">
                <!-- begin SIDE NAV USER PANEL -->
                <li class="side-user hidden-xs">
                    <img class="img-circle" src="/image?fileName=${user.picUrl}" alt="">
                    <p class="name tooltip-sidebar-logout">
                        ${user.name}
                        <span class="last-name">${user.surname}</span>
                    </p>
                </li>
                <li class="panel">
                            <a href="/admin/basicFormElements">
                              Basic Elements
                            </a>
                </li>
                <li class="panel">
                    <a href="/home" data-parent="#side" data-toggle="collapse" class="accordion-toggle"
                       data-target="#forms">
                        Home Page
                    </a>
                </li>
                <li class="panel">
                    <a href="/basicTables" data-parent="#side" data-toggle="collapse" class="accordion-toggle"
                       data-target="#forms">
                        Tables
                    </a>
                </li>
                <li class="panel">
                    <a href="/logout" data-parent="#side" data-toggle="collapse" class="accordion-toggle"
                       data-target="#forms">
                         Log Out
                    </a>
                </li>
            </ul>
            <!-- /.side-nav -->
        </div>
        <!-- /.navbar-collapse -->
    </nav>
    <!-- /.navbar-side -->
    <!-- end SIDE NAVIGATION -->

    <!-- begin MAIN PAGE CONTENT -->
    <div id="page-wrapper">

        <div class="page-content">


            <!-- begin DASHBOARD CIRCLE TILES -->
            <div class="row">
                <div class="col-lg-2 col-sm-6">
                    <div class="circle-tile">

                            <div class="circle-tile-heading dark-blue">
                                <i class="fa fa-user fa-fw fa-3x"></i>
                            </div>

                        <div class="circle-tile-content dark-blue">
                            <div class="circle-tile-description text-faded">
                                Users
                            </div>
                            <div class="circle-tile-number text-faded">
                                <span id="sparklineA">${userCount}</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-sm-6">
                    <div class="circle-tile">

                            <div class="circle-tile-heading green">
                                <i class="fa fa-film fa-fw fa-3x"></i>
                            </div>
                        <div class="circle-tile-content green">
                            <div class="circle-tile-description text-faded">
                                Movies
                            </div>
                            <div class="circle-tile-number text-faded">
                                ${movieCount}
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-sm-6">
                    <div class="circle-tile">

                            <div class="circle-tile-heading orange">
                                <i class="fa fa-video fa-fw fa-3x"></i>
                            </div>
                        <div class="circle-tile-content orange">
                            <div class="circle-tile-description text-faded">
                                Genres
                            </div>
                            <div class="circle-tile-number text-faded">
                                ${genreCount}
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-sm-6">
                    <div class="circle-tile">
                            <div class="circle-tile-heading blue">
                                <i class="fas fa-user-secret fa-fw fa-3x"></i>
                            </div>
                        <div class="circle-tile-content blue">
                            <div class="circle-tile-description text-faded">
                                Actors
                            </div>
                            <div class="circle-tile-number text-faded">
                                ${actorCount}
                                <span id="sparklineB"></span>
                            </div>
                             a
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-sm-6">
                    <div class="circle-tile">

                            <div class="circle-tile-heading red">
                                <i class="fa fa-shopping-cart fa-fw fa-3x"></i>
                            </div>
                        <div class="circle-tile-content red">
                            <div class="circle-tile-description text-faded">
                                Directors
                            </div>
                            <div class="circle-tile-number text-faded">
                                ${directorCount}
                                <span id="sparklineC"></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-sm-6">
                    <div class="circle-tile">
                            <div class="circle-tile-heading purple">
                                <i class="fa fa-building fa-fw fa-3x"></i>
                            </div>
                        <div class="circle-tile-content purple">
                            <div class="circle-tile-description text-faded">
                                Companies
                            </div>
                            <div class="circle-tile-number text-faded">
                                ${companyCount}
                                <span id="sparklineD"></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end DASHBOARD CIRCLE TILES -->

            <div class="row">


            </div>
            <!-- /.row -->

            <div class="row">
                <div class="col-lg-4">
                    <div class="row">


                    </div>
                </div>

            </div>
            <!-- /.page-content -->

        </div>
        <!-- /#page-wrapper -->
        <!-- end MAIN PAGE CONTENT -->

    </div>
    <!-- /#wrapper -->

    <!-- GLOBAL SCRIPTS -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="../js/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="../js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="../js/plugins/popupoverlay/jquery.popupoverlay.js"></script>
    <script src="../js/plugins/popupoverlay/defaults.js"></script>
    <!-- Logout Notification Box -->
    <div id="logout">
        <div class="logout-message">
            <img class="img-circle img-logout" src="../img/profile-pic.jpg" alt="">
            <h3>
                <i class="fa fa-sign-out text-green"></i> Ready to go?
            </h3>
            <p>Select "Logout" below if you are ready<br> to end your current session.</p>
            <ul class="list-inline">
                <li>
                    <a href="login.html" class="btn btn-green">
                        <strong>Logout</strong>
                    </a>
                </li>
                <li>
                    <button class="logout_close btn btn-green">Cancel</button>
                </li>
            </ul>
        </div>
    </div>
    <!-- /#logout -->
    <!-- Logout Notification jQuery -->
    <script src="../js/plugins/popupoverlay/logout.js"></script>
    <!-- HISRC Retina Images -->
    <script src="../js/plugins/hisrc/hisrc.js"></script>

    <!-- PAGE LEVEL PLUGIN SCRIPTS -->
    <!-- HubSpot Messenger -->
    <script src="../js/plugins/messenger/messenger.min.js"></script>
    <script src="../js/plugins/messenger/messenger-theme-flat.js"></script>
    <!-- Date Range Picker -->
    <script src="../js/plugins/daterangepicker/moment.js"></script>
    <script src="../js/plugins/daterangepicker/daterangepicker.js"></script>
    <!-- Morris Charts -->
    <script src="../js/plugins/morris/raphael-2.1.0.min.js"></script>
    <script src="../js/plugins/morris/morris.js"></script>
    <!-- Flot Charts -->
    <script src="../js/plugins/flot/jquery.flot.js"></script>
    <script src="../js/plugins/flot/jquery.flot.resize.js"></script>
    <!-- Sparkline Charts -->
    <script src="../js/plugins/sparkline/jquery.sparkline.min.js"></script>
    <!-- Moment.js -->
    <script src="../js/plugins/moment/moment.min.js"></script>
    <!-- jQuery Vector Map -->
    <script src="../js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
    <script src="../js/plugins/jvectormap/maps/jquery-jvectormap-world-mill-en.js"></script>
    <script src="../js/demo/map-demo-data.js"></script>
    <!-- Easy Pie Chart -->
    <script src="../js/plugins/easypiechart/jquery.easypiechart.min.js"></script>
    <!-- DataTables -->
    <script src="../js/plugins/datatables/jquery.dataTables.js"></script>
    <script src="../js/plugins/datatables/datatables-bs3.js"></script>

    <!-- THEME SCRIPTS -->
    <script src="../js/flex.js"></script>
    <script src="../js/demo/dashboard-demo.js"></script>
</div>
</body>

</html>
