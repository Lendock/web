<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <script src="/js/vendor/jquery.min.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="row margin-top-65">
                <div class="login-main">
                    <img class="center margin-30" src="img/lendock-logo-1.png">
                    <h3 class="margin-bottom-20">Password assistance</h3>
                    <p>Enter the email address associated with your Lendock account, then click Send link.</p>
                    <form action="/ForgotPassword" method="get">
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" name="email" class="form-control" id="email" placeholder="email">
                            <c:if test="${param.ok==1}">
                                <p class="green-color">Check your email</p>
                            </c:if>
                            <c:if test="${param.ok==0}">
                                <p class="red-color">Email doesn't exist!</p>
                            </c:if>
                            <c:if test="${param.ok==2}">
                                <p class="red-color">An error occured and mail was not sent. It seems we have your email in our database but can't send you a mail</p>
                            </c:if>
                        </div>
                        <button type="submit" class="btn btn-success">Send link</button>
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="/footer.jsp"/>
    </body>
</html>