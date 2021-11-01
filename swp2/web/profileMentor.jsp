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
        <title>Profile</title>
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
                    <a class="navbar-brand" >Welcome,${sessionScope.USER}</a>
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
            <header class="masthead" style="background-image: url('https://media.istockphoto.com/illustrations/user-profile-icon-glassy-modern-blue-button-abstract-background-illustration-id1200200944?k=20&m=1200200944&s=170667a&w=0&h=cUV-DqDkwbKrLdEGimsI9LPkfkcuob28kkRF-sdFYMU=')">
                <div class="container position-relative px-4 px-lg-5">
                    <div class="row gx-4 gx-lg-5 justify-content-center">
                        <div class="col-md-10 col-lg-8 col-xl-7">
                            <div class="page-heading">
                                <h1>Your Profile</h1>                          
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <!-- Main Content-->
            <main class="mb-4"style="background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQx8yXliLQxB6ZX5eRFX8ZerSyVjJmoaDqMGw&usqp=CAU')">
                <div class="container px-4 px-lg-5">
                    <c:set var="accDTO" value="${requestScope.ACCOUNTPROFILE}"/>
                    <c:set var="mentorDTO" value="${requestScope.MENTORPROFILE}"/>
                    <form action="MainController" method="POST">
                        <c:set var="errors" value="${requestScope.CREATEERROR}"/>
                        <div class="row gx-4 gx-lg-5 justify-content-center">
                            <div class="col-md-10 col-lg-8 col-xl-7">
                                <div id="wizard">
                                    <!-- SECTION 1 -->
                                    <h4></h4>

                                    <div class="form-header">
                                        <div class="avartar">
                                            <a href="#">
                                                <img src="images/avatar2.png" alt="">
                                            </a>
                                            <div class="avartar-picker">
                                                <input type="file" name="file-1[]" id="file-1" class="inputfile" data-multiple-caption="{count} files selected" multiple />
                                                <label for="file-1">
                                                    <i class="zmdi zmdi-camera"></i>
                                                    <span>Choose Picture</span>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <input type="hidden" name="txtID" value="${accDTO.id}"/>
                                            <span style="color: red;">ID</span>
                                            <div class="form-holder active">
                                                <input ID ="profile" type="text" name="txtUsername" value="${accDTO.username}" readonly placeholder="ID"  class="form-control">
                                            </div>
                                            <span style="color: orange;" >Name</span>
                                            <div class="form-holder">
                                                <input ID ="profile" type="text" name="txtFullname" value="${accDTO.fullname}" placeholder="Name"  class="form-control">
                                                <td>
                                                    <c:if test="${not empty errors.fullnameLengthError}">
                                                        <font color="red">${errors.fullnameLengthError}</font><br/>
                                                    </c:if>
                                                </td> 
                                            </div>
                                            <span style="color: orange;">Phone</span>
                                            <div class="form-holder">
                                                <input type="text" name="txtPhone" value="${mentorDTO.phone}" placeholder="Phone"  class="form-control">
                                                <td>
                                                    <c:if test="${not empty errors.phoneLengthError}">
                                                        <font color="red">${errors.phoneLengthError}</font><br/>
                                                    </c:if>
                                                </td> 
                                            </div>
                                            <span style="color: orange;">Email</span>
                                            <div class="form-holder">
                                                <input type="text" name="txtEmail" value="${mentorDTO.email}" placeholder="Email"  class="form-control">                                
                                                <td>
                                                    <c:if test="${not empty errors.emailValidation}">
                                                        <font color="red">${errors.emailValidation}</font><br/>
                                                    </c:if>
                                                </td>

                                            </div>
                                            <span  style="color: red;">Create By</span> 
                                            <div class="form-holder active">

                                                <div >
                                                    <input type="text" name="txtCreateBy" value="${mentorDTO.createBy}" placeholder="CreateBy" readonly class="form-control">                                
                                                </div>

                                            </div>

                                        </div>

                                    </div>

                                    <button type="submit" name="btnAction" value="Update Your Profile" class="login100-form-btn">
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
    <footer class="border-top"style="background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQx8yXliLQxB6ZX5eRFX8ZerSyVjJmoaDqMGw&usqp=CAU')">
        <div class="container px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-md-10 col-lg-8 col-xl-7">
                    <ul class="list-inline text-center">
                        <li class="list-inline-item">
                            <a href="#!">
                                <span class="fa-stack fa-lg">
                                    <i class="fas fa-circle fa-stack-2x"></i>
                                    <i class="fab fa-twitter fa-stack-1x fa-inverse"></i>
                                </span>
                            </a>
                        </li>
                        <li class="list-inline-item">
                            <a href="#!">
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
                    <div class="small text-center text-muted fst-italic">Copyright &copy; Your Website 2021</div>
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
