<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--[if IE 7]>
<html class="ie ie7 no-js" lang="en-US">
<![endif]-->
<!--[if IE 8]>
<html class="ie ie8 no-js" lang="en-US">
<![endif]-->
<!--[if !(IE 7) | !(IE 8) ]><!-->
<html lang="en" class="no-js">
<head>
    <!-- Basic need -->
    <title>Open Pediatrics</title>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="">
    <link rel="profile" href="celebritygrid02.html#">

    <!--Google Font-->
    <link rel="stylesheet" href='http://fonts.googleapis.com/css?family=Dosis:400,700,500|Nunito:300,400,600'/>
    <!-- Mobile specific meta -->
    <meta name=viewport content="width=device-width, initial-scale=1">
    <meta name="format-detection" content="telephone-no">

    <!-- CSS files -->
    <link rel="stylesheet" href="../css/plugins.css">
    <link rel="stylesheet" href="../css/style.css">

</head>
<body>
<!--preloading-->
<div id="preloader">
    <img class="logo" src="../images/logo1.png" alt="" width="119" height="58">
    <div id="status">
        <span></span>
        <span></span>
    </div>
</div>

<header class="ht-header">
    <div class="container">
        <nav class="navbar navbar-default navbar-custom">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header logo">
                <div class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <div id="nav-icon1">
                        <span></span>
                        <span></span>
                        <span></span>
                    </div>
                </div>
                <a href="/home"><img class="logo" src="../images/logo1.png" alt="" width="119" height="58"></a>
            </div>
            <div class="collapse navbar-collapse flex-parent" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav flex-child-menu menu-left">
                    <li class="dropdown first">
                        <a href="/movies">
                            movies
                        </a>
                    </li>
                    <li class="dropdown first">
                        <a href="/actors">
                            celebrities
                        </a>
                    </li>
                    <li class="dropdown first">
                        <a href="/blog">
                            blog
                        </a>
                    </li>
                    <c:if test="${currentUser != null}">
                        <li class="dropdown first">
                            <a href="/Profile?userId=${currentUser.id}">user profile</a>
                        </li>
                    </c:if>
                </ul>
                <c:if test="${currentUser!=null}">
                <ul class="nav navbar-nav flex-child-menu menu-right">
                    <li ><a href="/logout"><img class="logoutImage" src="/image?fileName=gnome-logout.png"></a></li>
                </ul>
                </c:if>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <!-- /.navbar-collapse -->
        </nav>

        <!-- top search form -->
    </div>
    <span style="color:red; margin-left: 150px">${errorMessage}</span>
    <div style="margin-left: 150px" class="top-search">
        <form action="/searchActor">
            <label for="searches"><p style="color: #BD081C">Actor Name</p></label>
            <input id="searches" name="actorName" type="text" placeholder="Search for a actor">
            <button class="btn btn-search" type="submit">Search</button>
        </form>
    </div>
</header>
<!-- END | Header -->
<div class="hero common-hero">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="hero-ct">
                    <h1>celebrity listing - grid</h1>
                    <ul class="breadcumb">
                        <li class="active"><a href="/home">Home</a></li>
                        <li><span class="ion-ios-arrow-right"></span> celebrity listing</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- celebrity grid v2 section-->
<div class="page-single">
    <div class="container">
        <div class="row ipad-width2">
            <div class="col-md-9 col-sm-12 col-xs-12">
                <div class="row">
                    <c:forEach items="${actors}" var="actor">
                    <div class="col-md-4">

                        <div class="ceb-item-style-2">
                                <img src="/image?fileName=${actor.pic}" alt="">
                                <div class="ceb-infor">
                                    <h2>
                                        <a href="/singleActor?actorId=${actor.id}">${actor.name}&nbsp;${actor.surname}</a>
                                    </h2>
                                    <span>actor,${actor.nationality}</span>
                                </div>
                        </div>

                    </div>
                    </c:forEach>
                </div>
                <div class="topbar-filter">
                    <div class="pagination2">
                        <span>Page 1 of 6:</span>
                        <a class="active" href="celebritygrid02.html#">1</a>
                        <a href="celebritygrid02.html#">2</a>
                        <a href="celebritygrid02.html#">3</a>
                        <a href="celebritygrid02.html#">4</a>
                        <a href="celebritygrid02.html#">5</a>
                        <a href="celebritygrid02.html#">6</a>
                        <a href="celebritygrid02.html#"><i class="ion-arrow-right-b"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<!-- end of celebrity grid v2 section-->
<!-- footer section-->
<footer class="ht-footer">
    <div class="container">
        <div class="flex-parent-ft">
            <div class="flex-child-ft item1">
                <a href="/home"><img class="logo" src="../images/logo1.png" alt=""></a>
                <p>Republic Armenia City Gyumri<br>
                </p>
                <p>Call us: <a href="singleactor.jsp#">(+374) 69 89 62</a></p>
            </div>
        </div>
    </div>
    <div class="ft-copyright">
        <div class="ft-left">
            <p>© 2018 Armbuster. All Rights Reserved. Designed by Artash and Karen.</p>
        </div>
        <div class="backtotop">
            <p><a href="singleactor.jsp#" id="back-to-top">Back to top <i class="ion-ios-arrow-thin-up"></i></a>
            </p>
        </div>
    </div>
</footer>
<!-- end of footer section-->

<script src="../js/jquery.js"></script>
<script src="../js/plugins.js"></script>
<script src="../js/plugins2.js"></script>
<script src="../js/custom.js"></script>
</body>
</html>