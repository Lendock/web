<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8"/>
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Lendock</title>
        <link rel="stylesheet" href="../css/bootstrap.css"/>
        <link rel="stylesheet" href="../css/app.css"/>
        <link rel="stylesheet" href="../css/font-awesome.min.css"/>
    </head>
    <body class="bg-filter push">
        <jsp:include page="/header.jsp" />
        <div class="container">
            <div class="row margin-top-65">
                <div class="col-xs-12 col-sm-3 col-md-2">
                    <ul class="nav nav-pills nav-stacked dashboard-tabs" id="example-vert-tabs">
                        <li class="tabs-title"><a href="/home/profile.jsp"><img class="tabs-icons" src="../img/profile.png"><br>Profile</a>
                        </li>
                        <li class="tabs-title active"><a href="/GetOutgoingRequests"><img class="tabs-icons"
                                                                                   src="../img/borrow-icon-white.png"><br>My
                                Borrowings</a></li>
                        <li class="tabs-title"><a href="/AllMyCars"><img class="tabs-icons"
                                                                         src="../img/vehicle.png"><br>Dock</a></li>
                        <li class="tabs-title"><a href="/GetWishlist"><img class="tabs-icons" src="../img/wishlist.png"><br>Wishlist</a>
                        </li>
                        <li class="tabs-title"><a href="/home/settings.jsp"><img class="tabs-icons"
                                                                                 src="../img/tool.png"><br>Settings</a>
                        </li>
                    </ul>
                </div>
                <div class="col-xs-12 col-sm-5 col-md-6">
                    <div class="chat-wrapper">
                        <div class="menu">
                            <div class="back">
                                <a href="/GetOutgoingRequests"><i style="color:#fff;" class="fa fa-arrow-left"></i><span> Back to My Borrowings</span></a>
                                <!--img src="../img/ramiz.jpg" draggable="false"/-->
                            </div>
                            <!--div class="name">Ramiz Ismayilov</div>
                            <div class="last">18:09</div-->
                        </div>
                        <div class="messages-wrapper">
                            <ol class="chat">
                            </ol>
                        </div>
                        <c:set var="request" value="${requestScope.request}" />
                        <div class="mes-field">
                            <div class="row no-margin no-gutter no-padding-left">
                                <form action="/NewMessage" method="post" name="send-message">
                                    <div class="col-xs-9 col-sm-9 col-md-10 no-padding-left">
                                        <input type="hidden" value="${param.rid}" name="rid" id="rid" >
                                        <input name="message" class="textarea" type="text" placeholder="Type here!"/>
                                    </div>
                                    <div class="col-xs-3 col-sm-3 col-md-2 no-padding-left">
                                        <button class="send-message">Send</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xs-12 col-sm-4 col-md-4">
                    <div class="row margin-top-15">
                        <div class="col-xs-3 col-md-3 col-lg-2 ">
                            <div class="request-borrower-avatar">
                                <img src="/data/users/${request.requester.photo}" id="borrower-photo" class="circular-borrowers">
                            </div>
                        </div>
                        <div class="col-xs-9 col-md-9 col-lg-10">
                            <div class="request-borrower-title">
                                <a href="#" id="borrower-name">You</a>
                                <span>&nbsp;requested</span>
                                <span id="car-name">&nbsp; </span>
                                <div class="request-borrower-rating">
                                    <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12">
                            <img style="width: inherit"  class="sent-request-image" src="/data/cars/${request.listing.car.photos[1]}">
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table-approve">
                            <tbody>
                                <tr class="back-white">
                                    <td>Start Date</td>
                                    <td>End Date</td>
                                </tr>
                                <tr>
                                    <td id="start-date">${request.sDate}</td>
                                    <td id="end-date">${request.eDate}</td>
                                </tr>
                                <tr class="back-white">
                                    <td>Price per day</td>
                                    <td>Total</td>
                                </tr>
                                <tr>
                                    <td id="price"><span class="azn">M</span>${request.listing.price}</td>
                                    <td id="total"><span class="azn">M</span>${request.total}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <!--div class="c3">
                        <div class="request-message-for-lender">
                            Comunicate with <span>Jason</span> and decide to lend car or not
                        </div>
                        <div class="row">
                            <div class="col-xs-6">
                                <div class="request-accept-btn">
                                    <button class="btn btn-default">Accept<img src="../img/accept.png"> </button>
                                </div>
                            </div>
                            <div class="col-xs-6">
                                <div class="request-reject-btn">
                                    <button class="btn btn-default">Reject <img src="../img/reject.png"></button>
                                </div>
                            </div>
                        </div>
                        <div class="row margin-top-15">
                            <div class="col-xs-9">
                                <a href="#" class="cancelation-policy">Cancelation policy</a>
                            </div>
                            <div class="col-xs-3">
                                <img src="../img/questions1.png" class="request-cancelation-questionmark">
                            </div>
                        </div>
                    </div-->
                </div>
            </div>
        </div>
        <jsp:include page="/footer.html" />

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
        <script src="../js/scotchPanels.js"></script>
        <!--script>
            $(document).ready(function() {
                $('.menu-link').bigSlide();
            });
        </script-->
        <script>
            $(function () {
                var uId = '${sessionScope.user.id}';
                $.getJSON("/GetMessages?mode=all&rid=" + '${param.rid}', function (data) {
                    $.each(data, function (key, val) {
                        if (uId == val.senderId) {
                            $(".chat").append("<li class='self' id='" + key.mId + "'><div class='avatar'><img src='/data/users/" + val.senderPhoto + "' draggable='false'/></div><div class='msg'><p>" + val.messageText + "<p><time>" + val.sentDate + "</time></div></li>");
                        } else {
                            $(".chat").append("<li class='other' id='" + key.mId + "'><div class='avatar'><img src='/data/users/" + val.senderPhoto + "' draggable='false'/></div><div class='msg'><p>" + val.messageText + "<p><time>" + val.sentDate + "</time></div></li>");
                        }
                        $(".message-wrapper").scrollTop($("#chat").height());
                    });
                });
                $.getJSON("/GetRequest?rid=" + "${param.rid}", function (data) {
                    $("#borrower-photo").attr("src", "/data/users/" + data.requester.photo);
                    $("#car-name").html(data.listing.car.Model.make.name + " " + data.listing.car.Model.name);
                    $("#start-date").html(data.sDate);
                    $("#end-date").html(data.eDate);
                    $("#price").html("$" + data.listing.price);
                    $("#total").html("$" + data.total);
                    $(".sent-request-image").attr("src", "/data/cars/" + data.listing.car.Photos[0]);
                });
                $('form[name=send-message]').submit(function () {
                    $.post($(this).attr('action'), $(this).serialize(), function (res) {
                        $(".textarea").val("");
                        $.getJSON("/GetMessages?mode=all&rid=${param.rid}", function (data) {
                            $(".chat").html("");
                            $.each(data, function (key, val) {
                                if (uId == val.senderId) {
                                    $(".chat").append("<li class='self' id='" + key.mId + "'><div class='avatar'><img src='/data/users/" + val.senderPhoto + "' draggable='false'/></div><div class='msg'><p>" + val.messageText + "<p><time>" + val.sentDate + "</time></div></li>");
                                } else {
                                    $(".chat").append("<li class='other' id='" + key.mId + "'><div class='avatar'><img src='/data/users/" + val.senderPhoto + "' draggable='false'/></div><div class='msg'><p>" + val.messageText + "<p><time>" + val.sentDate + "</time></div></li>");
                                }
                            });
                            $(".messages-wrapper").scrollTop($(".chat").height());
                        });
                        //console.log(res);
                    });
                    return false;
                });
                setInterval(function () {
                    $.getJSON("/GetMessages?mode=all&rid=${param.rid}", function (data) {
                            $(".chat").html("");
                            $.each(data, function (key, val) {
                                if (uId == val.senderId) {
                                    $(".chat").append("<li class='self' id='" + key.mId + "'><div class='avatar'><img src='/data/users/" + val.senderPhoto + "' draggable='false'/></div><div class='msg'><p>" + val.messageText + "<p><time>" + val.sentDate + "</time></div></li>");
                                } else {
                                    $(".chat").append("<li class='other' id='" + key.mId + "'><div class='avatar'><img src='/data/users/" + val.senderPhoto + "' draggable='false'/></div><div class='msg'><p>" + val.messageText + "<p><time>" + val.sentDate + "</time></div></li>");
                                }
                            });
                            //$(".messages-wrapper").scrollTop($(".chat").height());
                        });
                }, 1000);
            });
        </script>
        <script>
            $(function () {home/profile.jsp
                var scotchPanel = $('#scotch-panel').scotchPanel({
                    containerSelector: 'body',
                    direction: 'right',
                    duration: 300,
                    transition: 'ease',
                    clickSelector: '.toggle-panel',
                    distanceX: '70%',
                    enableEscapeKey: true
                });
                $(window).resize(function () {
                    if ($(window).width() >= 769 && $('.scotch-panel-canvas').hasClass('scotch-is-showing')) {
                        scotchPanel.close();
                    }
                });
            });
        </script>
    </body>
</html>