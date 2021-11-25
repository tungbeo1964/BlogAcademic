<%-- 
    Document   : login
    Created on : 17-09-2021, 19:22:09
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <title>password</title>
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
                        <span class="login100-form-title">
                            Find Account
                        </span>
                        
                        <c:set var="error" value="${requestScope.CHECKACCOUNTERROR}"/>
                            <font color="red">${error.idLengthError}</font> <br/>
                        
                        <div class="wrap-input100 validate-input m-b-16" data-validate = "Please enter email">
                            <input class="input100" type="text" name="txtUserName" placeholder="Input your username">
                            <span class="focus-input100"></span>
                        </div>
                      
                        <div class="wrap-input100 validate-input m-b-16" data-validate = "Please enter email">
                            <input class="input100" type="text" name="txtEmail" placeholder="Input your Email">
                            <span class="focus-input100"></span>
                        </div>
                       
                        <br/>
                        <div class="container-login100-form-btn">
                            <button type="submit" name="btnAction" value="Find Account" class="login100-form-btn">
                               Find
                            </button>
                        </div>
                    </form>

                    <div class="flex-col-c p-t-170 p-b-40">
                        <span class="txt1 p-b-9">
                            Don’t have an account?
                        </span>

                        <a href="register.jsp" class="txt3">
                            Sign up now
                        </a>
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