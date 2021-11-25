<%-- 
    Document   : blog
    Created on : 08-10-2021, 22:18:59
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
        <title>Clean Blog - Start Bootstrap Theme</title>
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

        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light" id="mainNav">
            <div class="container px-4 px-lg-5">
                <c:if test="${not empty sessionScope.USER}">
                    <a class="navbar-brand" style="font-style: italic;" >Welcome,${sessionScope.USER}</a>
                </c:if>
                <c:if test="${empty sessionScope.USER}">
                    <a class="navbar-brand" style="font-style: italic;">Blog Academic</a>
                </c:if>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto py-4 py-lg-0">
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="GetListAllBlogStudentServlet">Home</a></li>
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
                        <c:set var="blogDTO" value="${requestScope.BLOGDETAIL}"/>
                        <div class="post-heading">
                            <h1 style="font-size: 3.5rem;font-style: italic">${blogDTO.title}</h1>                               
                            <div style="font-style: italic;">
                                <c:set var="blogDTO" value="${requestScope.BLOGDETAIL}"/>
                                <input type="hidden" name="txtBlogId" value="${blogDTO.id}"<br>
                                <br/>
                                Create by
                                <c:forEach var="accountName" items="${requestScope.LISTACCOUNT}">
                                    <c:if test="${(accountName.id eq blogDTO.createBy.id)}">
                                        <c:out value="${accountName.username}"/></font>
                                    </c:if> 
                                </c:forEach> on ${blogDTO.createOn} <br>
                                <div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </header>
                    <!-- Post Content-->
                    <article class="mb-4">
                        <div class="container px-4 px-lg-5" >
                            <form action="MainController" method="POST">
                                <div class="row gx-4 gx-lg-5 justify-content-center" style="border-radius: 20px;border-style: solid; background-color: #F1F3F7;">
                                    <div class="col-md-10 col-lg-8 col-xl-7">
                                        <c:set var="blogDTO" value="${requestScope.BLOGDETAIL}"/>

                                            <div>
                                                <label style="font-family: inherit;font-size: 25px;padding-right: 20px;padding-bottom: 20px;color:  ">Subject: </label>
                                                <c:forEach var="subject" items="${requestScope.LISTSUBJECT}">
                                                    <c:if test="${(subject.subjectId eq blogDTO.subjectId.subjectId)}">
                                                        <font style="font-size: 20px;font-family: monospace" ><c:out value="${subject.subjectId} - ${subject.subjectName}"/></font>
                                                    </c:if> 
                                                </c:forEach>
                                            </div>

                                        <c:if test="${not empty requestScope.LISTAWARD}">
                                            <label style="font-family: inherit;font-size: 25px;padding-right: 20px;padding-bottom: 20px;color:  "> Award:</label>
                                        </c:if>
                                        <div>
                                            <c:forEach var="award" items="${requestScope.LISTAWARD}">
                                                <font color="#647C90" style="font-family: monospace"><c:out value="${award.detail}"/></font>
                                            </c:forEach>
                                        </div>

                                        <%-- Image --%>
                                        <c:if test="${not empty requestScope.LISTIMAGE}">
                                            <div>
                                                <label style="font-family: inherit;font-size: 25px;padding-right: 20px;padding-bottom: 20px;color:"> Image:</label>
                                                <input type="hidden" name="txtBlogId" value="${blogDTO.id}"/>
                                                <c:forEach var="img" items="${requestScope.LISTIMAGE}">
                                                    <img  style="width: 800px;height: 400px;border-radius: 10px;margin-bottom: 40px" src="${img.url}"; />
                                                </c:forEach>
                                            </div>
                                        </c:if>
                                        <div style="padding-bottom: 30px;"></div>

                                        <div style="font-family: monospace;font-size: 20px;padding-bottom: 30px;">
                                            ${blogDTO.blogContent}
                                        </div>


                                        <c:if test="${not empty requestScope.VIDEODTO}">

                                            <label style="font-family: inherit;font-size: 25px;padding-right: 20px;padding-bottom: 20px;color:  "> Video:</label>

                                            <c:forEach var="videoDTO" items="${requestScope.VIDEODTO}">
                                                <div>
                                                    <video src="${videoDTO.url}" controls style="width: 100%;margin-bottom: 40px"/>
                                                </div>
                                            </c:forEach>

                                        </c:if>
                                        <div style="padding-bottom: 30px;"></div>
                                        <c:if test="${not empty requestScope.LISTTAG}">
                                            <div style="font-family: inherit;" class="botron">
                                                <label style="font-size: 25px;padding-right: 20px;padding-bottom: 20px;;color: ">Tag:</label>
                        
                                                <c:forEach var="tagDto" items="${requestScope.LISTTAG}">
                                                    ${tagDto.tagName}
                                                </c:forEach>
                                            </div>
                                        </c:if>
                                    </div>
                                    <div>

                                        <label style="font-family: inherit"> Voted:</label>
                                        <label style="#A3E4D7">  ${blogDTO.voteTotal} </label>
                                        <span class="fa fa-star checked" style="color: #F4D03F"></span>

                                    </div>
                                    <input type="hidden" name="txtVoteTotal" value="${blogDTO.voteTotal}"/>

                                    </br>
                                    </br>
                                    <text style="font-style: italic;font-weight: bold;text-decoration-line: underline;color: blue;font-size: 20px">Comment:</text><br><br>
                                    <div style="border-style: solid;border-radius: 10px;width: 1000px;margin-right:  200px;;overflow-y: scroll;height: 400px;background-color: white;">

                                        <c:forEach var="listComment" items="${requestScope.LISTCOMMENT}">
                                            <div style="padding-bottom: 20px;"></div>
                                            <div style=" ;border-radius: 10px;background-color: #ffffff;
                                                 background-image: linear-gradient(315deg, #ffffff 0%, #d7e1ec 74%);border: solid 0.5px black">

                                                <text style="font-weight: bold;padding-left: 1vw ">${listComment.createBy}</text> 
                                                <div style="font-family: monospace;word-wrap: break-word;width: auto;padding-left: 2vw">
                                                    ${listComment.detail}
                                                </div>
                                                <text style="font-size: small; margin-left: 700px;color: "> ${listComment.createOn}</text>                                                                                                       
                                            </div>
                                            <div style="padding-bottom: 20px;"></div>
                                        </c:forEach>

                                    </div>
                                    <c:if test="${not empty sessionScope.USER}">
                                        <div style="padding-top: 20px;">

                                            <div  class="ct-box">

                                                <text style="font-style: italic;font-weight: bold;color: ">New Comment:</text>
                                                <div style="padding-top: 10px;padding-bottom: 10px;"></div>
                                                <textarea name="txtCommentDetail" style="width: 600px;background-color: #ffffff;
                                                          background-image: linear-gradient(315deg, #ffffff 0%, #d7e1ec 74%);" placeholder="Type Your Comment..."></textarea>
                                            </div>
                                            <div class="blograting-container">
                                                <div style="font-style: italic;font-weight: bold;color: "> Blog Rating :</div> 
                                                <div class="container1">      
                                                    <div class="rating-wrapper">
                                                        <input type="radio" name="rating" id="rating1" value="5"><label for="rating1">
                                                        </label>
                                                        <input type="radio" name="rating" id="rating2" value="4"><label for="rating2">
                                                        </label>
                                                        <input type="radio" name="rating" id="rating3" value="3"><label for="rating3">
                                                        </label>
                                                        <input type="radio" name="rating" id="rating4" value="2"><label for="rating4">
                                                        </label>
                                                        <input type="radio" name="rating" id="rating5" value="1" checked><label for="rating5">
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <br/><br/>
                                            <div class="ct-box" style="padding-bottom: 30px;">
                                                <button type="submit" value="Post Comment" name="btnAction" >Comment</button>
                                            </div>

                                        </div>
                                    </c:if>
                                    <c:if test="${empty sessionScope.USER}">
                                        <h1>
                                            <font color="red" style="font-family: Lora;font-size: 20px;color: blue">
                                            Login to leave a comment here!
                                            </font>
                                        </h1>
                                        <a href="login.jsp" style="font-family: Lora;font-size: 16px;color: red;text-decoration: underline;" class="a-back">Click here to Login</a>
                                    </c:if>
                                </div>
                            </form>
                        </div>

                    </article>

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
                                    <div class="small text-center text-muted fst-italic">Copyright &copy; Your Website 2021</div>
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
