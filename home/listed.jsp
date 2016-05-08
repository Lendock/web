<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8"/>
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Lendock</title>
        <link rel="icon" type="image/png" href="../img/lendock-favicon.png" />
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
                        <li class="tabs-title active"><a href="/AllMyCars"><img class="tabs-icons"
                                                                         src="../img/vehicle-white.png"><br>Dock</a></li>
                        <li class="tabs-title"><a href="/GetWishlist"><img class="tabs-icons" src="../img/wishlist.png"><br>Wishlist</a>
                        </li>
                        <li class="tabs-title"><a href="/home/settings.jsp"><img class="tabs-icons"
                                                                                 src="../img/tool.png"><br>Settings</a>
                        </li>
                    </ul>
                </div>
                <div class="col-sm-9 col-md-10">
                    <div class="row">
                        <ul class="nav nav-pills nav-justified tabs-border">
                            <li><a href="/AllMyCars">Garage</a></li>
                            <li class="active"><a href="listed.html">Listings</a></li>
                        </ul>
                    </div>
                    <div class="row">
                        <c:set var="listings" value="${requestScope.listings}" />
                        <c:forEach var="listing" items="${listings}">
                            <div class="col-sm-6 col-md-4 col-lg-3">
                                <div class="borrowing-box margin-top-15">
                                    <div class="image-panel">
                                        <a href="/GetListing?id=${listing.listingId}">
                                            <div class="item-price">$${listing.price}/per day</div>
                                            <div class="borrowing-list-image" style="background-image: url('/data/cars/${listing.car.photos[0]}');"></div>
                                        </a>
                                    </div>
                                    <div class="text-center">
                                        <h4>${listing.car.model.make.name} ${listing.car.model.name} ${listing.car.manufactureYear}</h4>
                                        <c:choose>
                                            <c:when test="${listing.active == true}">
                                                <span class="text-muted">Current status:<span class="green-color"> Active</span></span><br>
                                                <a href="/ChangeListingStatus?mod=0&lid=${listing.listingId}" class="btn btn-default buttons-margin">Deactivate</a>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="text-muted">Current status:<span class="red-color"> Inactive</span></span><br>
                                                <a href="/ChangeListingStatus?mod=1&lid=${listing.listingId}" class="btn btn-default buttons-margin">Activate</a>
                                            </c:otherwise>
                                        </c:choose>                                 
                                        <a href="/GetListing?id=${listing.listingId}&m=er" class="btn button-green">Manage listing</a>
                                        <button id="delete" name="${listing.listingId}" class="btn button-red" data-toggle="modal" data-target="#deleteCar">Delete listing</button>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <div class="col-sm-6 col-md-4 col-lg-3">
                            <a href="/home/add-listing.jsp">
                                <div class=" btn btn-default borrowing-box margin-top-15">
                                    <img class="add-sign" src="../img/add-sign.png">
                                    <h4>Add Listing</h4>
                                </div>
                            </a>
                        </div>
                    </div>
                    <!--div class="tabs-content vertical" data-tabs-content="example-vert-tabs">
                        <div class="tabs-panel is-active">
                            <div class="text-center">
                                <div class="row">
                                    <div class="medium-3 columns">
                                        Item
                                    </div>
                                    <div class="medium-3 columns">
                                        Lender
                                    </div>
                                    <div class="medium-3 columns">
                                        Dates
                                    </div>
                                    <div class="medium-3 columns">
                                        Details
                                    </div>
                                </div>
                            </div>
                            <div class="row align-center align-middle">
                                <div class="small-12 columns"><hr></div>
                                <div class="medium-3 columns right-border">
                                    BMW M3
                                    <img class="borrowing-img" src="../img/bmw1.jpg">
                                </div>
                                <div class="medium-3 columns right-border">
                                    <a href="#" class="borrowings-lender-name">Jason Slasher</a>
                                </div>
                                <div class="medium-3 columns right-border">
                                    December 23-25, 2015
                                </div>
                                <div class="medium-3 columns">
                                    <a href="#" clas="">View Invoice</a>
                                </div>
                            </div>
                        </div>
                    </div-->

                    <!--div class="tabs-content vertical" data-tabs-content="example-vert-tabs">
                        <div class="tabs-panel is-active">
                            <div class="text-center">
                                <div class="row">
                                    <div class="medium-3 columns">
                                        Item
                                    </div>
                                    <div class="medium-3 columns">
                                        Lender
                                    </div>
                                    <div class="medium-3 columns">
                                        Dates
                                    </div>
                                    <div class="medium-3 columns">
                                        Details
                                    </div>
                                </div>
                            </div>
                            <div class="row align-center align-middle">
                                <div class="small-12 columns"><hr></div>
                                <div class="medium-3 columns right-border">
                                    BMW M3
                                    <img class="borrowing-img" src="../img/bmw1.jpg">
                                </div>
                                <div class="medium-3 columns right-border">
                                    <a href="#" class="borrowings-lender-name">Jason Slasher</a>
                                </div>
                                <div class="medium-3 columns right-border">
                                    December 23-25, 2015
                                </div>
                                <div class="medium-3 columns">
                                    <a href="#" clas="">View Invoice</a>
                                </div>
                            </div>
                        </div>
                    </div-->
                </div>
            </div>
        </div>
        <!--**** Modal ****-->
        <div class="modal fade" id="deleteCar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Do you really want to delete this listing?</h4>
                    </div>
                    <div class="modal-body">
                        After pressing delete <strong>listings</strong> will be removed!<br>
                        Car still will be visible in "Garage" tab of "Dock"
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                        <a href="/RemoveListing?id=" type="button" id="confirm-delete" class="btn btn-danger">Delete</a>
                    </div>
                </div>
            </div>
        </div>
        <!--**** Modal ENDS ****-->
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
        <script>
            $("#delete").click(function(){
                $("#confirm-delete").attr("href",$("#confirm-delete").attr("href") + $(this).attr("name"));
            });
            </script>
    </body>
</html>