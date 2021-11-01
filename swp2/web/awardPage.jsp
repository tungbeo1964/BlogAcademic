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

        <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>



        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="nguyenstyle.css" type="text/css"/>
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
            <header class="masthead" style="background-image: url('')">
                <div class="container position-relative px-4 px-lg-5">
                    <div class="row gx-4 gx-lg-5 justify-content-center">
                        <div class="col-md-10 col-lg-8 col-xl-7">
                            <div class="site-heading">
                                <h1 style="font-size: 3.5rem; font-style: italic;">Waiting blog</h1>
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
                <form action="MainController" method="POST">
                    <section  class="ftco-section">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-md-6 text-center mb-5">                           
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="table-wrap">
                                        <table class="table" >
                                            <thead style="background-color: gray" class="thead-dark">
                                                <tr>
                                                    <th>No.</th>
                                                    <th>Content title</th>                                              
                                                    <th>Create by</th>                                              
                                                    <th>Rating</th>
                                                    <th>Award</th>
                                                    <th>Set</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <style>
                                                body {font-family: Arial, Helvetica, sans-serif;}


                                                /* Button used to open the contact form - fixed at the bottom of the page */


                                                /* The popup form - hidden by default */
                                                .form-popup {
                                                    display: none;
                                                    position: fixed;
                                                    bottom: 0;
                                                    margin-bottom: 200px;
                                                    background: #cce5ff;
                                                    margin-left: 280px;
                                                    border: 3px solid #f1f1f1;
                                                    z-index: 9;
                                                    width: 500px;

                                                }

                                                /* Add styles to the form container */
                                                .form-container {
                                                    max-width: 300px;
                                                    padding: 10px;
                                                    background-color: white;
                                                }

                                                /* Full-width input fields */
                                                .form-container input[type=text], .form-container input[type=password] {
                                                    width: 100%;
                                                    padding: 15px;
                                                    margin: 5px 0 22px 0;
                                                    border: none;
                                                    background: #f1f1f1;
                                                }

                                                /* When the inputs get focus, do something */
                                                .form-container input[type=text]:focus, .form-container input[type=password]:focus {
                                                    background-color: #ddd;
                                                    outline: none;
                                                }

                                                /* Set a style for the submit/login button */
                                                .form-container .btn {
                                                    background-color: #04AA6D;
                                                    color: white;
                                                    padding: 16px 20px;
                                                    border: none;
                                                    cursor: pointer;
                                                    width: 100%;
                                                    margin-bottom:10px;
                                                    opacity: 0.8;
                                                }

                                                /* Add a red background color to the cancel button */
                                                .form-container .cancel {
                                                    background-color: red;
                                                }

                                                /* Add some hover effects to buttons */
                                                .form-container .btn:hover, .open-button:hover {
                                                    opacity: 1;
                                                }
                                            </style>
                                            <c:forEach var="listTop5Blog" items="${requestScope.LISTBLOG}" varStatus="counter">
                                                <form action="MainController" method="POST">
                                                    <c:set var="errors" value="${requestScope.CREATEERROR}"/>
                                                    <c:set var="id" value="${param.txtBlogId}" />
                                                    <tr>
                                                        <td>   <i class="fas fa-crown" style="color: yellow"></i></td>
                                                    <input type="hidden" name="txtBlogId" value="${listTop5Blog.id}"/>
                                                    <td>
                                                        ${listTop5Blog.title}
                                                        <input type="hidden" name="txtTitle" value="${listTop5Blog.title}"/>
                                                    </td> 
                                                    <td>
                                                        <c:forEach var="accountName" items="${requestScope.LISTACCOUNT}">
                                                            <c:if test="${(accountName.id eq listTop5Blog.createBy.id)}">
                                                                <font color="blue"><c:out value="${accountName.username}"/></font>
                                                            </c:if>                                        
                                                        </c:forEach>
                                                    </td>
                                                    <td>${listTop5Blog.voteTotal}</td>
                                                    <td>
                                                        <input type="text" name="txtAward" value=""/> <br/>
                                                        <c:if test="${not empty errors.idLengthError}">
                                                            <c:if test="${id eq listTop5Blog.id}">
                                                                <font color="red">${errors.idLengthError}</font><br/>
                                                            </c:if>
                                                        </c:if>
                                                    </td>
                                                    <td> 
                                                        <button   style="background-color: #ffffff; border-style : hidden;font-size: 15px;color: green"
                                                                  type="submit" value="Set Award" name="btnAction">
                                                            Set Award
                                                        </button>
                                                    </td>
                                                    </tr>
                                                </form>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </form>

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
                <script src="js/jquery.min.js"></script>
                <script src="js/popper.js"></script>
                <script src="js/bootstrap.min.js"></script>
                <script src="js/main.js"></script>
                <script>
                    function openForm() {
                        document.getElementById("myForm").style.display = "block";
                    }

                    function closeForm() {
                        document.getElementById("myForm").style.display = "none";
                    }
                </script>
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
