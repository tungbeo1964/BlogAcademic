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
        <title>Admin</title>
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
        <c:if test="${not empty sessionScope.USER}">
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
                            <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="admin.jsp">Home</a></li>          
                            <li class="nav-item dropdown">
                                <a class="x px-lg-3 py-3 py-lg-4 dropbtn" href="">View List</a>
                                <ul class="navbar-nav ms-auto py-4 py-lg-0 dropdown-content">
                                    <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4 y" href="GetAllStudentServlet">View list Student</a></li>
                                    <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4 y" href="GetAllMentorServlet">View list Mentor</a></li>
                                </ul>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="x px-lg-3 py-3 py-lg-4 dropbtn" href="">Create</a>
                                <ul class="navbar-nav ms-auto py-4 py-lg-0 dropdown-content">
                                    <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4 y" href="creatementor.jsp">Create Mentor</a></li>
                                    <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4 y" href="createtag.jsp">Create Tag</a></li>
                                    <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4 y" href="createsubject.jsp">Create Subject</a></li>
                                </ul>
                            </li>
                            <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="login.jsp">Logout</a></li>
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
                                <h1 style="font-size: 3.5rem; font-style: italic;">Student List</h1>

                            </div>                    
                        </div>
                    </div>
                </div>
            </header>
            <!-- Main Content-->
         
               
                <div style="padding-bottom: 50px;"></div>
                <form action="MainController" method="POST">

                    <table class="table" style="width: 90%;padding-top: 50px;padding-bottom: 50px;;margin-left: 50px;box-shadow:-4px 8px 8px rgba(0,0,0,0.1), -8px 16px 16px rgba(0,0,0,0.1), -16px 32px 32px rgba(0,0,0,0.15), -32px 64px 64px rgba(0,0,0,0.25);border: solid 1px">
                        <thead style="background-color: #d9e4f5;
          background-image: linear-gradient(315deg, #d9e4f5 0%, #f5e3e6 74%);font-size: 20px" class="thead-dark">
                            <tr>
                                <th style="color: black;padding-right: 50px;padding-left: 30px;">No.</th>
                                <th style="color: black">Username</th>
                                <th style="color: black">Full Name</th>
                                <th style="color: black">Email</th>
                                <th style="color: black">Phone</th>
                                <th style="color: black">Delete</th>
                            </tr>
                        </thead>
                        <tbody style="background-color: #d9e4f5;
          background-image: linear-gradient(315deg, #d9e4f5 0%, #f5e3e6 74%);font-size: 18px">
                            <c:forEach var="listStudent" items="${requestScope.LISTSTUDENT}" varStatus="counter">
                            <form action="MainController" method="POST">
                                <tr>
                                    <td style="color: black;padding-left: 30px;">${counter.count}</td>
                                    <td style="color: black">
                                        ${listStudent.username}
                                        <input type="hidden" name="txtUsername" value="${listStudent.username}"/>
                                    </td>
                                    <td style="color: black">${listStudent.fullname}</td>
                                    <td style="color: black">${listStudent.email}</td>
                                    <td style="color: black">${listStudent.phone}</td>
                                    <td style="color: black">
                                    <input type="hidden" name="txtFlag" value="${listStudent.delFlag}"/>
                                    <c:if test="${(listStudent.delFlag eq false)}">
                                        <a style="color: blue">Active</a>
                                    </c:if>
                                    <c:if test="${(listStudent.delFlag eq true)}">
                                        <a style="color: red">De-Active</a>
                                    </c:if>
                                    </td>
                                    <td style="color: black">
                                        <c:if test="${(listStudent.delFlag eq false)}">
                                        <button   style="background-color: #9e3645;color: white;width: 70px;border-radius: 5px;font-size: 18px"
                                                  type="submit" value="Ban Student" name="btnAction"
                                                  onclick="return confirm('Do you want to ban this mentor?')">
                                            Ban
                                        </button>
                                    </c:if>
                                    <c:if test="${(listStudent.delFlag eq true)}">
                                        <button   style="background-color: #9e3645;color: white;width: 70px;border-radius: 5px;font-size: 18px"
                                                  type="submit" value="Ban Student" name="btnAction"
                                                  onclick="return confirm('Do you want to active this mentor?')">
                                            Active
                                        </button>
                                    </c:if>
                                        
                                    </td>
                                </tr>
                            </form>
                        </c:forEach>
                        </tbody>
                    </table>

                </form>

                <!-- Footer-->
<div style="padding-bottom: 150px;"></div>
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
