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
    <link rel="profile" href="moviesingle.jsp#">

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
            <!-- /.navbar-collapse -->
        </nav>

        <!-- top search form -->

    </div>
</header>
<!-- END | Header -->

<div class="hero mv-single-hero">
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
<div class="page-single movie-single movie_single">
    <div class="container">
        <div class="row ipad-width2">
            <div class="col-md-4 col-sm-12 col-xs-12">
                <div class="movie-img sticky-sb">
                    <img src="/image?fileName=${singleMovie.picture}" alt="">
                    <div class="movie-btn">
                        <div class="btn-transform transform-vertical red">
                            <div><a href="${singleMovie.movieTrailer}" class="item item-1 redbtn"> <i
                                    class="ion-play"></i> Watch Trailer</a></div>
                            <div><a href="${singleMovie.movieTrailer}"
                                    class="item item-2 redbtn fancybox-media hvr-grow"><i class="ion-play"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8 col-sm-12 col-xs-12">
                <div class="movie-single-ct main-content">
                    <h1 class="bd-hd">${singleMovie.title} <span>${singleMovie.year}</span></h1>
                    <c:if test="${currentUser != null}">
                        <div class="social-btn">
                            <a href="/addFavorite?userId=${currentUser.id}&movieId=${singleMovie.id}"
                               class="parent-btn"><i class="ion-heart"></i>
                                Add to Favorite</a>
                        </div>
                    </c:if>
                    <div class="movie-rate">
                        <div class="rate">
                            <i class="ion-android-star"></i>
                            <p><span>8.1</span> /10<br>
                                <span class="rv">56 Reviews</span>
                            </p>
                        </div>
                    </div>
                    <div class="movie-tabs">
                        <div class="tabs">
                            <ul class="tab-links tabs-mv">
                                <li><a href="/moviesingle?movieId=${singleMovie.id}"> Movie page</a></li>
                                <li><a href="moviesingle.jsp#cast"> Cast & Crew </a></li>
                            </ul>
                            <div class="tab-content">
                                <div id="overview" class="tab active">
                                    <div class="row">
                                        <div class="col-md-8 col-sm-12 col-xs-12">
                                            <p>${singleMovie.description}</p>
                                            <div class="title-hd-sm">
                                            </div>
                                            <!-- movie cast -->

                                            <div id="movieComments" class="mvcast-item">
                                                <c:forEach items="${comments}" var="comment">
                                                <div>
                                                    UserName: <h3>${comment.user.name} ${comment.user.surname} </h3>
                                                    Comment: <p>${comment.message}</p>
                                                </div>
                                                </c:forEach>
                                                <div class="title-hd-sm">

                                                </div>
                                                <!-- movie user review -->
                                            </div>
                                            <div class="col-md-4 col-xs-12 col-sm-12">
                                            </div>
                                                <c:if test="${currentUser != null}">
                                                <div >
                                                    <spring:form action="/addComment" method="post" modelAttribute="modelComment"  cssClass="addCommentText">
                                                        <spring:textarea path="message"  cssStyle="height: 250px"></spring:textarea>
                                                        <spring:input type="hidden" value="${currentUser.id}" name="userId" path="user"></spring:input>
                                                        <spring:input path="movie" type="hidden" value="${singleMovie.id}" name="movie" ></spring:input>
                                                        <input type="submit" value="ADD">
                                                    </spring:form>
                                                </div>
                                                </c:if>

                                            </div>

                                    </div>
                                    <div id="reviews" class="tab review">
                                        <div class="row">
                                            <div class="rv-hd">
                                                <div class="div">
                                                    <h3>Related Movies To</h3>
                                                    <h2>Skyfall: Quantum of Spectre</h2>
                                                </div>
                                                <a href="moviesingle.jsp#" class="redbtn">Write Review</a>
                                            </div>
                                            <div class="mv-user-review-item ">
                                                <div class="user-infor">
                                                    <img src="../images/uploads/userava4.jpg" alt="">
                                                    <div>
                                                        <h3>That spirit of fun</h3>
                                                        <p class="time">
                                                            26 March 2017 by <a href="moviesingle.jsp#"> juliawest</a>
                                                        </p>
                                                    </div>
                                                </div>
                                                <p>If there were not an audience for Marvel comic heroes than clearly
                                                    these
                                                    films would not be made, to answer one other reviewer although I
                                                </p>
                                            </div>
                                            <div class="topbar-filter">
                                                <label>Reviews per page:</label>
                                                <select>
                                                    <option value="range">5 Reviews</option>
                                                    <option value="saab">10 Reviews</option>
                                                </select>
                                                <div class="pagination2">
                                                    <span>Page 1 of 6:</span>
                                                    <a class="active" href="moviesingle.jsp#">1</a>
                                                    <a href="moviesingle.jsp#">2</a>
                                                    <a href="moviesingle.jsp#">3</a>
                                                    <a href="moviesingle.jsp#">4</a>
                                                    <a href="moviesingle.jsp#">5</a>
                                                    <a href="moviesingle.jsp#">6</a>
                                                    <a href="moviesingle.jsp#"><i class="ion-arrow-right-b"></i></a>
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
</div>
</div>
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

<script>
    setInterval(function () {
        $.ajax({
            url: "http://localhost:8080/getMovieComments?movieId${singleMovie.id}",
            success: function (result) {
                $("#movieComments").jsp(result);
            }
        });
    }, 2000);

</script>

<script src="../js/jquery.js"></script>
<script src="../js/plugins.js"></script>
<script src="../js/plugins2.js"></script>
<script src="../js/custom.js"></script>
</body>
</html>