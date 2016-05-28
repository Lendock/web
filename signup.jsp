<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <link rel="icon" type="image/png" href="/img/lendock-favicon.png">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Lendock</title>
    <link rel="stylesheet" href="css/bootstrap.css"/>
    <link rel="stylesheet" href="css/app.css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
            <script>
            function checkLoginState() {
                FB.getLoginStatus(function (response) {
                    FB.login(function (response) {
                        // handle the response
                        // The response object is returned with a status field that lets the
                        // app know the current login status of the person.
                        // Full docs on the response object can be found in the documentation
                        // for FB.getLoginStatus().
                        if (response.status === 'connected') {
                            FB.api('/me', function (response) {
                                console.log(response);
                            });
                        } else if (response.status === 'not_authorized') {
                            // The person is logged into Facebook, but not your app.
                            document.getElementById('status').innerHTML = 'Please log ' +
                                    'into this app.';
                        } else {
                            // The person is not logged into Facebook, so we're not sure if
                            // they are logged into this app or not.
                            document.getElementById('status').innerHTML = 'Please log ' +
                                    'into Facebook.';
                        }
                    }, {scope: 'public_profile,email'});
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
            }(document, 'script', 'facebook-jssdk'));
        </script>
</head>
<body>
<div class="container">
    <div class="row margin-top-65">
        <div class="login-main">
            <img class="center margin-30" src="img/lendock-logo-1.png">
            <h2 class="text-center">Lendock-a<br> xoş gəlmisiniz</h2>
            <h4 class="text-center">Sürətli qeydiyyatdan keçmək üçün: </h4>
            <div class="row">
                <div class="col-xs-offset-3 col-xs-6"><a class="btn btn-lg fb-login btn-block" onclick="checkLoginState();">Facebook <i class="fa fa-facebook-square"></i> </a></div>
                <!--div class="col-xs-6 col-sm-6 col-md-6"><a href="#" class="btn btn-lg gp-login btn-block">Google <i class="fa fa-google-plus-square"></i> </a>
                </div-->
            </div>
            <div class="login-or">
                <hr class="hr-or">
                <span class="span-or">və ya</span></div>
            <h4 class="text-center">email ilə qeydiyyat olun</h4>
            <form role="form" action="/NewUser" method="post">
                <div class="form-group"><label for="fname">Adınız</label> <input type="text" class="form-control" name="first-name" id="fname">
                </div>
                <div class="form-group"><label for="lname">Soyadınız</label> <input type="text" class="form-control" name="last-name" id="lname">
                </div>
                <div class="form-group"><label for="email">Email</label> <input type="text" class="form-control" name="email" id="email">
                </div>
                <div class="form-group"><label for="username">İstifadəçi adı</label> <input type="text" class="form-control" name="user-name" id="username">
                </div>
                <div class="form-group"><label for="pass">Şifrə</label>
                    <input type="password" name="passwd" class="form-control" id="pass"></div>
                <button type="submit" class="btn btn btn-primary">Qeydiyyat</button>
            </form>
        </div>
    </div>
</div>
<jsp:include page="/footer.jsp" />
<script src="js/vendor/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>