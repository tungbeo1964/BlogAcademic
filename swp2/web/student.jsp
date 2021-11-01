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
                    <a class="navbar-brand" >Welcome,${sessionScope.USER}</a>
                    <input type="hidden" name="currentPage" value="student.jsp"/>
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
            <header class="masthead" style="background-image: url('assets/img/home-bg.jpg')">
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
            <div style="background-image: url(''); background-size: 100%;min-height: 900px" class="container1 px-4 px-lg-5" 
                 >
                <div  class="left-sidebar">
                    <div style="padding-bottom: 100px"></div>
                    <form style="padding-bottom: 50px;" action="MainController" method="POST">
                        <input type="text" name="txtSearchValue" value=""/>
                        <input type="hidden" name="currentPage" value="student.jsp"/>
                        <input type="submit" value="Search" name="btnAction"/>
                    </form>
                    <h2 class="h5-x" style="background-color: white;color: green;margin-bottom: 20px;font-family: cursive" >Subject</h2>
                    
                    <div class="link" >
                        <c:forEach var="subject" items="${requestScope.LISTSUBJECT}">
                            <form method="POST" >
                                <c:url var="searchSubject" value="MainController" >
                                    <c:param name="btnAction" value="searSub"/>
                                    <c:param name="pkSub" value="${subject.subjectId}"/>
                                    <c:param name="currentPage" value="student.jsp"/>
                                </c:url>
                                
                                <a href="${searchSubject}" >${subject.subjectId}</a>
                            </form>
                        </c:forEach>
                    </div>

                </div> 

                <div class="main-content row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <!-- Post preview-->

                        <div class="row gx-4 gx-lg-5 justify-content-center">
                            <div class="col-md-10 col-lg-8 col-xl-7">
                                <table>
                                    <c:forEach var="listBlog" items="${requestScope.LISTBLOG}">
                                        <!-- Post preview-->
                                        <form action="MainController" method="GET">
                                            <div class="post-preview">
                                                <input type="hidden" name="txtBlogId" value="${listBlog.id}"/>
                                                <h2 class="post-title">${listBlog.title}</h2>
                                                <p>
                                                    Posted by
                                                    <c:forEach var="accountName" items="${requestScope.LISTACCOUNT}">
                                                        <c:if test="${(accountName.id eq listBlog.createBy.id)}">
                                                            <font color="blue"><c:out value="${accountName.username}"/></font>
                                                        </c:if> 
                                                    </c:forEach>
                                                    <br/>
                                                    ${listBlog.createOn}
                                                </p>
                                            </div>
                                            <button   style="background-color: #ffffff;font-size: 15px;color: green"
                                                  type="submit" value="View Detail" name="btnAction">
                                            View Blog
                                        </button>
                                        </form>
                                    </c:forEach>
                                </table>
                            </div>
                        </div>



                    </div>
                </div>
                <div  class="right-sidebar">
                    <h2 class="h5-x" style="background-color: white;color: green;margin-bottom: 20px;font-family: cursive">Top 5 Blog</h2>
                    <div >  
                        <div class="link">
                            <c:forEach var="listTop5" items="${requestScope.LISTTOP5}">
                                <form  method="POST">
                                    <c:url var="viewBlog" value="MainController">
                                        <c:param name="btnAction" value="View Blog Detail Mentor"/>
                                        <c:param name="txtBlogId" value="${listTop5.id}"/>
                                    </c:url>
                                    <a href="${viewBlog}">${listTop5.title}</a>
                                </form>
                            </c:forEach>
                        </div>
                    </div>
                    
                    <br/>
                    <h2 class="h5-x" style="background-color: white;color: green;margin-bottom: 20px;font-family: cursive">Tags</h2>
                    <div >  
                        <div class="link">
                            <c:forEach var="tag" items="${requestScope.LISTTAG}">
                                <form method="POST">
                                    <c:url var="searchTag" value="MainController">
                                        <c:param name="btnAction" value="sear"/>
                                        <c:param name="pk" value="${tag.tagName}"/>
                                        <c:param name="currentPage" value="student.jsp"/>
                                    </c:url>
                                    <a href="${searchTag}">${tag.tagName}</a>
                                </form>
                            </c:forEach>
                        </div>

                    </div>
                </div> 
            </div>
            <!-- Footer-->
            <footer style="background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAARwAAACxCAMAAAAh3/JWAAAAflBMVEUAAAD///8EBAQbGxseHh4JCQkLCwsiIiIXFxcPDw8UFBQZGRkkJCQnJycfHx8SEhIuLi45OTkxMTE7OzuQkJDm5uZqamr19fXMzMzGxsaYmJi/v7+2tratra1JSUl5eXlRUVFjY2OKiorv7+90dHTU1NRCQkLg4OBYWFikpKTDPn4gAAADD0lEQVR4nO3a21LbMBRAUWwplmJLskggKQnXQin9/x+sJDvkWvXRmdFeb/Dk2XN0fIGbm2sixdRXcMWIk0GcDOJkECeDOBnEySBOBnEyiJNBnAziZBAngzgZxMkgTgZxMoiTQZwM4mQQJ4M4GcTJIE4GcTKIk0GcDOJkECeDOBnOTX0FV6s23pt66qu4Up0P9NRXcYXqeta3ndZd289qpudQHajFSMUfp76i6xFizGatUsYYpVQ7m1HnW0zTNHZxmyxM08w4WoM0Nk3f29uR6fuG4RmFOE2vhQ+Ts1yGOFboUIc20dBGzp/vRp+9pM4oHKp5K9qX6tuHFu08HKypr2x6aXCEs/f7OPfOdYxOFAdHS/W6b1Otn43UjM5ucIxZHcSp3qxidG5SnHkrrb07jPPTWhm2DnHC4HTKmx+HcR6MH0Zn6qubVjxVrTB+uT6M837rjWiLP1dpHTvrX6ojH9664lfyuI69+nUc54cJo1P4Sq7HdexfqxOfvviVXI/rWD2cxtmG0Sn8bp4GR1j/ddqmql69FUWPTjhVTVzHx/fx8W6u4kpuCv5wMT4dv5y3qaqVHVby1Nc4mbSOzeE7595vE1ZywUsnrhztzNulNlX1ZeKjTsFxmnmnxJ/LcTZSdXHpTH2VExlu5Hp7Oc5jF96vCp6cFKc7e8gZbMc4hdYZ4/xrckTZkxMW8n92TtlxtFOry3HeSr9bpeecxfpSm3dvyn71HJ6QxeOlOE+y+Cfk8KDjzNkHi+g5nqqi46S3cnNpJW/Cr4s+Vel7Tnwt785ey7edlWlwyo2TRic86px9tHiQ/OVq/E4qlFVHJ2vjrBr+XF5ynOFgxTric3fPWj8upXWhTeGDc7OrE25ZRpjV5ulps1LCGNokdarTa+GMVVIIGRaQE7pPbUqPs/uvt1YL6VTgpNAt//c2GuqE6Wm17jodyswb2nxLecLhGoUypNmrhzxhfmKYlIY2e/WJqa/n2lAGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAErzF4PtIqdpeSElAAAAAElFTkSuQmCC');background-position-y: 100%; background-position-x: 100%" class="border-top">
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
