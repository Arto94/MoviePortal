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
    <link rel="profile" href="moviegridfw.jsp#">

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
<!--end of preloading-->
<!--login form popup-->

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
        <span style="color:red;">${errorMessage}</span>
        <div class="top-search">
           <spring:form action="/selectByGenre" method="get" modelAttribute="genre">
               <label for="searches"><p style="color: #BD081C">Select genre</p></label>
               <select name="genreid" >
                   <c:forEach items="${genres}" var="genre">
                   <option  value="${genre.id}">${genre.name}</option>
                   </c:forEach>
               </select>
               <button class="btn btn-search" type="submit">Search</button>
           </spring:form>
            <form action="/searchMovie" style="margin-left: 75%">
                <label for="searches"><p style="color: #BD081C">Movie Title</p></label>
                <input id="searches" name="filmName" type="text" placeholder="Search for a movie">
                <button class="btn btn-search" type="submit">Search</button>
            </form>
        </div>
    </div>
</header>
<!-- END | Header -->

<div class="hero common-hero">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="hero-ct">
                    <h1>Movie Listing</h1>
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
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="topbar-filter fw">
                    <p>Found <span>${movies.size()}</span> in total</p>
                    <label>Sort by:</label>
                    <form action="getMoviesOrderBy">
                        <select>
                            <option value="name">Name</option>
                            <option value="budget">Budget</option>
                            <option value="rating">Rating Descending</option>
                            <option value="rating">Rating Ascending</option>
                            <option value="date">Release date Descending</option>
                            <option value="date">Release date Ascending</option>
                        </select>
                    </form>
                </div>
                    <div class="flex-wrap-movielist mv-grid-fw">
                        <c:forEach items="${movies}" var="movie">
                        <div class="movie-item-style-2 movie-item-style-1">

                            <img src="/image?fileName=${movie.picture}" alt="">
                            <div class="hvr-inner">
                                <a href="/moviesingle?movieId=${movie.id}"> Read more <i
                                        class="ion-android-arrow-dropright"></i> </a>
                            </div>
                            <div class="mv-item-infor">
                                <h6>${movie.title}</h6>
                                <p class="rate"><i class="ion-android-star"></i><span>8.1</span> /10</p>
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
                        <span>Page 1 of 2:</span>
                        <a class="active" href="moviegridfw.jsp#">1</a>
                        <a href="moviegridfw.jsp#">2</a>
                        <a href="moviegridfw.jsp#">3</a>
                        <a href="moviegridfw.jsp#"><i class="ion-arrow-right-b"></i></a>
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
<script src="../js/jquery.js"></script>
<script src="../js/plugins.js"></script>
<script src="../js/plugins2.js"></script>
<script src="../js/custom.js"></script>
</body>
</html>