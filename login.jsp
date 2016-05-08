<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8"/>
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Lendock</title>
        <link rel="stylesheet" href="css/bootstrap.css"/>
        <link rel="stylesheet" href="css/app.css"/>
        <link rel="stylesheet" href="css/font-awesome.min.css"/>
        <script>           // This is called with the results from from FB.getLoginStatus().
            function statusChangeCallback(response) {
                console.log('statusChangeCallback');
                console.log(response);
                // The response object is returned with a status field that lets the
                // app know the current login status of the person.
                // Full docs on the response object can be found in the documentation
                // for FB.getLoginStatus().

            }

            // This function is called when someone finishes with the Login
            // Button.  See the onlogin handler attached to it in the sample
            // code below.
            function checkLoginState() {
                FB.getLoginStatus(function (response) {
                    statusChangeCallback(response);
                });
            }

            window.fbAsyncInit = function () {
                FB.init({
                    appId: '475063482682252',
                    cookie: false, // enable cookies to allow the server to access 
                    // the session
                    xfbml: true, // parse social plugins on this page
                    version: 'v2.5' // use graph api version 2.5
                });

                // Now that we've initialized the JavaScript SDK, we call 
                // FB.getLoginStatus().  This function gets the state of the
                // person visiting this page and can return one of three states to
                // the callback you provide.  They can be:
                //
                // 1. Logged into your app ('connected')
                // 2. Logged into Facebook, but not your app ('not_authorized')
                // 3. Not logged into Facebook and can't tell if they are logged into
                //    your app or not.
                //
                // These three cases are handled in the callback function.

                FB.getLoginStatus(function (response) {
                    statusChangeCallback(response);
                });

            };

            // Load the SDK asynchronously
            (function (d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id))
                    return;
                js = d.createElement(s);
                js.id = id;
                js.src = "//connect.facebook.net/en_US/sdk.js";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));</script>
    </head>
    <body>       
        <div class="container">
            <div class="row margin-top-65">
                <div class="login-main">
                    <img class="center margin-30" src="img/lendock-logo-1.png">
                    <h3 class="center">Log in <a href="/signup.html">or create new account</a></h3>
                    <div class="row">      
                        <div class="col-xs-6 col-sm-6 col-md-6"><fb:login-button scope="public_profile,email" onlogin="checkLoginState();"></fb:login-button></div>
                        <div class="col-xs-6 col-sm-6 col-md-6"><a href="#" class="btn btn-lg gp-login btn-block">Google <i class="fa fa-google-plus-square"></i></a></div>
                    </div>
                    <div class="login-or">
                        <hr class="hr-or">
                        <span class="span-or">or</span></div>
                    <form role="form" action="/LoginServlet" method="post">
                        <div class="form-group"><label for="inputUsernameEmail">Username or email</label>
                            <input type="text" class="form-control" name="username" id="inputUsernameEmail">
                        </div>
                        <div class="form-group"><a class="pull-right" href="/forgot.jsp">Forgot password?</a> <label for="inputPassword">Password</label>
                            <input type="password" name="password" class="form-control" id="inputPassword"></div>
                            <c:if test="${param.err == 0}" >
                            <p class="red-color">Login or username incorrect</p>
                        </c:if>
                        <div class="checkbox pull-right"><label> <input name="remember" type="checkbox"> Remember me </label></div>
                        <button type="submit" class="btn btn btn-primary"> Log In</button>
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="/footer.html" />
    </body>
</html>