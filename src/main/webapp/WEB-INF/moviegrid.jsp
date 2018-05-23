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
    <link rel="profile" href="moviegrid.jsp#">

    <!--Google Font-->
    <link rel="stylesheet" href='http://fonts.googleapis.com/css?family=Dosis:400,700,500|Nunito:300,400,600'/>
    <!-- Mobile specific meta -->
    <meta name=viewport content="width=device-width, initial-scale=1">
    <meta name="format-detection" content="telephone-no">

    <!-- CSS files -->
    <link rel="stylesheet" href="css/plugins.css">
    <link rel="stylesheet" href="css/style.css">

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
                            <a href="/Profile?userId=${currentUser.id}">My profile</a>
                        </li>
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

            <!-- Collect the nav links, forms, and other content for toggling -->
            <!-- /.navbar-collapse -->
        </nav>

        <!-- top search form -->
    </div>
</header>

<div class="hero common-hero">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="hero-ct">
                    <h1> movie listing - grid</h1>
                    <ul class="breadcumb">
                        <li class="active"><a href="/home">Home</a></li>
                        <li><span class="ion-ios-arrow-right"></span> movie listing</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="page-single">
    <div class="container">
        <div class="row ipad-width">
            <div class="col-md-8 col-sm-12 col-xs-12">
                <div class="topbar-filter">
                    <p>Found <span>${moviesCount} movies</span> in total</p>
                    <a href="/movies" class="list"><i class="ion-ios-list-outline "></i></a>
                    <a href="#" class="grid"><i class="ion-grid active"></i></a>
                </div>
                <div class="flex-wrap-movielist">
					<c:forEach items="${movies}" var="movie">
                    <div class="movie-item-style-2 movie-item-style-1">
                        <img src="/image?fileName=${movie.picture}" alt="">
                        <div class="hvr-inner">
                            <a href="/moviesingle?movieId=${movie.id}"> Read more <i class="ion-android-arrow-dropright"></i> </a>
                        </div>
                        <div class="mv-item-infor">
                            <h6><a href="/moviesingle?movieId=${movie.id}">${movie.title}</a></h6>
                            <p class="rate"><i class="ion-android-star"></i><span>${movie.imdbRate}</span> /10</p>
                        </div>
                    </div>
                    </c:forEach>
                </div>

                <div class="topbar-filter">
                    <label>Movies per page:</label>
                    <select>
                        <option value="range">20 Movies</option>
                        <option value="saab">10 Movies</option>
                    </select>

                    <div class="pagination2">
                        <span>Page ${index} of ${pagesCount.size()}:</span>
                        <c:forEach items="${pagesCount}" var="number">
                        <a href="/movies?page=${number}&&n=1">${number+1}</a>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-12 col-xs-12">
                <div class="sidebar">
                    <div class="searh-form">
                        <h4 class="sb-title">Search for movie</h4>
                        <form class="form-style-1" action="/searchMovie">
                            <div class="row">
                                <div class="col-md-12 form-it">
                                    <label>Movie name</label>
                                    <input name="filmName" type="text" placeholder="Enter keywords">
                                    <input name="n" type="hidden" value="1">
                                </div>
                                <div class="col-md-12 form-it">
                                    <label>Genre</label>
                                    <div class="group-ip">
                                        <select  name="genreName"  class="ui fluid dropdown">
                                            <option value=""></option>
                                            <c:forEach items="${genres}" var="genr">
                                                <option value="${genr.name}">${genr.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-12 form-it">
                                    <label>Release Year</label>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <input name="year" type="number">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12 ">
                                    <input class="submit" type="submit" value="submit">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="sidebar">
                    <div class="searh-form">
                        <h4 class="sb-title">Sort by</h4>
                        <form class="form-style-1" action="/sortMovie" method="get">
                            <div class="row">
                                <div class="col-md-12 form-it">
                                    <div class="group-ip">
                                        <select  name="sort"  class="ui fluid dropdown">
                                            <option value="0"></option>
                                            <option value="2">Rate</option>
                                            <option value="1">Year</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-12 ">
                                    <input name="n" type="hidden" value="1">
                                    <input class="submit" type="submit" value="submit">
                                </div>
                            </div>
                        </form>
                    </div>
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

<script src="js/jquery.js"></script>
<script src="js/plugins.js"></script>
<script src="js/plugins2.js"></script>
<script src="js/custom.js"></script>
</body>
</html>