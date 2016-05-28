<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <jsp:include page="/header.jsp" />
    <body class="bg-filter push">
        <div class="container-fluid">
            <div class="inbox-cont">
                <div class="row">
                    <div class="margin-top-65"></div>
                    <div class="col-xs-12 col-sm-3 col-md-2">
                        <div class="inbox-request">
                            <c:set var="requests" value="${requestScope.requests}" />
                            <c:forEach var="request" items="${requests}">
                                <c:choose>
                                    <c:when test="${request.status != 0}" >
                                        <li class="notification-message">
                                        </c:when>
                                        <c:otherwise>
                                        <li class="notification-message newMessage">
                                        </c:otherwise>
                                    </c:choose>
                                    <a href="#" class="request" id="${request.rId}">
                                        <div class="row">
                                            <div class="col-xs-3"><img src="/data/users/${request.requester.photo}" style="height: 35px; width:35px;" class="round-photo"></div>
                                            <div class="col-xs-9"><span class="notification-sender-name">${request.requester.fName} sent you a request</span></div>
                                        </div>
                                    </a>
                                </li>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-5 col-md-6" id="message-area">
                        <div class="chat-wrapper">
                            <!--div class="menu">
                                <div class="back">
                                    <a href="borrowings.html"><i style="color:#fff;" class="fa fa-arrow-left"></i><span> Back to My Borrowings</span></a>
                                </div>
                            </div-->
                            <div class="messages-wrapper">
                                <ol class="chat">
                                </ol>
                            </div>
                            <div class="mes-field">
                                <div class="row no-margin no-gutter">
                                    <form action="/NewMessage" method="post" name="send-message">
                                        <div class="col-xs-9 col-md-10">
                                            <input type="hidden" value="${param.rid}" name="rid" id="rid" >
                                            <input name="message" class="textarea" autocomplete="off" type="text" placeholder="Type here!"/>
                                        </div>
                                        <div class="col-xs-3 col-md-2">
                                            <button class="send-message">Send</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-4" id="request-detail">
                        <div class="row margin-top-15">
                            <div class="col-xs-3 col-md-2">
                                <div class="request-borrower-avatar">
                                    <img src="" id="borrower-photo" class="circular-borrowers">
                                </div>
                            </div>
                            <div class="col-xs-9 col-md-10">
                                <div class="request-borrower-title">
                                    <a href="#" id="borrower-name">-</a>
                                    <span>&nbsp;requested</span>
                                    <span id="car-name">&nbsp;- </span>
                                    <div class="request-borrower-rating">
                                        <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
                                    </div>
                                </div>
                            </div>
                            <a href="#" id="go-to-listing">
                            <div class="col-xs-12">
                                <img style="width: inherit"  class="sent-request-image" src="">
                            </div>
                            </a>
                        </div>
                        <div class="table-responsive">
                            <table class="table-approve">
                                <tbody>
                                    <tr class="back-white">
                                        <td>Start Date</td>
                                        <td>End Date</td>
                                    </tr>
                                    <tr>
                                        <td id="start-date">-</td>
                                        <td id="end-date">-</td>
                                    </tr>
                                    <tr class="back-white">
                                        <td>Price per day</td>
                                        <td>Total</td>
                                    </tr>
                                    <tr>
                                        <td id="price"><span class="azn">M</span>-</td>
                                        <td id="total"><span class="azn">M</span>-</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="c3">
                            <div class="request-message-for-lender">
                                Comunicate with <span id="borrower">Jason</span> and decide to lend car or not
                            </div>
                            <div class="row">
                                <div class="col-xs-6">
                                    <div class="request-accept-btn">
                                        <button id="" class="btn btn-default">Accept<img src="img/accept.png"> </button>
                                    </div>
                                </div>
                                <div class="col-xs-6">
                                    <div class="request-reject-btn">
                                        <button id="" class="btn btn-default">Reject<img src="img/reject.png"></button>
                                    </div>
                                </div>
                            </div>
                            <div class="row margin-top-15">
                                <!--div class="col-xs-9">
                                    <a href="#" class="cancelation-policy"></a>
                                </div>
                                <div class="col-xs-3">
                                    <img src="img/questions1.png" class="request-cancelation-questionmark">
                                </div-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <!--jsp:include page="/footer.jsp" /-->
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
    <!--script>
        $(document).ready(function() {
            $('.menu-link').bigSlide();
        });
    </script-->
    <script>
        $(function () {
            $("#request-detail").hide();
            $("#message-area").hide();
            var uId = '${sessionScope.user.id}';
            <c:if test="${not empty requestScope.request}">
            $.getJSON("/GetRequest?rid=" + ${requestScope.request}, function (data) {
                $(".chat").html("");
                $("#borrower-photo").attr("src", "/data/users/" + data.requester.photo);
                $("#borrower-name").html(data.requester.fName + " " + data.requester.lName);
                $("#borrower-name").attr('href', 'profile-public.jsp?uid=' + data.requester.id);
                $("#borrower").html(data.requester.fName);
                $("#car-name").html(data.listing.car.Model.make.name + " " + data.listing.car.Model.name);
                $("#start-date").html(data.sDate);
                $("#end-date").html(data.eDate);
                $("#price").html("<span class='azn'>M</span>" + data.listing.price);
                $("#total").html("<span class='azn'>M</span>" + data.total);
                $("#go-to-listing").attr('href', '/GetListing?id' + data.listing.id);
                $(".sent-request-image").attr("src", "/data/cars/" + data.listing.car.Photos[1]);
                if (data.status === 0) {
                    $(".request-accept-btn").find("button").attr("id", data.rId).html("Accept").prop("disabled", false).show();
                    $(".request-reject-btn").find("button").attr("id", data.rId).html("Reject").prop("disabled", false).show();
                } else if (data.status === 1) {
                    $(".request-accept-btn").find("button").html("Accepted!").prop("disabled", true).show();
                    $(".request-reject-btn").find("button").hide();
                } else if (data.status === 2) {
                    $(".request-reject-btn").find("button").html("Rejected!").prop("disabled", true).show();
                    $(".request-accept-btn").find("button").hide();
                }

            });
            $("#rid").val(${param.request});
            $.getJSON("/GetMessages?mode=all&rid=" + ${requestScope.request}, function (data) {
                $.each(data, function (key, val) {
                    if (uId == val.senderId) {
                        $(".chat").append("<li class='self' id='" + key.mId + "'><div class='avatar'><img src='/data/users/" + val.senderPhoto + "' draggable='false'/></div><div class='msg'><p>" + val.messageText + "<p><time>" + val.sentDate + "</time></div></li>");
                    } else {
                        $(".chat").append("<li class='other' id='" + key.mId + "'><div class='avatar'><img src='/data/users/" + val.senderPhoto + "' draggable='false'/></div><div class='msg'><p>" + val.messageText + "<p><time>" + val.sentDate + "</time></div></li>");
                    }

                });
                $(".messages-wrapper").scrollTop($(".chat").height());

            });
            $("#request-detail").show();
            $("#message-area").show();

            setInterval(function () {
                $.getJSON("/GetMessages?mode=all&rid=" + ${requestScope.request}, function (data) {
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
        </c:if>
            $(".request").click(function () {
                $.getJSON("/GetRequest?rid=" + $(this).attr("id"), function (data) {
                    $(".chat").html("");
                    $("#borrower-photo").attr("src", "/data/users/" + data.requester.photo);
                    $("#borrower-name").html(data.requester.fName + " " + data.requester.lName);
                    $("#borrower-name").attr('href', '/profile-public.jsp?uid=' + data.requester.id);
                    $("#go-to-listing").attr('href', '/GetListing?id=' + data.listing.id);
                    $("#borrower").html(data.requester.fName);
                    $("#car-name").html(data.listing.car.Model.make.name + " " + data.listing.car.Model.name);
                    $("#start-date").html(data.sDate);
                    $("#end-date").html(data.eDate);
                    $("#price").html("<span class='azn'>M</span>" + data.listing.price);
                    $("#total").html("<span class='azn'>M</span>" + data.total);
                    $(".sent-request-image").attr("src", "/data/cars/" + data.listing.car.Photos[1]);
                    if (data.status === 0) {
                        $(".request-accept-btn").find("button").attr("id", data.rId).html("Accept").prop("disabled", false).show();
                        $(".request-reject-btn").find("button").attr("id", data.rId).html("Reject").prop("disabled", false).show();
                    } else if (data.status === 1) {
                        $(".request-accept-btn").find("button").html("Accepted!").prop("disabled", true).show();
                        $(".request-reject-btn").find("button").hide();
                    } else if (data.status === 2) {
                        $(".request-reject-btn").find("button").html("Rejected!").prop("disabled", true).show();
                        $(".request-accept-btn").find("button").hide();
                    }

                });
                $("#rid").val($(this).attr("id"));
                $.getJSON("/GetMessages?mode=all&rid=" + $(this).attr("id"), function (data) {
                    $.each(data, function (key, val) {
                        if (uId == val.senderId) {
                            $(".chat").append("<li class='self' id='" + key.mId + "'><div class='avatar'><img src='/data/users/" + val.senderPhoto + "' draggable='false'/></div><div class='msg'><p>" + val.messageText + "<p><time>" + val.sentDate + "</time></div></li>");
                        } else {
                            $(".chat").append("<li class='other' id='" + key.mId + "'><div class='avatar'><img src='/data/users/" + val.senderPhoto + "' draggable='false'/></div><div class='msg'><p>" + val.messageText + "<p><time>" + val.sentDate + "</time></div></li>");
                        }

                    });
                    $(".messages-wrapper").scrollTop($(".chat").height());

                });
                $("#request-detail").show();
                $("#message-area").show();

                setInterval(function () {
                    $.getJSON("/GetMessages?mode=all&rid=" + $("#rid").val(), function (data) {
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
            $('form[name=send-message]').submit(function () {
                $.post($(this).attr('action'), $(this).serialize(), function (res) {
                    $(".textarea").val("");
                    $.getJSON("/GetMessages?mode=all&rid=" + $("#rid").val(), function (data) {
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


        });
    </script>
    <script>
        $(".request-accept-btn").find("button").click(function () {
            $.ajax({
                url: "/RequestStatus?mod=1&rid=" + $(this).attr("id"),
            }).done(function () {
                $(".request-accept-btn").find("button").html("Accepted!").prop("disabled", true).show();
                $(".request-reject-btn").find("button").hide();
            });
        });
        $(".request-reject-btn").find("button").click(function () {
            $.ajax({
                url: "/RequestStatus?mod=2&rid=" + $(this).attr("id"),
            }).done(function () {
                $(".request-reject-btn").find("button").html("Rejected!").prop("disabled", true).show();
                $(".request-accept-btn").find("button").hide();
            });
        });
    </script>
    <script>
        $(function () {
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
</html>