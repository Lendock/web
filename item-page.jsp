<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8"/>
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Lendock</title>
        <link rel="stylesheet" href="css/owl.carousel.css"/>
        <link rel="stylesheet" href="css/owl.theme.css"/>
    </head>
    <body class="bg-filter">
        <c:choose>
            <c:when test="${!empty sessionScope.user}">
                <jsp:include page="/header.jsp" />
            </c:when>
            <c:otherwise>
                <jsp:include page="/header-no-login.html" />
            </c:otherwise>
        </c:choose>
        <div class="container">
            <c:set var="listing" value="${requestScope.listing}" />
            <c:set var="car" value="${listing.car}" />
                <div class="row margin-top-65">
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-9">
                        <div class="listing-title">
                            ${car.model.make.name} ${car.model.name} ${car.manufactureYear}
                        </div>
                        <div class="listing-gallery-box">
                            <div class="listing-specs">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <img src="img/silhouette42.png">
                                        <span class="listing-spec-details">${car.seatsNumber} seats</span>
                                    </div>
                                    <div class="col-xs-3">
                                        <img src="img/stacked9.png">
                                        <span class="listing-spec-details">${car.carType.name}</span>
                                    </div>
                                    <div class="col-xs-3">
                                        <img src="img/fuel19.png">
                                        <span class="listing-spec-details">${car.fuelType.name}</span>
                                    </div>
                                    <div class="col-xs-3">
                                        <img src="img/driving2.png">
                                        <span class="listing-spec-details">${car.transmission.name}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-sm-10 col-md-9">
                                <div class="row">
                                    <div class="col-sm-12" id="carousel-bounding-box">
                                        <div class="active listing-image item" id="active-image" style="background-image: url(/data/cars/${car.photos[0]});"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-2 col-md-3" id="slider-thumbs">
                                <ul class="hide-bullets horizontal-list-view">
                                    <c:forEach items="${car.photos}" var="photo">
                                        <li>
                                            <button class="thumbnail"><img src="/data/cars/${photo}"></button>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                        <div class="listing-desc">
                            <h4>Description</h4>
                            <div class="description">
                                ${listing.description}
                            </div>
                        </div>

                        <hr>

                        <div class="listing-review">
                            <div class="row margin-bottom-20">
                                <div class="col-xs-3 col-sm-4 col-md-3 col-lg-2">
                                    <a href="#"><img class="circular-borrowers" style="height:75px; width: 75px;" src="/data/users/${listing.car.owner.photo}"></a>
                                </div>
                                <div class="col-xs-6 col-sm-6 col-md-7 col-lg-8">
                                    <div class="lender-name">
                                        <a href="/profile-public.jsp?uid=${car.owner.id}">${car.owner.fName} ${car.owner.lName}</a>
                                    </div>
                                    <div class="request-borrower-rating">
                                        <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                            class="fa fa-star"></i>
                                    </div>
                                </div>
                                <div class="col-xs-3 col-sm-2 col-md-2 col-lg-2">
                                    <div class="listing-review-amount">
                                        0 reviews
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3" style="margin-top:36px;">
                        <div class="calendar-calculator">
                            <div class="calendar1">
                                <div id="calendar" class="non-calendar"></div>
                            </div>
                            <c:if test="${sessionScope.user != null && sessionScope.user.id != car.owner.id}">
                                <form action="/ReviewRequest" method="post">
                                    <input type="hidden" name="lid" value="${listing.listingId}">

                                    <div class="listing-price">
                                        <span class="price azn">M${listing.price}</span>
                                        <span class="per-day">Per Day</span>
                                    </div>
                                    <table class="dates">
                                        <tr>
                                            <th class="no-padding">Start Date:
                                                <input type="text" class="form-control span2 no-bottom-margin" value="" name="start-date" id="from">
                                            </th>
                                            <th class="no-padding">End Date:
                                                <input type="text" class="form-control span2 no-bottom-margin" name="end-date" value="" id="to">
                                            </th>
                                        </tr>
                                    </table>
                                    <div class="calculator margin-bottom-20">
                                        <div class="table-responsive">
                                            <table class="table-approve">
                                                <tbody>
                                                    <tr class="back-white">
                                                        <td>Price per day</td>
                                                        <td>Total</td>
                                                    </tr>
                                                    <tr>
                                                        <td>$${listing.price}</td>
                                                        <td id="total-price">-</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="listing-buttons">
                                        <button type="submit" name="submit" class="btn listing-request-button" value="Request">Request</button>
                                        <button class="btn listing-wishlist-button" value="Wishlist">Wishlist</button>
                                    </div>
                                </form>
                            </c:if>
                            <span class="light-text">
                                On next page you will be asked to confirm your request
                            </span>
                            <div class="item-info-box">
                                <div class="damage-fee">
                                    Damage fee: $100
                                </div>
                                <div class="learn-more">
                                    <span class="light-text">Learn more</span>
                                </div>
                            </div>
                            <table class="social-icons-list">
                                <tr>
                                    <td class="social-icons-box">
                                        <a href="#">
                                            <span class="icon-text">Email</span>
                                            <span class="icon"><i class="fa fa-mail-forward"></i></span>
                                        </a>
                                    </td>
                                    <td class="social-icons-box">
                                        <a href="#">
                                            <span class="icon-text">Facebook</span>
                                            <span class="icon"><img src="img/facebook53.png"> </span>
                                        </a>
                                    </td>
                                    <td class="social-icons-box">
                                        <a href="#">
                                            <span class="icon-text">Twitter</span>
                                            <span class="icon"><img src="img/twitter38.png"> </span>
                                        </a>
                                    </td>
                                    <td class="social-icons-box">
                                        <a href="#">
                                            <span class="icon-text">More</span>
                                            <span class="icon"><img src="img/more9.png"> </span>
                                        </a>
                                    </td>
                                </tr>
                            </table>

                        </div>

                    </div>
                </div>
            <jsp:include page="/related-cars.jsp" />
        </div>
    </div>
    <jsp:include page="/footer.html" />
    <script src="js/owl.carousel.min.js"></script>
    <script>
        jQuery(document).ready(function ($) {
            $('#myCarousel').carousel({
                interval: 5000
            });

            //Handles the carousel thumbnails
            $('[id^=carousel-selector-]').click(function () {
                var id_selector = $(this).attr("id");
                try {
                    var id = /-(\d+)$/.exec(id_selector)[1];
                    console.log(id_selector, id);
                    jQuery('#myCarousel').carousel(parseInt(id));
                } catch (e) {
                    console.log('Regex failed!', e);
                }
            });
            // When the carousel slides, auto update the text
            $('#myCarousel').on('slid.bs.carousel', function (e) {
                var id = $('.item.active').data('slide-number');
                $('#carousel-text').html($('#slide-content-' + id).html());
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
        $(document).ready(function () {
            $.getJSON("/UnavailableDates?lid=" + "${param.id}", function (data) {
                $.each(data, function (key, val) {
                    disableddates.push(jQuery.datepicker.formatDate('dd-mm-yy', new Date(val)));
                });
                $("#calendar").datepicker({
                    minDate: new Date(),
                    beforeShowDay: DisableSpecificDates
                });
                $.getJSON("/GetReviews?lid=${param.id}", function (data) {
                    $.each(data, function (key, val) {
                        $(".listing-review").append("<div class='row'><div class='col-xs-3 col-sm-2 col-md-2'><a href='/profile-public.jsp?uid=" + val.reviewer.id + "'><img class='media-photo round-photo center-block' style='height: 50px; width:50px;' src='/data/users/" + val.reviewer.photo + "'></a></div> <div class='col-xs-9 col-sm-10 col-md-10 border-bottom'><div class='lender-name'><a href='/profile-public.jsp?uid=" + val.reviewer.id + "'>" + val.reviewer.fName + " " + val.reviewer.lName + "</a></div>" + loop(val.rating) + "<div class='review-text'>" + val.description + "</div></div></div>");
                    });
                    $(".listing-review-amount").html(data.length + " Reviews");
                });
                $("#from").datepicker({
                    dateFormat: "dd.mm.yy",
                    minDate: new Date(),
                    showAnim: "clip",
                    hideIfNoPrevNext: true,
                    duration: "fast",
                    defaultDate: 0,
                    beforeShowDay: DisableSpecificDates,
                    onSelect: calculateDays,
                    onClose: function (selectedDate) {
                        $("#to").datepicker("option", "minDate", selectedDate);
                    }
                });
                $("#to").datepicker({
                    dateFormat: "dd.mm.yy",
                    showAnim: "clip",
                    hideIfNoPrevNext: true,
                    duration: "fast",
                    defaultDate: 0,
                    minDate: new Date(),
                    beforeShowDay: DisableSpecificDates,
                    onSelect: calculateDays,
                    onClose: function (selectedDate) {
                        $("#from").datepicker("option", "maxDate", selectedDate);
                    }
                });
            });
            $("#owl-demo").owlCarousel({
                navigation: true, // Show next and prev buttons
                slideSpeed: 300,
                paginationSpeed: 400,
                singleItem: true,
                lazyLoad: true
                        // "singleItem:true" is a shortcut for:
                        // items : 1,
                        // itemsDesktop : false,
                        // itemsDesktopSmall : false,
                        // itemsTablet: false,
                        // itemsMobile : false
            });
        });
        $(".thumbnail").click(function () {
            $("#active-image").attr("style", "background-image : url(" + $(this).find("img").attr("src") + ");");
        });
        $("button[name='submit']").click(function () {
            if ($("#from").val() == "" && $("#to").val() == "") {
                return false;
            } else {
                return true;
            }

        });
    </script>   
    <script>
        var disableddates = new Array();
        function DisableSpecificDates(date) {
            var string = jQuery.datepicker.formatDate('dd-mm-yy', date);
            return [disableddates.indexOf(string) == -1];
        }
        currencySign = "$";
        listing_price = ${listing.price}
        function calculateDays() {
            if ($("#to").datepicker("getDate") === null || $("#from").datepicker("getDate") === null) {
            } else {
                var startDate = $("#from").datepicker("getDate");
                var endDate = $("#to").datepicker("getDate");
                var oneDay = 24 * 60 * 60 * 1000; // hours*minutes*seconds*milliseconds
                var diffDays = Math.round(Math.abs((startDate.getTime() - endDate.getTime()) / (oneDay)));
                $("#days").html(diffDays);
                $("#total-price").html(diffDays * listing_price + currencySign);
            }
        }
    </script>
</body>
</html>