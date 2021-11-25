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
    <body style="background-color: #d9e4f5;
          background-image: linear-gradient(315deg, #d9e4f5 0%, #f5e3e6 74%);">
        <c:if test="${not empty sessionScope.USER}">
            <!-- Navigation-->
            <nav class="navbar navbar-expand-lg navbar-light" id="mainNav">
                <div class="container px-4 px-lg-5">
                    <a class="navbar-brand" href="" style="font-style: italic;">Welcome,${sessionScope.USER}</a>
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
                            <div class="page-heading">
                                <h1 style="font-style: italic;font-size: 3.5rem">Edit Blog</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <!-- Main Content-->
            <main class="mb-4">
                <div  style="background-image: url('')" >
                    <div class="container px-4 px-lg-5" style="border-radius: 20px;" >
                        <div class="row gx-4 gx-lg-5 justify-content-center"  >
                            <div class="col-md-10 col-lg-8 col-xl-7" style="background: white;border-radius: 15px;" >
                                <div class="my-5">
                                    <form action="EditBlogStudentServlet" method="post" enctype="multipart/form-data" id="contactForm" data-sb-form-api-token="API_TOKEN" >
                                        <c:set var="errors" value="${requestScope.CREATEERROR}"/>
                                        <input type="hidden" name="txtBlogId" value="${param.txtBlogId}"/>
                                        <div class="form-floating" style="padding-bottom: 30px">
                                            <input class="form-control"  type="text" name="txtTitle" placeholder="title" value="${requestScope.BLOGDETAILS.title}">
                                            <label for="content" style="color: darkblue;font-weight: bold;">Content title</label>
                                            <input type="hidden" name="txtBlogId" value="${requestScope.BLOGDETAILS.id}">
                                            <td>
                                                <c:if test="${not empty errors.idLengthError}">
                                                    <font color="red">${errors.idLengthError}</font><br/>
                                                </c:if>
                                            </td> 
                                        </div>
                                        <div>                                      
                                            <label for="Name" style="color: darkblue;font-weight: bold;padding-right: 10px;padding-bottom: 30px;">Tag: </label>
                                            <c:set var="mytag" scope="request" value="${requestScope.BLOGTAGS}"/>
                                            <c:forEach var="tag" items="${requestScope.ALLTAGS}">
                                                <c:choose>
                                                    <c:when test="${fn:contains(mytag, tag.tagId)}">
                                                        <input type="checkbox" name="tags" value="${tag.tagId}" checked="checked"/>
                                                        <label style="padding-right: 20px;" for="tag">${tag.tagName}</label>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="checkbox" name="tags" value="${tag.tagId}"/>
                                                        <label style="padding-right: 20px;" for="tag">${tag.tagName}</label>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </div>
                                        <div >
                                            <label for="Name" style="color: darkblue;font-weight: bold;padding-right: 15px;padding-bottom: 30px;">Subject:</label>
                                            <select style="border-radius: 10px;" name="subjectId">
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
                                        </div>
                                        <label for="detail" style="color: darkblue;font-weight: bold;padding-bottom: 10px;" >Content Detail</label>
                                        <textarea style="width: 100%;border-radius: 15px;" cols="30" rows="10" type="text" name="txtDetail" placeholder="detail"><c:out value="${requestScope.BLOGDETAILS.blogContent}"/></textarea>
                                        <td>
                                            <c:if test="${not empty errors.fullnameLengthError}">
                                                <font color="red">${errors.fullnameLengthError}</font><br/>
                                            </c:if>
                                        </td> 
                                        </br>
                                        </br>
                                        <div style="padding-bottom: 30px;"></div>

                                        <div >
                                            <label for="content" style="color: darkblue;font-weight: bold;padding-bottom: 15px;" >Image</label>
                                            <input style="border-radius: 15px;" class="form-control"  type="file" name="img" accept="image/*" multiple size="45" placeholder="url">
                                        </div>
                                        <br/>
                                        
                                        <div >
                                            <label for="content" style="color: darkblue;font-weight: bold;padding-bottom: 15px;" >Video</label>
                                            <input style="border-radius: 15px;" class="form-control"  type="file" name="vid" accept="video/*" multiple size="45" placeholder="url">
                                        </div>
                                        
                                        </br>
                                        <button style="margin: auto;display: block;border-radius: 25px;background-color: #2f3333;width: 500px; height: 50px; margin-bottom: 2vw" class="btn btn-primary e" id="submitButton"
                                                type="submit" name="btnAction" value="Create blog">Update</button>
                                    </form>
                                        <input type="hidden" name="pageEdit" value="ViewEditBlogStudentServlet"/>
                                       <c:if test="${not empty requestScope.BLOGIMAGES}">
                                        <text style="font-weight: bold;color: darkblue">Current images:</text>
                                       </c:if>
                                    <c:forEach var="images" items="${requestScope.BLOGIMAGES}">
                                        <form action="DeleteImageServlet" method="post">
                                            <div>
                                            <input type="hidden" name="txtBlogId" value="${requestScope.BLOGDETAILS.id}">
                                            <input type="hidden" name="txtImageId" value="${images.id}">
                                            <img  style="width: 800px;height: 400px;border-radius: 10px;" src="${images.url}" />
                                            </div>
                                            <div style="margin-top: 2vw;margin-bottom: 2vw">
                                            <button style="margin: auto;display: block;border-radius: 25px;background-color: #2f3333;width: 500px; height: 50px;" class="btn btn-primary e" id="submitButton"
                                                    type="submit" name="btnAction" value="Delete image">Delete image</button>
                                                </div>
                                        </c:forEach>
                                            <input type="hidden" name="pageEdit" value="ViewEditBlogStudentServlet"/>
                                    </form>
                                        <c:if test="${not empty requestScope.BLOGVIDEOS}">
                                    <text style="font-weight: bold;color: darkblue">Current videos:</text>
                                        </c:if>
                                    <c:forEach var="videos" items="${requestScope.BLOGVIDEOS}">
                                        <form action="DeleteVideoServlet" method="post">
                                            <div>
                                                <input type="hidden" name="txtBlogId" value="${requestScope.BLOGDETAILS.id}">
                                                <input type="hidden" name="txtVideoId" value="${videos.id}">
                                                <video style="width: 800px;height: 400px;border-radius: 10px;" src="${videos.url}" controls/>
                                            </div>
                                            <div style="margin-bottom: 2vw;margin-top: 2vw">
                                            <button style="margin: auto;display: block;border-radius: 25px;background-color: #2f3333;width: 500px; height: 50px;" class="btn btn-primary e" id="submitButton"
                                                    type="submit" name="btnAction" value="Delete video">Delete video</button>
                                                </div>
                                        </form>
                                            <input type="hidden" name="pageEdit" value="ViewEditBlogStudentServlet"/>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
            <!-- Footer-->
            <footer class="border-top" style="background-image: url('');background-size: cover" class="border-top">
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
