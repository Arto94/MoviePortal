<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
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
    <link rel="profile" href="userprofile.jsp#">

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

<!--end of signup form popup-->

<!-- BEGIN | Header -->
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
                </ul>
                <ul class="nav navbar-nav flex-child-menu menu-right">
                    <li ><a href="/logout"><img class="logoutImage" src="/image?fileName=gnome-logout.png"></a></li>
                </ul>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <!-- /.navbar-collapse -->
        </nav>


    </div>
</header>
<!-- END | Header -->

<div class="hero user-hero">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="hero-ct">
                    <h1>${user.name} &nbsp;${user.surname}  </h1>
                    <ul class="breadcumb">
                        <li class="active"><a href="/home">Home</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="page-single">
    <div class="container">
        <div class="row ipad-width">
            <div class="col-md-3 col-sm-12 col-xs-12">
                <div class="user-information">
                    <div class="user-img">
                        <img src="/image?fileName=${user.picUrl}" width="220px" height="250px" alt=""><br>
                    </div>
                    <div class="user-fav">
                        <p>Account Details</p>
                        <ul>
                            <li><a href="/userFavoriteMovies?userId=${user.id}">Favorite movies</a></li>
                        </ul>
                    </div>
                    <div class="user-fav">
                        <p>Others</p>
                        <ul>
                            <li><a href="/logout">Log out</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-9 col-sm-12 col-xs-12">
                <div class="form-style-1 user-pro">
                    <spring:form action="/changeUserDetails" class="user" modelAttribute="newUser" method="post">
                        <h4>01. Profile details</h4>
                        <div class="row">
                            <div class="col-md-6 form-it">
                                <label>Email Address</label>
                                <spring:input path="email" type="text" placeholder="${user.email} "/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 form-it">
                                <label>First Name</label>
                                <spring:input path="name" type="text" placeholder="${user.name} "/>
                            </div>
                            <div class="col-md-6 form-it">
                                <label>Last Name</label>
                                <spring:input path="surname" type="text" placeholder="${user.surname} "/>
                            </div>
                        </div>
                        <h4>02. Change password</h4>

                        <div class="row">
                            <div class="col-md-6 form-it">
                                <label>New Password</label>
                                <spring:input path="password" type="password"/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2">
                                <input class="submit" type="submit" value="change">
                            </div>
                        </div>
                    </spring:form>
                </div>
            </div>
        </div>
    </div>
</div>
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