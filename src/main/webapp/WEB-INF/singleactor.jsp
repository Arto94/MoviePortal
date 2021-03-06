<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
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
    <link rel="profile" href="celebritysingle.html#">

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
    <img class="logo" src="images/logo1.png" alt="" width="119" height="58">
    <div id="status">
        <span></span>
        <span></span>
    </div>
</div>
<div class="login-wrapper" id="login-content">
    <div class="login-content">
        <a href="/home" class="close">x</a>
        <h3>Login</h3>
        <spring:form action="/login" modelAttribute="user" method="post">
            <div class="row">
                <label>
                    Email:
                    <spring:input path="email" name="email"/>
                </label>
            </div>
            <div class="row">
                <label>
                    Password:
                    <spring:password path="password" name="password" required="required"/>
                </label>
            </div>
            <div class="row">
                <div class="remember">
                    <div>
                        <input type="checkbox" name="remember-me"><span>Remember me</span>
                    </div>
                </div>
            </div>
            <div class="row">
                <button type="submit">Login</button>
            </div>
        </spring:form>
    </div>
</div>
<div class="login-wrapper" id="signup-content">
    <div class="login-content">
        <a href="index.html#" class="close">x</a>
        <h3>sign up</h3>
        <spring:form action="/addUser" modelAttribute="user" method="post" enctype="multipart/form-data">
            <div class="row">
                Name:
                <label>
                    <spring:input path="name" title="name" required="required"/><br>
                </label>
            </div>
            <div class="row">
                your surname:
                <label>
                    <spring:input path="surname" title="surname" required="required"/><br>
                </label>
            </div>
            <div class="row">
                your email:
                <label>
                    <spring:input path="email" title="email" required="required"/><br>
                </label>
            </div>
            <div class="row">
                Password:
                <label>
                    <spring:password path="password" title="password" required="required"/><br>
                </label>
            </div>

            <input type="file" name="picture">
            <div class="row">
                <button type="submit">sign up</button>
            </div>
        </spring:form>
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
            <!-- Collect the nav links, forms, and other content for toggling -->
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
                            <a href="/Profile?userId=${currentUser.id}">
                                My profile
                            </a></li>
                    </c:if>
                </ul>
                <c:if test="${currentUser==null}">
                    <ul class="nav navbar-nav flex-child-menu menu-right">
                        <li class="loginLink"><a href="index.html#">LOG In</a></li>
                        <li class="btn signupLink"><a href="index.html#">sign up</a></li>
                    </ul>
                </c:if>

                <c:if test="${currentUser!=null}">
                    <ul class="nav navbar-nav flex-child-menu menu-right">
                        <li><a href="/logout"><img class="logoutImage" src="/image?fileName=gnome-logout.png"></a></li>
                    </ul>
                </c:if>
            </div>
        </nav>
    </div>
</header>
<div class="hero hero3">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <!-- <h1> movie listing - list</h1>
                <ul class="breadcumb">
                    <li class="active"><a href="#">Home</a></li>
                    <li> <span class="ion-ios-arrow-right"></span> movie listing</li>
                </ul> -->
            </div>
        </div>
    </div>
</div>
<!-- celebrity single section-->

<div class="page-single movie-single cebleb-single">
    <div class="container">
        <div class="row ipad-width">
            <div class="col-md-4 col-sm-12 col-xs-12">
                <div class="mv-ceb">
                    <img src="/image?fileName=${actor.pic}" alt="">
                </div>
            </div>
            <div class="col-md-8 col-sm-12 col-xs-12">
                <div class="movie-single-ct">
                    <h1 class="bd-hd">${actor.name} ${actor.surname} </h1>
                    <p class="ceb-single">Nationality - ${actor.nationality} </p>
                    <p class="ceb-single">Date Of Birth - ${actor.birthday}</p>
                    <p class="ceb-single">City - ${actor.city}</p>

                    <div class="movie-tabs">
                        <div class="tabs">
                            <ul class="tab-links tabs-mv">
                                <li class="active"><a href="celebritysingle.html#overviewceb">Overview</a></li>
                                <li><a href="celebritysingle.html#biography"> biography</a></li>
                                <li><a href="celebritysingle.html#mediaceb"> Media</a></li>
                                <li><a href="celebritysingle.html#filmography">filmography</a></li>
                            </ul>
                            <div class="tab-content">
                                <div id="overviewceb" class="tab active">
                                    <div class="row">
                                        <div class="col-md-8 col-sm-12 col-xs-12">
                                            <p>${actor.description}</p>
                                            <p class="time"><a href="celebritysingle.html#"></a></p>
                                            <div class="title-hd-sm">

                                            </div>
                                            <div class="mvsingle-item ov-item">
                                            </div>
                                            <div class="title-hd-sm">
                                                <h4>filmography</h4>
                                            </div>
                                            <!-- movie cast -->
                                            <div class="mvcast-item">
                                                <c:forEach items="${movies}" var="movie">
                                                <div class="cast-it">
                                                    <div class="cast-left cebleb-film">
                                                        <img style="width: 50px" height="50" src="/image?fileName=${movie.picture}" alt="">
                                                        <div>
                                                            <a href="/moviesingle?movieId=${movie.id}">${movie.title}</a>
                                                            <p class="time"></p>
                                                        </div>

                                                    </div>
                                                    <p>...${movie.year}</p>
                                                </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="col-md-4 col-xs-12 col-sm-12">
                                            <div class="sb-it">
                                                <h6>Fullname: </h6>
                                                <p><a href="celebritysingle.html#">Hugh Jackman</a></p>
                                            </div>
                                            <div class="sb-it">
                                                <h6>Date of Birth: </h6>
                                                <p>June 24, 1982</p>
                                            </div>
                                            <div class="sb-it">
                                                <h6>Country: </h6>
                                                <p>Australian</p>
                                            </div>
                                            <div class="sb-it">
                                                <h6>Height:</h6>
                                                <p>186 cm/p>
                                            </div>
                                            <div class="sb-it">
                                                <h6>Keywords:</h6>
                                                <p class="tags">
                                                    <span class="time"><a
                                                            href="celebritysingle.html#">jackman</a></span>
                                                    <span class="time"><a
                                                            href="celebritysingle.html#">wolverine</a></span>
                                                    <span class="time"><a href="celebritysingle.html#">logan</a></span>
                                                    <span class="time"><a
                                                            href="celebritysingle.html#">blockbuster</a></span>
                                                    <span class="time"><a href="celebritysingle.html#">final battle</a></span>
                                                </p>
                                            </div>
                                            <div class="ads">
                                                <img src="images/uploads/ads1.png" alt="">
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
    </div>
</div>

<!-- celebrity single section-->

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

<script src="js/jquery.js"></script>
<script src="js/plugins.js"></script>
<script src="js/plugins2.js"></script>
<script src="js/custom.js"></script>
</body>
</html>