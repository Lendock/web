<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        <li class="tabs-title active"><a href="/AllMyCars"><img class="tabs-icons"
                                                                               src="../img/vehicle-white.png"><br>Dock</a></li>
                        <li class="tabs-title"><a href="/GetWishlist"><img class="tabs-icons" src="../img/wishlist.png"><br>Wishlist</a>
                        </li>
                        <li class="tabs-title"><a href="/home/settings.jsp"><img class="tabs-icons" src="../img/tool.png"><br>Settings</a>
                        </li>
                    </ul>
                </div>
                <div class="col-sm-9 col-md-10">
                    <div class="row">
                        <ul class="nav nav-pills nav-justified tabs-border">
                            <li class="active"><a href="cars.html">Garage</a></li>
                            <li><a href="/AllListings">Listings</a></li>
                        </ul>
                    </div>
                    <div class="row">
                        <c:set var="cars" value="${requestScope.cars}" />
                        <c:forEach var="car" items="${cars}">
                            <div class="col-sm-6 col-md-4 col-lg-3">
                                <div class="borrowing-box margin-top-15">
                                    <div class="image-panel">
                                        <div class="borrowing-list-image"
                                             style="background-image: url('/data/cars/${car.photos[0]}');"></div>
                                    </div>
                                    <div class="text-center">
                                        <h6>${car.model.make.name} ${car.model.name} ${car.manufactureYear}</h6>
                                        <span class="text-muted">Added on:</span>
                                        <div class="invoice-date">${car.added}</div>
                                        <a href="/GetCar?id=${car.id}" class="btn button-green">Edit car</a>
                                        <button class="btn button-red" data-toggle="modal" data-target="#deleteCar">Delete car
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <!--Add car-->
                        <div class="col-sm-6 col-md-4 col-lg-3">
                            <a href="/home/add-item.jsp">
                                <div class=" btn btn-default borrowing-box margin-top-15">
                                    <img class="add-sign" src="../img/add-sign.png">
                                    <h4>Add Car</h4>
                                </div>
                            </a>
                        </div>
                        <!--Add car ENDs-->
                    </div>
                </div>
            </div>
        </div>
        <!--**** Modal ****-->
        <div class="modal fade" id="deleteCar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Do you really want to delete car?</h4>
                    </div>
                    <div class="modal-body">
                        After pressing delete your car and all related <strong>listings</strong> will be removed!
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                        <button type="button" class="btn btn-danger">Delete</button>
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
    </body>
</html>