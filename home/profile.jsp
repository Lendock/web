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
    </head>
    <body class="bg-filter">
        <jsp:include page="/header.jsp" />
        <div class="container">
            <div class="row margin-top-65">
                <div class="col-sm-3 col-md-2">
                    <ul class="nav nav-pills nav-stacked dashboard-tabs" id="example-vert-tabs">
                        <li class="tabs-title active"><a href="/home/profile.jsp"><img class="tabs-icons" src="../img/profile-white.png"><br>Profil</a>
                        </li>
                        <li class="tabs-title"><a href="/GetOutgoingRequests"><img class="tabs-icons"
                                                                                   src="../img/borrow-icon.png"><br>Sifarişlərim</a></li>
                        <li class="tabs-title"><a href="/AllMyCars"><img class="tabs-icons"
                                                                         src="../img/vehicle.png"><br>Dock</a></li>
                        <li class="tabs-title"><a href="/GetWishlist"><img class="tabs-icons" src="../img/wishlist.png"><br>Wishlist</a>
                        </li>
                        <li class="tabs-title"><a href="/home/settings.jsp"><img class="tabs-icons"
                                                                                 src="../img/tool.png"><br>Tənzimləmələr</a>
                        </li>
                    </ul>
                </div>
                <c:set var="user" value="${sessionScope.user}"/>
                <div class="col-sm-9 col-md-10">
                    <div class="row margin-top-45">
                        <div class="col-sm-12 center">
                            <img src="/data/users/${user.photo}" class="round-photo dashboard-circular-photo">
                        </div>
                        <div class="col-sm-12 center">
                            <span class="dashboard-profile-name">${user.fName} ${user.lName}</span>
                            <span class="dashboard-username">@${user.uName}  <!--Put location here--><br>Baku, Azerbaijan</span>
                        </div>
                        <div class="col-sm-11 col-sm-offset-1">
                            <h3>Reviews</h3>
                            <div class="listing-review">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function loop(num) {
                var res = "<div class='request-borrower-rating'>";
                for (i = 1; i <= num; i++) {
                    res += "<i class='fa fa-star'></i>";
                }
                res += "</div>";
                return res;
            }
        </script>
        <script>
            $(function () {
                $.getJSON("/GetReviews", function (data) {
                    $.each(data, function (key, val) {
                        $(".listing-review").append("<div class='row'><div class='col-sm-2 col-md-1'><a href='/profile-public.jsp?uid=" + val.reviewer.id + "'><img class='media-photo round-photo center-block' style='height: 50px; width:50px;' src='/data/users/" + val.reviewer.photo + "'></a></div><div class='col-sm-10 col-md-11'><div class='lender-name'><a href='/profile-public.jsp?uid=" + val.reviewer.id + "'>" + val.reviewer.fName + " " + val.reviewer.lName + "</a></div>" + loop(val.rating) + "<div class='review-text'>" + val.description + "</div></div></div>");
                    });
                });
                $("#header").load("/GetAlerts");
                setInterval(function () {
                    $("#header").load("/GetAlerts");
                }, 3000);

            });
        </script>
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
        </script>
        <jsp:include page="/footer.jsp" />
    </body>
</html>