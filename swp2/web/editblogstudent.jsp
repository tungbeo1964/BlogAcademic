<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html lang="en">
    <head>
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
    </head>
    <body>
        <c:if test="${not empty sessionScope.USER}">
            <!-- Navigation-->
            <nav class="navbar navbar-expand-lg navbar-light" id="mainNav">
                <div class="container px-4 px-lg-5">
                    <a class="navbar-brand" href="">Welcome,${sessionScope.USER}</a>
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
            <header class="masthead" style="background-image: url('https://i.pinimg.com/736x/e1/4b/70/e14b7097d76237a8f5aba0dc66d01e1b.jpg')">
                <div class="container position-relative px-4 px-lg-5">
                    <div class="row gx-4 gx-lg-5 justify-content-center">
                        <div class="col-md-10 col-lg-8 col-xl-7">
                            <div class="page-heading">
                                <h1>Edit Blog</h1>

                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <!-- Main Content-->
            <main class="mb-4">
                <div  style="background-image: url('https://www.icgroupinc.com/wp-content/uploads/2016/09/background-work-1024x683.jpg')" >
                    <div class="row gx-4 gx-lg-5 justify-content-center"  >
                        <div class="col-md-10 col-lg-8 col-xl-7" style="background: white;" >
                            <h1>Blog</h1>
                            <div class="my-5">
                                <form action="EditBlogStudentServlet" method="post" enctype="multipart/form-data" id="contactForm" data-sb-form-api-token="API_TOKEN" >
                                    <div class="form-floating">
                                        <input class="form-control"  type="text" name="txtTitle" placeholder="title" value="${requestScope.BLOGDETAILS.title}">
                                        <label for="content" style="color: orange">Content title</label>
                                        <input type="hidden" name="txtBlogId" value="${requestScope.BLOGDETAILS.id}">
                                    </div>
                                    <div>
                                        <br/><br/>
                                        <label for="Name" style="color: orange">TAG: </label>
                                        <c:set var="mytag" scope="request" value="${requestScope.BLOGTAGS}"/>
                                        <c:forEach var="tag" items="${requestScope.ALLTAGS}">
                                            <c:choose>
                                                <c:when test="${fn:contains(mytag, tag.tagId)}">
                                                    <input type="checkbox" name="tags" value="${tag.tagId}" checked="checked"/>
                                                    <label for="tag">${tag.tagName}</label>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="checkbox" name="tags" value="${tag.tagId}"/>
                                                    <label for="tag">${tag.tagName}</label>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                        <br/><br/>
                                    </div>
                                    <label for="Name" style="color: orange">SUBJECT:</label>
                                    <br/><br/>
                                    <div class="form-floating">
                                        <select name="subjectId">
                                            <c:forEach var="subject" items="${requestScope.ALLSUBJECTS}">
                                                <c:choose>
                                                    <c:when test="${subject.subjectId eq requestScope.BLOGDETAILS.subjectId.subjectId}">
                                                        <option value="${subject.subjectId}" selected="selected">${subject.subjectId}</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="${subject.subjectId}">${subject.subjectId}</option>
                                                    </c:otherwise>
                                                </c:choose>`
                                            </c:forEach>
                                        </select>
                                        <br/><br/>
                                    </div>
                                    <br/>                               
                                    <label for="detail" style="color: orange" >Content Detail</label>
                                    <br/>
                                    <br/>
                                    <textarea style="width: 100%" cols="30" rows="10" type="text" name="txtDetail" placeholder="detail"><c:out value="${requestScope.BLOGDETAILS.blogContent}"/></textarea>
                                    </br>  
                                    <div >
                                        <input class="form-control"  type="file" name="img" accept="image/*" multiple size="45" placeholder="url">
                                        <label for="content" style="color: orange" >Imagine URL</label>
                                    </div>
                                    <div >
                                        <input class="form-control"  type="file" name="vid" accept="video/*" multiple size="45" placeholder="url">
                                        <label for="content" style="color: orange" >video URL</label>
                                    </div>
                                    </br>
                                    <button style="margin: auto;display: block;" class="btn btn-primary text-uppercase" id="submitButton" 
                                            type="submit" name="btnAction" value="Create blog">Send</button>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>

            </main>
            <!-- Footer-->
            <footer class="border-top" style="background-image:url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQx8yXliLQxB6ZX5eRFX8ZerSyVjJmoaDqMGw&usqp=CAU') ">
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

                        </div>
                    </div>
                </div>
            </footer>
            <!-- Bootstrap core JS-->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
            <!-- Core theme JS-->
            <script src="js/scripts.js"></script>
            <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
            <!-- * *                               SB Forms JS                               * *-->
            <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
            <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
            <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
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
