<%-- 
    Document   : studentlist
    Created on : 01-10-2021, 22:16:06
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            button{
                box-shadow:-4px 8px 8px rgba(0,0,0,0.1), -8px 16px 16px rgba(0,0,0,0.1), -16px 32px 32px rgba(0,0,0,0.15), -32px 64px 64px rgba(0,0,0,0.25);  
            }
        </style>
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

        <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>



        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="nguyenstyle.css" type="text/css"/>
    </head>

    <body style="background-color: #d9e4f5;
          background-image: linear-gradient(315deg, #d9e4f5 0%, #f5e3e6 74%);">

        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" style="font-style: italic;" >Welcome,${sessionScope.USER}</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto py-4 py-lg-0">
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="GetListAllBlogStudentServlet" >Home</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="ViewStudentProfileServlet">View profile</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="ViewCreateBlogServlet">Create Blog</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="ViewHistoryBlogStudentServlet">History</a></li>

                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="LogoutServlet">Logout</a></li>
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
                            <h1 style="font-size: 3.5rem; font-style: italic;">History</h1>
                        </div>                    
                    </div>
                </div>
            </div>
        </header>
        <!-- Main Content-->

        <div style="padding-bottom: 50px;"></div>
        <form  action="MainController" method="GET">

            <table class="table" style="width: 90%;padding-top: 50px;padding-bottom: 50px;;margin-left: 50px;box-shadow:-4px 8px 8px rgba(0,0,0,0.1), -8px 16px 16px rgba(0,0,0,0.1), -16px 32px 32px rgba(0,0,0,0.15), -32px 64px 64px rgba(0,0,0,0.25);border: solid 1px">
                <thead style="background-color: #d9e4f5;
          background-image: linear-gradient(315deg, #d9e4f5 0%, #f5e3e6 74%);" class="thead-dark">
                    <tr>
                        <th style="color: black;padding-left: 30px;font-size: large">No.</th>
                        <th style="color: black;font-size: large">Content title</th>
                        <th style="color: black;font-size: large">Create on</th>
                        <th style="color: black;font-size: large">Approve on</th>
                        <th style="color: black;font-size: large">Approve by</th>
                        <th style="color: black;font-size: large">Status</th>
                        <th style="color: black;font-size: large">Link</th>
                        <th style="color: black;font-size: large">Edit</th>
                    </tr>
                </thead>
                <tbody style="background-color: #d9e4f5;
          background-image: linear-gradient(315deg, #d9e4f5 0%, #f5e3e6 74%);">
                    <c:forEach var="listHistoryBlog" items="${requestScope.LISTBLOG}" varStatus="counter">
                    <form action="MainController" method="GET">
                        <tr>
                            <td style="color: black;padding-left: 30px;font-size: medium">${counter.count}</td>
                        <input type="hidden" name="txtBlogId" value="${listHistoryBlog.id}"/>
                        <td style="color: black;font-size: medium">${listHistoryBlog.title}</td>
                        <td style="color: black;font-size: medium">${listHistoryBlog.createOn}</td>
                        <td style="color: black;font-size: medium">${listHistoryBlog.approveOn}</td>
                        <td style="color: black;font-size: medium">
                            <c:forEach var="accountName" items="${requestScope.LISTACCOUNT}">
                                <c:if test="${(accountName.id eq listHistoryBlog.approveBy)}">
                                    <font color="black"><c:out value="${accountName.username}"/></font>
                                </c:if>                                        
                            </c:forEach>
                            <c:if test="${listHistoryBlog.approveBy eq -1}">
                                <font style="font-size: medium" color="red"><c:out value="Waiting"/></font>
                            </c:if>  
                        </td>           
                        <td style="color: black">
                            <c:if test="${listHistoryBlog.status eq 1}">
                                <font style="font-size: medium" color="red" ><c:out value="Waiting"/></font>
                            </c:if>
                            <c:if test="${listHistoryBlog.status eq 2}">
                                <font style="font-size: medium" color="red"><c:out value="Approve"/></font>
                            </c:if>
                            <c:if test="${listHistoryBlog.status eq 3}">
                                <font style="font-size: medium" color="red" ><c:out value="Unapprove"/></font>
                            </c:if>
                        </td>

                        <td style="color: black">
                            <button   style="background-color: #ffffff;color: black;border-radius: 5px;font-size: medium"
                                      type="submit" value="View Detail" name="btnAction">
                                View Blog
                            </button>
                        </td>
                        <td style="color: black">
                            <button   style="background-color: #ffffff;color: black;border-radius: 5px;font-size: medium"
                                      type="submit" value="View This Blog to Edit" name="btnAction">
                                Edit Blog
                            </button>
                        </td>
                        </tr>
                    </form>
                </c:forEach>
                </tbody>
        </form>

    </table>                                 
    <div style="padding-bottom: 150px;"></div>
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
    <script src="js/jquery.min.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>


</body>
</html>
