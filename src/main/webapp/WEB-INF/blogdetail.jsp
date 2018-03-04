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
    <link rel="profile" href="blogdetail.html#">

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
<!--end of preloading-->
<!--login form popup-->
<div class="login-wrapper" id="login-content">
    <div class="login-content">
        <a href="blogdetail.html#" class="close">x</a>
        <h3>Login</h3>
        <form method="post" action="http://haintheme.com/demo/html/bustter/login.php">
            <div class="row">
                <label for="username">
                    Username:
                    <input type="text" name="username" id="username" placeholder="Hugh Jackman"
                           pattern="^[a-zA-Z][a-zA-Z0-9-_\.]{8,20}$" required="required"/>
                </label>
            </div>

            <div class="row">
                <label for="password">
                    Password:
                    <input type="password" name="password" id="password" placeholder="******"
                           pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$"
                           required="required"/>
                </label>
            </div>
            <div class="row">
                <div class="remember">
                    <div>
                        <input type="checkbox" name="remember" value="Remember me"><span>Remember me</span>
                    </div>
                    <a href="blogdetail.html#">Forget password ?</a>
                </div>
            </div>
            <div class="row">
                <button type="submit">Login</button>
            </div>
        </form>
        <div class="row">
            <p>Or via social</p>
            <div class="social-btn-2">
                <a class="fb" href="blogdetail.html#"><i class="ion-social-facebook"></i>Facebook</a>
                <a class="tw" href="blogdetail.html#"><i class="ion-social-twitter"></i>twitter</a>
            </div>
        </div>
    </div>
</div>
<!--end of login form popup-->
<!--signup form popup-->
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
                <a href="/home"><img class="logo" src="images/logo1.png" alt="" width="119" height="58"></a>
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
                                user profile
                            </a></li>
                    </c:if>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <!-- top search form -->

    </div>
</header>
<!-- END | Header -->

<div class="hero common-hero">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="hero-ct">
                    <h1> blog detail</h1>
                    <ul class="breadcumb">
                        <li class="active"><a href="blogdetail.html#">Home</a></li>
                        <li><span class="ion-ios-arrow-right"></span> blog listing</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- blog detail section-->
<div class="page-single">
    <div class="container">
        <div class="row">
            <div class="col-md-9 col-sm-12 col-xs-12">
                <div class="blog-detail-ct">
                    <span class="time">${blog.date}</span>
                    <h1>${blog.name}</h1>
                    <img src="/image?fileName=${blog.picture}" alt="">
                    <p>${blog.description}</p>

                    <div class="flex-it flex-ct">
                    </div>
                    <!-- share link -->

                    <!-- comment items -->
                    <div class="comments">
                        <h4>04 Comments</h4>

                        <div class="cmt-item flex-it">
                            <img src="images/uploads/author4.png" alt="">
                            <div class="author-infor">
                                <div class="flex-it2">
                                    <h6><a href="blogdetail.html#">Margot Robbie</a></h6> <span class="time"> - 27 Mar 2017</span>
                                </div>
                                <p>Joan Baez was the sharpest of the Rock Hall inductees, singing about deportees and
                                    talking social activism as well as joking about her age and the likelihood that a
                                    good portion of the Barclays. </p>
                                <p><a class="rep-btn" href="blogdetail.html#">+ Reply</a></p>
                            </div>
                        </div>
                    </div>

                    <c:if test="${currentUser != null}">
                        <div class="comment-form">
                            <h4>Leave a comment</h4>
                            <form action="blogdetail.html">
                                <div class="row">
                                    <div class="col-md-12">
                                        <textarea name="message" id="" placeholder="Message"></textarea>
                                    </div>
                                </div>
                                <input class="submit" type="submit" placeholder="submit">
                            </form>
                        </div>
                    </c:if>
                    <!-- comment form -->
                </div>
            </div>
            <div class="col-md-3 col-sm-12 col-xs-12">
                <div class="sidebar">


                </div>
            </div>
        </div>
    </div>
</div>
<!-- end of  blog detail section-->
<!-- footer section-->
<footer class="ht-footer">
    <div class="container">
        <div class="flex-parent-ft">
            <div class="flex-child-ft item1">
                <a href="/home"><img class="logo" src="images/logo1.png" alt=""></a>

                <p>Call us: <a href="/home">(+374) 44-19-19-91</a></p>
            </div>


        </div>
    </div>
    <div class="ft-copyright">
        <div class="ft-left">
            <p>© 2017 Blockbuster. All Rights Reserved. Designed by Artash&Karen.</p>
        </div>
        <div class="backtotop">
            <p><a href="/home" id="back-to-top">Back to top <i class="ion-ios-arrow-thin-up"></i></a></p>
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