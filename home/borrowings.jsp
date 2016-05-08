<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                <c:set var="requests" value="${requestScope.requests}"/>
                <div class="col-xs-12 col-sm-9 col-md-10">
                    <div class="row">
                        <c:forEach var="request" items="${requests}" >
                            <div class="col-sm-6 col-md-4 margin-bottom-20">
                                <div class="borrowing-box">
                                    <div class="image-panel">
                                        <a href="/GetListing?id=${request.listing.listingId}">
                                            <div class="borrowing-list-image" style="background-image: url('/data/cars/${request.listing.car.photos[1]}');"></div>
                                        </a>
                                    </div>
                                    <div class="text-center">
                                        <h6>${request.listing.car.model.make.name} ${request.listing.car.model.name} ${request.listing.car.manufactureYear}</h6>
                                        <div class="invoice-date"><fmt:formatDate type="date" value="${request.sDate}" /> - <fmt:formatDate type="date" value="${request.eDate}" /></div>
                                        <a href="/home/req-action.jsp?rid=${request.rId}" class="btn btn-default margin-top-15" >View chat</a>
                                        <c:choose>
                                            <c:when test="${request.status == 1}">
                                                <a class="btn margin-top-15 btn-warning" href="leave-review.jsp?rid=${request.rId}">Leave review</a>
                                                <a href="../invoice.html" class="view-invoice">Transaction info</a><!--only completed request has invoice-->
                                                <div class="green-color"><i class="green-color fa fa-check-circle-o"></i> Request accepted</div>
                                            </c:when>
                                            <c:when test="${request.status == 2}">
                                                <div class="red-color"><i class="red-color fa fa-times-circle-o"></i> Request rejected</div>
                                            </c:when>
                                            <c:when test="${request.status == 0}">
                                                <div class="yellow-color"><i class="yellow-color fa fa-clock-o"></i> Request waiting</div>
                                            </c:when>
                                        </c:choose>
                                        <!--state of icon changes according to state of request, see other examples below too-->
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
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
    </body>
</html>