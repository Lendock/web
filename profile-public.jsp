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
    <body class="bg-filter">
         <c:choose>
            <c:when test="${!empty sessionScope.user}">
                <jsp:include page="/header.jsp" />
            </c:when>
            <c:otherwise>
                <jsp:include page="/header-no-login.jsp" />
            </c:otherwise>
        </c:choose>
        <div class="container">
            <div class="row margin-top-65">
                <div class="col-sm-12 col-md-12">
                    <div class="row margin-top-45">
                        <div class="col-sm-12 center">
                            <img src="" class="round-photo dashboard-circular-photo">
                        </div>
                        <div class="col-sm-12 center">
                            <span class="dashboard-profile-name">-</span>
                            <span class="dashboard-username">-  <!--Put location here--><br>-</span>
                        </div>
                        <div class="col-xs-12 margin-bottom-20">
                            <h3>About me</h3>
                            <p id="about">
                                </p>
                        </div>
                        <div class="col-xs-12 col-sm-8 col-md-6">
                            <span class="dashboard-heading">Reviews </span><span class="review-amount">-</span><hr class="thin-line">
                            <div class="listing-review">
                       
                            </div>
                        </div>
                        <div id="listings" class="col-xs-12 col-sm-4 col-md-6">
                            <span class="dashboard-heading">Listings </span><span class="message-amount">-</span><hr class="thin-line">
                        </div>
                    </div>
                </div>
            </div>
        </div>
<jsp:include page="/footer.jsp" />
        <script>
             $(function () {
                $.getJSON("/GetUser?uid=${param.uid}", function (data) {
                    
                    $(".dashboard-circular-photo").attr("src", "/data/users/" + data.photo);
                    $(".dashboard-profile-name").html(data.fName + " " + data.lName);
                    $(".dashboard-username").html("@" + data.uName + " <br>" + data.address);
                    $("#about").html(data.about);
                });
            });
        </script>
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
                $.getJSON("/GetReviews?uid=${param.uid}", function (data) {
                    $.each(data, function (key, val) {
                        $(".listing-review").append("<div class='row'><div class='col-sm-2 col-md-1'><a href='/profile-public.jsp?uid=" + val.reviewer.id + "'><img class='media-photo round-photo center-block' style='height: 50px; width:50px;' src='/data/users/" + val.reviewer.photo + "'></a></div> <div class='col-sm-10 col-md-11 border-bottom'><div class='lender-name'><a href='/profile-public.jsp?uid=" + val.reviewer.id + "'>" + val.reviewer.fName + " " + val.reviewer.lName + "</a></div>"+ loop(val.rating) +"<div class='review-text'>" + val.description + "</div></div></div>");
                    });
                    $(".review-amount").html(data.length);
                });
                $.getJSON("/GetListings?uid=${param.uid}", function (data) {
                    $.each(data, function (key, val) {
                        $("#listings").append("<div class='col-xs-6'> <div class='item-box'> <a href='GetListing?id=" + val.id + "'> <div class='image-box' style='background-image: url(/data/cars/" + val.car.Photos[0] + ")'> <div class='item-price'> " + val.price + "<span class='azn'>M</span>/per day </div></div></a> <div class='title-box'> <span class='item-title'> " + val.car.Model.make.name + " " + val.car.Model.name + " " + val.car.manufactureYear.year +" </span> <span class='wishlist-button'> <button type='button' class='no-border'> <img src='img/favorite21.png'> </button> </span> </div><div class='item-specs'> <div class='specs-icon'> <img src='img/silhouette42.png'> <span class='specs-detail'>" + val.car.seatsNumber  + " seats</span> </div><div class='specs-icon'> <img src='img/stacked9.png'> <span class='specs-detail'>" + val.car.carType.name + "</span> </div><div class='specs-icon'> <img src='img/fuel19.png'> <span class='specs-detail'>" + val.car.fuelType.name + "</span> </div><div class='specs-icon'> <img src='img/driving2.png'> <span class='specs-detail'>" + val.car.transmission.name +  "</span> </div></div></div></div>");
                    });
                    $(".message-amount").html(data.length);
                });
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
    </body>
</html>