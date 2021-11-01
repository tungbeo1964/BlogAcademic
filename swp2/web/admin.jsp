<%-- 
    Document   : admin
    Created on : 29-09-2021, 20:09:46
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Admin</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <c:if test="${not empty sessionScope.USER}">
            <!-- Navigation-->
            <nav class="navbar navbar-expand-lg navbar-light" id="mainNav">
                <div class="container px-4 px-lg-5">
                    <a class="navbar-brand" >Welcome,${sessionScope.USER}</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                        Menu
                        <i class="fas fa-bars"></i>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarResponsive">
                        <ul class="navbar-nav ms-auto py-4 py-lg-0">
                            <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="admin.jsp">Home</a></li>          
                            <li class="nav-item dropdown">
                                <a class="x px-lg-3 py-3 py-lg-4 dropbtn disabled" >View List</a>
                                <ul class="navbar-nav ms-auto py-4 py-lg-0 dropdown-content">
                                    <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4 y" href="GetAllStudentServlet">View list Student</a></li>
                                    <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4 y" href="GetAllMentorServlet">View list Mentor</a></li>
                                </ul>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="x px-lg-3 py-3 py-lg-4 dropbtn disabled">Create</a>
                                <ul class="navbar-nav ms-auto py-4 py-lg-0 dropdown-content">
                                    <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4 y" href="creatementor.jsp">Create Mentor</a></li>
                                    <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4 y" href="createtag.jsp">Create Tag</a></li>
                                    <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4 y" href="createsubject.jsp">Create Subject</a></li>
                                </ul>
                            </li>
                            <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="LogoutServlet">Logout</a></li>
                        </ul>                                     
                    </div>
                </div>
            </nav>
            <!-- Page Header-->
            <header class="masthead" style="background-image: url('https://previews.123rf.com/images/timbrk/timbrk1410/timbrk141000085/32481112-word-admin-of-the-yellow-square-pixels-on-a-black-matrix-background-network-maintainers-and-server-o.jpg')">
                <div class="container position-relative px-4 px-lg-5">
                    <div class="row gx-4 gx-lg-5 justify-content-center">
                        <div class="col-md-10 col-lg-8 col-xl-7">
                            <div class="site-heading">
                                <h1 style="font-size: 3.5rem; font-style: italic;">FU's Admin Blog</h1>

                            </div>                    
                        </div>
                    </div>
                </div>
            </header>
            <!-- Main Content-->
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <!-- Post preview-->
                        <div class="post-preview">

                        </div>
                    </div>
                </div>
                <!-- Footer-->
                <footer class="border-top">
                    <div class="container px-4 px-lg-5">
                        <div class="row gx-4 gx-lg-5 justify-content-center">
                            <div class="col-md-10 col-lg-8 col-xl-7">
                                <ul class="list-inline text-center">
                                    <li class="list-inline-item">
                                    <a href="https://twitter.com/oNguynDuy4">
                                        <span class="fa-stack fa-lg">
                                            <i class="fas fa-circle fa-stack-2x"></i>
                                            <i class="fab fa-twitter fa-stack-1x fa-inverse"></i>
                                        </span>
                                    </a>
                                </li>
                                <li class="list-inline-item">
                                    <a href="https://www.facebook.com/bui.tung.195/">
                                        <span class="fa-stack fa-lg">
                                            <i class="fas fa-circle fa-stack-2x"></i>
                                            <i class="fab fa-facebook-f fa-stack-1x fa-inverse"></i>
                                        </span>
                                    </a>
                                </li>
                                    <li class="list-inline-item">
                                        <a href="#!">
                                            <span class="fa-stack fa-lg">
                                                <i class="fas fa-circle fa-stack-2x"></i>
                                                <i class="fab fa-github fa-stack-1x fa-inverse"></i>
                                            </span>
                                        </a>
                                    </li>
                                </ul>
                                <div class="small text-center text-muted fst-italic">Contact detail</div>
                            </div>
                        </div>
                    </div>
                </footer>
                <!-- Bootstrap core JS-->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
                <!-- Core theme JS-->
                <script src="js/scripts.js"></script>
            </c:if>
            <c:if test="${empty sessionScope.USER}">
                <h1>
                    <font color="red">
                    Session is timeout!
                    </font>
                </h1>
                <a href="login.jsp">Click here to back Login Page!!!</a>
            </c:if>
    </body>
</html>
