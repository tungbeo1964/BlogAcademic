<%-- 
    Document   : register
    Created on : 17-09-2021, 22:10:28
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Register</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->	
        <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <!--===============================================================================================-->
    </head>
    <body>
        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <form action="MainController" method="POST" class="login100-form validate-form p-l-55 p-r-55 p-t-178">

                        <c:set var="errors" value="${requestScope.CREATEERROR}"/>
                        <span class="login100-form-title">
                            Sign Up
                        </span>


                        <div class="wrap-input100 validate-input m-b-16" data-validate="Please enter ID">
                            <input class="input100" type="text" name="txtId" value="${param.txtId}" placeholder="ID">
                            <span class="focus-input100"></span>

                        </div>
                        <td>
                            <c:if test="${not empty errors.idLengthError}">
                                <font style="text-align: center" color="red">&ensp; ${errors.idLengthError}</font><br/>
                            </c:if>
                        </td> 
                        <div class="wrap-input100 validate-input m-b-16" data-validate = "Please enter password">
                            <input class="input100" type="password" name="txtPassword" placeholder="Password">
                            <span class="focus-input100"></span>

                        </div>
                        <td>
                            <c:if test="${not empty errors.passwordLengthError}">
                                <font color="red">&ensp; ${errors.passwordLengthError}</font><br/>
                            </c:if>
                        </td>
                        <div class="wrap-input100 validate-input m-b-16" data-validate = "Please enter confirm">
                            <input class="input100" type="password" name="txtConfirm" placeholder="Confirm">
                            <span class="focus-input100"></span>

                        </div>
                        <td>
                            <c:if test="${not empty errors.confirmNotMatch}">
                                <font color="red">&ensp; ${errors.confirmNotMatch}</font><br/>
                            </c:if>
                        </td> 
                        <div class="wrap-input100 validate-input m-b-16" data-validate="Please enter username">
                            <input class="input100" type="text" name="txtFullname" value="${param.txtFullname}" placeholder="Username">
                            <span class="focus-input100"></span>

                        </div>
                        <td>
                            <c:if test="${not empty errors.fullnameLengthError}">
                                <font color="red">&ensp; ${errors.fullnameLengthError}</font><br/>
                            </c:if>
                        </td> 
                        <div class="wrap-input100 validate-input m-b-16" data-validate="Please enter eamil">
                            <input class="input100" type="text" name="txtEmail" value="${param.txtEmail}" placeholder="Email">
                            <span class="focus-input100"></span>

                        </div>
                        <td>
                            <c:if test="${not empty errors.emailValidation}">
                                <font color="red">&ensp; ${errors.emailValidation}</font><br/>
                            </c:if>
                        </td>
                        <div class="wrap-input100 validate-input m-b-16" data-validate = "Please enter phone">
                            <input class="input100" type="text" name="txtPhone" value="${param.txtPhone}" placeholder="Phone">
                            <span class="focus-input100"></span>

                        </div>
                        <td>
                            <c:if test="${not empty errors.phoneLengthError}">
                                <font color="red">&ensp; ${errors.phoneLengthError}</font><br/>
                            </c:if>
                        </td> 
                        <br/>

                        <div class="container-login100-form-btn">
                            <button type="submit" name="btnAction" value="Sign Up" class="login100-form-btn">
                                Sign Up
                            </button>
                        </div>
                    </form>
                    <c:if test="${not empty errors.userIsExisted}">
                        <font color="red">${errors.userIsExisted}</font><br/>
                    </c:if>

                    <div class="flex-col-c p-t-170 p-b-40">
                        <span class="txt1 p-b-9">                               
                            <a href="login.jsp" class="txt3">
                                Login Now
                            </a>                              
                        </span>

                    </div>
                    </form>
                </div>
            </div>
        </div>


        <!--===============================================================================================-->
        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/animsition/js/animsition.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/bootstrap/js/popper.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/select2/select2.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/daterangepicker/moment.min.js"></script>
        <script src="vendor/daterangepicker/daterangepicker.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/countdowntime/countdowntime.js"></script>
        <!--===============================================================================================-->
        <script src="js/main.js"></script>
    </body>
</html>
