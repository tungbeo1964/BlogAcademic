<%-- 
    Document   : profile2
    Created on : 30-09-2021, 15:21:18
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
        <title>Mentor</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="author" content="colorlib.com">

        <!-- MATERIAL DESIGN ICONIC FONT -->
        <link rel="stylesheet" href="fonts/material-design-iconic-font/css/material-design-iconic-font.css">

        <!-- STYLE CSS -->
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
    </head>
    <body>
        <c:if test="${not empty sessionScope.USER}">
            <!-- Navigation-->
            <nav class="navbar navbar-expand-lg navbar-light" id="mainNav">
                <div class="container px-4 px-lg-5">
                    <a class="navbar-brand" style="font-style: italic;">Welcome,${sessionScope.USER}</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                        Menu
                        <i class="fas fa-bars"></i>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarResponsive">
                        <ul class="navbar-nav ms-auto py-4 py-lg-0">
                            <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="GetListAllBlogMentorServlet">Home</a></li>
                            <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="ViewMentorProfileServlet">View profile</a></li>
                            <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="ViewCreateBlogMentorServlet">Create Blog</a></li>
                            <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="ViewListWaitingBlogServlet">Waiting</a></li>
                            <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="ViewHistoryBlogMentorServlet">History</a></li>
                            <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="ViewTop5BlogServlet">Award</a></li>
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
                            <div class="page-heading">
                                <h1 style="font-size: 3.5rem;font-style: italic;">Your Profile</h1>                          
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <!-- Main Content-->
            <main class="mb-4" style="background-color: #d9e4f5;
                  background-image: linear-gradient(315deg, #d9e4f5 0%, #f5e3e6 74%);">
                <div class="container px-4 px-lg-5">
                    <c:set var="accDTO" value="${requestScope.ACCOUNTPROFILE}"/>
                    <c:set var="mentorDTO" value="${requestScope.MENTORPROFILE}"/>
                    <form action="MainController" method="POST">
                        <c:set var="errors" value="${requestScope.CREATEERROR}"/>
                        <div class="row gx-4 gx-lg-5 justify-content-center">
                            <div class="col-md-10 col-lg-8 col-xl-7" style="padding-left: 3vw">
                                <div id="wizard" style="height: 700px;background: no-repeat;border: solid black 2px">
                                    <!-- SECTION 1 -->


                                    <div class="form-header">
                                        <div class="avartar">
                                            <a href="#" style="margin-right: 100px;">
                                                <img style="border-radius: 10px;border-style: solid;box-shadow:-4px 8px 8px rgba(0,0,0,0.1), -8px 16px 16px rgba(0,0,0,0.1), -16px 32px 32px rgba(0,0,0,0.15), -32px 64px 64px rgba(0,0,0,0.25);"  src="images/teacher3.png" alt="">
                                            </a>

                                        </div>

                                        <div class="form-group">
                                            <input type="hidden" name="txtID" value="${accDTO.id}"/>
                                            <span style="color: red;font-size: 20px;padding-left: 25px;">Username</span>
                                            <div style="padding-bottom: 10px;"></div>
                                            <div class="form-holder active">
                                                <input style="border:  4px solid;border-color: #d9e4f5;background-color: #ffffff;
                                                       background-image: linear-gradient(315deg,#f5e3e6 0%, #ffffff 74% );box-shadow:-4px 8px 8px rgba(0,0,0,0.1), -8px 16px 16px rgba(0,0,0,0.1), -32px 64px 64px rgba(0,0,0,0.25);" ID ="profile" type="text" name="txtUsername" value="${accDTO.username}" readonly placeholder="ID"  class="form-control">
                                            </div>
                                            <span style="color: orange;font-size: 20px;padding-left: 25px;" >Fullname</span>
                                            <div style="padding-bottom: 10px;"></div>
                                            <div class="form-holder">
                                                <input style="border:  4px solid;border-color: #d9e4f5;background-color: #ffffff;
                                                       background-image: linear-gradient(315deg,#f5e3e6 0%, #ffffff 74% );box-shadow:-4px 8px 8px rgba(0,0,0,0.1), -8px 16px 16px rgba(0,0,0,0.1), -32px 64px 64px rgba(0,0,0,0.25);" ID ="profile" type="text" name="txtFullname" value="${accDTO.fullname}" placeholder="Name"  class="form-control">
                                                <td>
                                                    <c:if test="${not empty errors.fullnameLengthError}">
                                                        <font color="red">${errors.fullnameLengthError}</font><br/>
                                                    </c:if>
                                                </td> 
                                            </div>
                                            <span style="color: orange;font-size: 20px;padding-left: 25px;">Phone</span>
                                            <div style="padding-bottom: 10px;"></div>
                                            <div class="form-holder">
                                                <input style="border:  4px solid;border-color: #d9e4f5;background-color: #ffffff;
                                                       background-image: linear-gradient(315deg,#f5e3e6 0%, #ffffff 74% );box-shadow:-4px 8px 8px rgba(0,0,0,0.1), -8px 16px 16px rgba(0,0,0,0.1), -32px 64px 64px rgba(0,0,0,0.25);" type="text" name="txtPhone" value="${mentorDTO.phone}" placeholder="Phone"  class="form-control">
                                                <td>
                                                    <c:if test="${not empty errors.phoneLengthError}">
                                                        <font color="red">${errors.phoneLengthError}</font><br/>
                                                    </c:if>
                                                </td> 
                                            </div>
                                            <span style="color: orange;font-size: 20px;padding-left: 25px;">Email</span>
                                            <div style="padding-bottom: 10px;"></div>
                                            <div class="form-holder">
                                                <input style="border:  4px solid;border-color: #d9e4f5;background-color: #ffffff;
                                                       background-image: linear-gradient(315deg,#f5e3e6 0%, #ffffff 74% );box-shadow:-4px 8px 8px rgba(0,0,0,0.1), -8px 16px 16px rgba(0,0,0,0.1), -32px 64px 64px rgba(0,0,0,0.25);" type="text" name="txtEmail" value="${mentorDTO.email}" placeholder="Email"  class="form-control">                                
                                                <td>
                                                    <c:if test="${not empty errors.emailValidation}">
                                                        <font color="red">${errors.emailValidation}</font><br/>
                                                    </c:if>
                                                </td>

                                            </div>
                                            <span  style="color: red;font-size: 20px;padding-left: 25px;">Create By</span> 
                                            <div style="padding-bottom: 10px;"></div>
                                            <div class="form-holder active">

                                                <div >
                                                    <input style="border:  4px solid;border-color: #d9e4f5;background-color: #ffffff;
                                                           background-image: linear-gradient(315deg,#f5e3e6 0%, #ffffff 74% );box-shadow:-4px 8px 8px rgba(0,0,0,0.1), -8px 16px 16px rgba(0,0,0,0.1), -32px 64px 64px rgba(0,0,0,0.25);" type="text" name="txtCreateBy" value="${mentorDTO.createBy}" placeholder="CreateBy" readonly class="form-control">                                
                                                </div>

                                            </div>

                                        </div>

                                    </div>

                                    <button style="background-color: black;
                                            color: white;box-shadow:-4px 8px 8px rgba(0,0,0,0.1), -8px 16px 16px rgba(0,0,0,0.1), -32px 64px 64px rgba(0,0,0,0.25);border: solid 2px black;;" type="submit" name="btnAction" value="Update Your Profile" class="login100-form-btn">
                                        Save
                                    </button>
                                </div>

                            </div>



                        </div>

                    </form>
                </div>
            </div>
        </div>
    </main>
    <!-- Footer-->
    <footer class="border-top" style="background-color: #d9e4f5;
            background-image: linear-gradient(315deg, #d9e4f5 0%, #f5e3e6 74%);">
        <div class="container px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-md-10 col-lg-8 col-xl-7">
                    <ul class="list-inline text-center" style="font-size: xx-large">
                        <li class="list-inline-item">
                                    <a href="https://twitter.com/oNguynDuy4">
                                        <span class="fa-stack fa-lg" style="color: black">
                                            <i class="fas fa-circle fa-stack-2x"></i>
                                            <i class="fab fa-twitter fa-stack-1x fa-inverse"></i>
                                        </span>
                                    </a>
                                </li>
                                <li class="list-inline-item">
                                    <a href="https://www.facebook.com/bui.tung.195/">
                                        <span class="fa-stack fa-lg" style="color: black">
                                            <i class="fas fa-circle fa-stack-2x"></i>
                                            <i class="fab fa-facebook-f fa-stack-1x fa-inverse"></i>
                                        </span>
                                    </a>
                                </li>
                                <li class="list-inline-item">
                                    <a href="https://github.com/tungbeo1964">
                                        <span class="fa-stack fa-lg" style="color: black">
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
