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
    <body style="background-image: url('https://i0.wp.com/www.spindleensemble.com/wp-content/uploads/2017/08/PeachWatercolorWallpaper_Pixejoo.jpg?fit=2472%2C1856');background-size: cover">
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
                            <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="GetListAllBlogStudentServlet">Home</a></li>
                            <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="ViewStudentProfileServlet">View profile</a></li>
                            <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="ViewCreateBlogServlet">Create Post</a></li>
                            <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="ViewHistoryBlogStudentServlet">History</a></li>
                            
                            <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="LogoutServlet">Logout</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- Page Header-->
            <header class="masthead" style="background-image: url('assets/img/post-bg.jpg')">
                <div class="container position-relative px-4 px-lg-5">
                    <div class="row gx-4 gx-lg-5 justify-content-center">
                        <div class="col-md-10 col-lg-8 col-xl-7">
                            <c:set var="blogDTO" value="${requestScope.BLOGDETAIL}"/>
                            <div class="post-heading">
                                <h1>${blogDTO.title}</h1>
                                <div style="font-style: italic">
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
                            <div class="container px-4 px-lg-5">
                                <form action="MainController" method="POST">
                                    <div class="row gx-4 gx-lg-5 justify-content-center">
                                        <div class="col-md-10 col-lg-8 col-xl-7">
                                            <c:set var="blogDTO" value="${requestScope.BLOGDETAIL}"/>

                                            <div>
                                                <c:forEach var="subject" items="${requestScope.LISTSUBJECT}">
                                                    <c:if test="${(subject.subjectId eq blogDTO.subjectId.subjectId)}">
                                                        <font color="blue"><c:out value="${subject.subjectId} - ${subject.subjectName}"/></font>
                                                    </c:if> 
                                                </c:forEach>
                                            </div>

                                            Award:
                                            <div>
                                                <c:forEach var="award" items="${requestScope.LISTAWARD}">
                                                    <font color="blue"><c:out value="${award.detail}"/></font>
                                                </c:forEach>
                                            </div>

                                            <%-- Image --%>
                                            <div>
                                                Image:<br/>
                                                <input type="hidden" name="txtBlogId" value="${blogDTO.id}"/>
                                                <c:forEach var="img" items="${requestScope.LISTIMAGE}">
                                                    <img src="${img.url}" width="250" height="200"/>
                                                </c:forEach>
                                            </div>
                                            <br/>
                                            <br/>                         
                                            <br/>

                                            <br/>
                                            ${blogDTO.blogContent}
                                            <br/>
                                            <div>
                                                Video:<br/>
                                                <c:forEach var="videoDTO" items="${requestScope.VIDEODTO}">
                                                    <video src="${videoDTO.url}" controls/>
                                                </c:forEach>
                                            </div>
                                            <div style="font-family: cursive;" class="botron">
                                                Tag:
                                                <c:forEach var="tagDto" items="${requestScope.LISTTAG}">
                                                    ${tagDto.tagName}
                                                </c:forEach>
                                            </div>
                                        </div>
                                        Voted: ${blogDTO.voteTotal}<br>
                                        <input type="hidden" name="txtVoteTotal" value="${blogDTO.voteTotal}"/>

                                        --------------------------------------------------------------------------------------------------------------

                                        <div>
                                            <text style="font-style: italic;font-weight: bold;text-decoration-line: underline">Comment</text><br><br>
                                            <c:forEach var="listComment" items="${requestScope.LISTCOMMENT}">
                                                <table>
                                                    <td style="border-bottom: 2px solid #3CA444;min-width: 1203px;line-break: anywhere">
                                                        <text style="font-weight: bold">${listComment.createBy}</text> <br/>
                                                        ${listComment.detail}<br/>
                                                        <text style="font-size: small">voted ${listComment.vote} on ${listComment.createOn}</text>
                                                        <br/>
                                                    </td>
                                                </table>
                                            </c:forEach>
                                        </div>

                                        <div>

                                            <div class="ct-box">
                                                <br>
                                                <text style="font-style: italic;font-weight: bold">New Comment</text>
                                                <textarea name="txtCommentDetail" placeholder="Type Your Comment..."></textarea>
                                            </div>
                                            <div class="blograting-container">
                                                Blog Rating :
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
                                                        <input type="radio" name="rating" id="rating5" value="1"><label for="rating5">
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <br/><br/>
                                            <div class="ct-box">
                                                <button type="submit" value="Post Comment" name="btnAction" >Comment</button>
                                            </div>

                                        </div>
                                    </div>
                                </form>
                            </div>

                        </article>

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
