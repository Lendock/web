<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <script src="/js/vendor/jquery.min.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="row margin-top-65">
                <div class="login-main">
                    <img class="center margin-30" src="img/lendock-logo-1.png">
                    <h3 class="margin-bottom-20">Update password</h3>
                    <form action="/UpdatePassword" method="post">
                        <div class="form-group">
                            <label for="newPass">New password</label>
                            <input type="password"  name="password" class="form-control" id="newPass" placeholder="Password">
                        </div>
                        <div class="form-group">
                            <label for="newPass2">Repeat new password</label>
                            <input type="password" class="form-control" id="newPass2" placeholder="Password">
                        </div>
                        <input type='hidden' name='id' value="${param.id}">
                        <button type="submit" class="btn btn-success">Update password</button>
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="/footer.html"/>
    </body>
</html>