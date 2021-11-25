<%-- 
    Document   : student
    Created on : 29-09-2021, 20:04:09
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="author" content="colorlib.com">
        <link href="https://fonts.googleapis.com/css?family=Poppins:400,800" rel="stylesheet" />
        <link href="css/nguyen.css" rel="stylesheet" />

        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Student</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/nguyen.css" rel="stylesheet" type="text/css"/>
    </head>
    <body style="background-color: #d9e4f5;
          background-image: linear-gradient(315deg, #d9e4f5 0%, #f5e3e6 74%);">


        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light" id="mainNav">
            <div class="container px-4 px-lg-5">
                <c:if test="${not empty sessionScope.USER}">
                    <a class="navbar-brand" style="font-style: italic;">Welcome, ${sessionScope.USER}</a>
                </c:if>
                <c:if test="${empty sessionScope.USER}">
                    <a class="navbar-brand" style="font-style: italic;">Blog Academic</a>
                </c:if>

                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto py-4 py-lg-0">
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="GetListAllBlogStudentServlet" >Home</a></li>
                        <c:if test="${empty sessionScope.USER}">
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="login.jsp">Login</a></li>
                        </c:if>
                        <c:if test="${not empty sessionScope.USER}">
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="ViewStudentProfileServlet">View profile</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="ViewCreateBlogServlet">Create Post</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="ViewHistoryBlogStudentServlet">History</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="LogoutServlet">Logout</a></li>
                        </c:if>
                    </ul>
                </div>

            </div>
        </nav>
        <!-- Page Header-->
        <header class="masthead" style="background-image: url('https://image.freepik.com/free-vector/hand-painted-watercolor-pastel-sky-background_23-2148907303.jpg')">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="site-heading">
                            <h1 style="font-size: 3.5rem; font-style: italic;">FU's Student Blog</h1>

                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- Main Content-->
        <div  class="container1 px-4 px-lg-5" style="min-height: 90vh">
            <div  class="left-sidebar">
                <div style="padding-bottom: 60px"></div>
                <form  style="padding-bottom: 25px;" action="MainController" method="POST">
                    <div class="input-group rounded">
                        <input type="search" name="txtSearchValue" value="" class="form-control rounded" placeholder="Search" aria-label="Search"
                               aria-describedby="search-addon" />
                        <input type="hidden" name="currentPage" value="student.jsp"/>
                        <input style="font-family: 'Open Sans';background-color: black;font-size: medium" class="btn-secondary" type="submit" value="Search" name="btnAction"></input>


                    </div>
                </form>

                <h2  style="color: black;margin-bottom: 20px;font-family: 'Open Sans'" >Subject</h2>
                <div  class="link">
                    <c:forEach var="subject" items="${requestScope.LISTSUBJECT}">
                        <form method="POST">
                            <c:url var="searchSubject" value="MainController" >
                                <c:param name="btnAction" value="searSub"/>
                                <c:param name="pkSub" value="${subject.subjectId}"/>
                                <c:param  name="currentPage" value="student.jsp"/>
                            </c:url>

                            <a href="${searchSubject}" style="font-family: monospace;font-size: large;font-weight: bold">${subject.subjectId}</a>
                        </form>
                    </c:forEach>
                </div>

            </div> 

            <div class="main-content row gx-4 gx-lg-5 justify-content-center">
                <div class="col-md-10 col-lg-8 col-xl-7" style="display: flex;align-items: center;justify-items: center;padding-left: 4.5vw">
                    <!-- Post preview-->
                    <form action="MainController" method="POST">
                        <div class="row gx-4 gx-lg-5 justify-content-center">
                            <div class="col-md-10 col-lg-8 col-xl-7">
                                <c:forEach var="listBlog" items="${requestScope.LISTBLOG}">
                                    <!-- Post preview-->
                                    <form action="MainController" method="GET">


                                        <div class="post-preview" style="width: 18rem;">
                                            <div class="card-body" style="border: 1px solid black;margin-bottom: 20px;width: 30vw;font-family: monospace;border-radius: 5px;box-shadow:-4px 8px 8px rgba(0,0,0,0.1), -8px 16px 16px rgba(0,0,0,0.1), -16px 32px 32px rgba(0,0,0,0.15), -32px 64px 64px rgba(0,0,0,0.25);margin-top: 6vh">
                                                <input type="hidden" name="txtBlogId" value="${listBlog.id}"/>
                                                <h5 class="post-title" style="font-size: 30px;">${listBlog.title}</h5>
                                                <p class="card-text">Posted by
                                                    <c:forEach var="accountName" items="${requestScope.LISTACCOUNT}">
                                                        <c:if test="${(accountName.id eq listBlog.createBy.id)}">
                                                            <font color="blue"><c:out value="${accountName.username}"/></font>
                                                        </c:if> 
                                                    </c:forEach>
                                                    <br/>
                                                    <label style="font-size: small">${listBlog.createOn}</label>
                                                </p>

                                                <button type="submit" value="View Detail" name="btnAction" class="btn btn-primary" style="background-color: black">
                                                    View Blog
                                                </button>
                                            </div>
                                        </div>

                                    </form>
                                </c:forEach>
                                <!-- Divider-->


                            </div>
                        </div>
                    </form>


                </div>
            </div>
            <div  class="right-sidebar">
                <h2  style="color: black;margin-bottom: 20px;font-family: 'Open Sans'">Top 5 Blog</h2>
                <div >  
                    <div class="link">
                        <c:forEach var="listTop5" items="${requestScope.LISTTOP5}">
                            <form  method="POST">
                                <c:url var="viewBlog" value="MainController">
                                    <c:param name="btnAction" value="View Detail"/>
                                    <c:param name="txtBlogId" value="${listTop5.id}"/>
                                </c:url>
                                <a href="${viewBlog}" style="font-family: monospace;font-size: large;font-weight: bold">${listTop5.title}</a>
                            </form>
                        </c:forEach>
                    </div>
                </div>

                <br/>

                <h2  style="color: black;margin-bottom: 20px;font-family: 'Open Sans'">Tags</h2>
                <div >  
                    <div class="link">
                        <c:forEach var="tag" items="${requestScope.LISTTAG}">
                            <form method="POST">
                                <c:url var="searchTag" value="MainController">
                                    <c:param name="btnAction" value="sear"/>
                                    <c:param name="pk" value="${tag.tagName}"/>
                                    <c:param name="currentPage" value="student.jsp"/>
                                </c:url>
                                <input type="hidden" name="currentPage" value="student.jsp"/>
                                <a href="${searchTag}" style="font-family: monospace;font-size: large;font-weight: bold">${tag.tagName}</a>
                            </form>
                        </c:forEach>
                    </div>
                </div>
            </div> 
        </div>
        <!-- Footer-->
        <footer class="border-top">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <ul class="list-inline text-center" style="font-size: large">
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
                                <a href="https://github.com/tungbeo1964">
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
    </body>
</html>
