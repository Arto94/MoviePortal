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
    <link rel="profile" href="index.html#">

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
<div style="background-color: black"><p style="color: red">${message}</p></div>

<!--preloading-->
<div id="preloader">
    <img class="logo" src="../images/logo1.png" alt="" width="119" height="58">
    <div id="status">
        <span></span>
        <span></span>
    </div>
</div>
<!--end of preloading-->
<!--login form popup-->

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
                        <input type="checkbox" name="remember" value="Remember me"><span>Remember me</span>
                    </div>
                </div>
            </div>
            <div class="row">
                <button type="submit">Login</button>
            </div>
        </spring:form>
    </div>
</div>
<!--end of login form popup-->
<!--signup form popup-->

<div class="login-wrapper" id="signup-content">
    <div class="login-content">
        <a href="index.html#" class="close">x</a>
        <h3>sign up</h3>
        <spring:form action="/addUser" modelAttribute="user" method="post" enctype="multipart/form-data">
            <div class="row">
                Name:
                <label>
                    <spring:input path="name" title="name" required="required" /><br>
                </label>
            </div>
            <div class="row">
                your surname:
                <label>
                    <spring:input path="surname" title="surname" required="required" /><br>
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

            <input type="file" name="picture"  >
            <div class="row">
                <button type="submit">sign up</button>
            </div>
        </spring:form>
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

                    <c:if test="${currentUser != null}">
                        <li class="dropdown first">
                            <a href="/Profile?userId=${currentUser.id}">
                                user profile
                            </a></li>
                    </c:if>
                </ul>
                <ul class="nav navbar-nav flex-child-menu menu-right">
                    <li class="loginLink"><a href="index.html#">LOG In</a></li>
                    <li class="btn signupLink"><a href="index.html#">sign up</a></li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>
        <!-- top search form -->
    </div>
</header>
<!-- END | Header -->

<div class="slider movie-items">
    <div class="container">
        <div class="row">
            <div class="social-link">
                <p>Follow us: </p>
                <a href="https://www.facebook.com/profile.php?id=100014146627749&ref=bookmarks" target="_blank"><i
                        class="ion-social-facebook"></i></a>
                <a href="https://www.youtube.com/channel/UClT72GC4q6kDJjBchRdUAsg?view_as=subscriber" target="_blank"><i
                        class="ion-social-youtube"></i></a>
            </div>
            <div class="slick-multiItemSlider">
                <c:forEach items="${movies}" var="movie">
                    <div class="movie-item">
                        <div class="mv-img">
                            <img src="/image?fileName=${movie.picture}" alt="" width="285" height="437">
                        </div>
                        <div class="title-in">
                            <h6><a href="/moviesingle?movieId=${movie.id}">${movie.title}</a></h6>
                            <p><i class="ion-android-star"></i><span>7.4</span> /10</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<div class="trailers">
    <div class="container">
        <div class="row ipad-width">
            <div class="col-md-12">
                <div class="title-hd">
                    <h2>in theater</h2>
                    <a href="/movies" class="viewall">View all Movies <i class="ion-ios-arrow-right"></i></a>
                </div>
                <div class="videos">
                    <div class="slider-for-2 video-ft">
                        <div>
                            <iframe class="item-video" src="index.html"
                                    data-src="https://www.youtube.com/embed/1Q8fG0TtVAY"></iframe>
                        </div>
                        <div>
                            <iframe class="item-video" src="index.html"
                                    data-src="https://www.youtube.com/embed/w0qQkSuWOS8"></iframe>
                        </div>
                        <div>
                            <iframe class="item-video" src="index.html"
                                    data-src="https://www.youtube.com/embed/44LdLqgOpjo"></iframe>
                        </div>
                        <div>
                            <iframe class="item-video" src="index.html"
                                    data-src="https://www.youtube.com/embed/gbug3zTm3Ws"></iframe>
                        </div>
                        <div>
                            <iframe class="item-video" src="index.html"
                                    data-src="https://www.youtube.com/embed/e3Nl_TCQXuw"></iframe>
                        </div>
                        <div>
                            <iframe class="item-video" src="index.html"
                                    data-src="https://www.youtube.com/embed/NxhEZG0k9_w"></iframe>
                        </div>


                    </div>
                    <div class="slider-nav-2 thumb-ft">
                        <div class="item">
                            <div class="trailer-img">
                                <img src="../images/uploads/trailer7.jpg" alt="photo by Barn Images" width="4096"
                                     height="2737">
                            </div>
                            <div class="trailer-infor">
                                <h4 class="desc">Wonder Woman</h4>
                                <p>2:30</p>
                            </div>
                        </div>
                        <div class="item">
                            <div class="trailer-img">
                                <img src="../images/uploads/trailer2.jpg" alt="photo by Barn Images" width="350"
                                     height="200">
                            </div>
                            <div class="trailer-infor">
                                <h4 class="desc">Oblivion: Official Teaser Trailer</h4>
                                <p>2:37</p>
                            </div>
                        </div>
                        <div class="item">
                            <div class="trailer-img">
                                <img src="../images/uploads/trailer6.jpg" alt="photo by Joshua Earle">
                            </div>
                            <div class="trailer-infor">
                                <h4 class="desc">Exclusive Interview: Skull Island</h4>
                                <p>2:44</p>
                            </div>
                        </div>
                        <div class="item">
                            <div class="trailer-img">
                                <img src="../images/uploads/trailer3.png" alt="photo by Alexander Dimitrov" width="100"
                                     height="56">
                            </div>
                            <div class="trailer-infor">
                                <h4 class="desc">Logan: Director James Mangold Interview</h4>
                                <p>2:43</p>
                            </div>
                        </div>
                        <div class="item">
                            <div class="trailer-img">
                                <img src="../images/uploads/trailer4.png" alt="photo by Wojciech Szaturski" width="100"
                                     height="56">
                            </div>
                            <div class="trailer-infor">
                                <h4 class="desc">Beauty and the Beast: Official Teaser Trailer 2</h4>
                                <p>2: 32</p>
                            </div>
                        </div>
                        <div class="item">
                            <div class="trailer-img">
                                <img src="../images/uploads/trailer5.jpg" alt="photo by Wojciech Szaturski" width="360"
                                     height="189">
                            </div>
                            <div class="trailer-infor">
                                <h4 class="desc">Fast&Furious 8</h4>
                                <p>3:11</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- latest new v1 section-->

<!--end of latest new v1 section-->
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
