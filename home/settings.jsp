<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Lendock</title>
</head>
<body class="bg-filter">
<jsp:include page="/header.jsp" />
<div class="container">
    <div class="row margin-top-65">
        <div class="col-sm-3 col-md-2">
            <ul class="nav nav-pills nav-stacked dashboard-tabs" id="example-vert-tabs">
                <li class="tabs-title"><a href="/home/profile.jsp"><img class="tabs-icons" src="../img/profile.png"><br>Profile</a>
                </li>
                <li class="tabs-title"><a href="/GetOutgoingRequests"><img class="tabs-icons"
                                                                      src="../img/borrow-icon.png"><br>My
                    Borrowings</a></li>
                <li class="tabs-title"><a href="/AllMyCars"><img class="tabs-icons"
                                                                src="../img/vehicle.png"><br>Dock</a></li>
                <li class="tabs-title"><a href="/GetWishlist"><img class="tabs-icons" src="../img/wishlist.png"><br>Wishlist</a>
                </li>
                <li class="tabs-title active"><a href="/home/settings.jsp"><img class="tabs-icons"
                                                                           src="../img/tool-white.png"><br>Settings</a>
                </li>
            </ul>
        </div>
        <div class="col-sm-9 col-md-10">
            <div class="row">
                <ul class="nav nav-pills nav-justified tabs-border">
                    <li class="active"><a href="settings.html">Account</a></li>
                    <li><a href="/home/security.jsp">Security</a></li>
                    <li><a href="verifications.html">Verifications</a></li>
                    <li><a href="payment-method.html">Payment methods</a></li>
                </ul>
            </div>
            <h3 class="margin-bottom-20">Update your profile info </h3>
            <div class="row">
                <c:set var="user" value="${sessionScope.user}" />
                <form action="/UpdateUserServlet" method="post" enctype="multipart/form-data" >
                    <div class="col-xs-12 col-md-6">
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" class="form-control" id="name" name="fname" placeholder="${user.fName}">
                    </div>
                    <div class="form-group">
                        <label for="surname">Surname</label>
                        <input type="text" class="form-control" id="surname" name="lname" placeholder="${user.lName}">
                    </div>
                        <div class="form-group">
                            <label for="username">Username</label>
                            <input type="text" class="form-control" id="username" name="uname" placeholder="${user.uName}">
                        </div>
                    <div class="form-group">
                        <label for="email">Email address</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="${user.email}">
                    </div>
                        <div class="form-group">
                            <lavel for="gender">Self identified gender</lavel>
                            <select id="gender" class="form-control" name="sex">
                                <option value="Male" >Male</option>
                                <option value="Female">Female</option>
                                <option value="Other" >Other</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-md-6">
                    <div class="form-group">
                        <img style="height: 70px;width:70px" class="center img-round media-photo" src="/data/users/${user.photo}"><br>
                        <label for="uploadImage">Profile photo upload</label>
                        <input class="btn btn-default"  name="photo" type="file">
                        <p class="help-block">Example block-level help text here.</p>
                    </div>
                    <div class="form-group">
                        <label for="location">Location</label>
                        <input type="text" class="form-control" id="location" name="location" placeholder="${user.address}">
                    </div>
                        <div class="form-group">
                            <label for="birthday">Birthdate</label>
                            <input type="date" class="form-control" name="bdate" id="birthday" value="${user.bDate}">
                        </div>
                        <div class="form-group">
                            <label>Bio</label>
                            <textarea class="form-control" name="about" rows="3">${user.about}</textarea>
                        </div>
                    </div>
                    <div class="col-xs-12">
                    <button type="submit" class="btn btn-success">Update Profile</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/footer.html" />
<script src="../js/bootstrap.fd.js"></script>
<script>
    $('#notificationTabs').on('click', '.nav-tabs a', function () {
        $(this).closest('.dropdown').addClass('dontClose');
    })

    $('#messagesDown').on('hide.bs.dropdown', function (e) {
        if ($(this).hasClass('dontClose')) {
            e.preventDefault();
        }
        $(this).removeClass('dontClose');
    });

    $("#uploadImage").click(function() {
        $.FileDialog({accept: "image/jpeg,image/png"});
    });
// -*- FILE UPLOAD SOURCE -*- http://www.jqueryscript.net/form/Drag-Drop-File-Upload-Dialog-with-jQuery-Bootstrap.html
</script>
</body>
</html>