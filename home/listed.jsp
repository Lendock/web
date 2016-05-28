<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="icon" type="image/png" href="/img/lendock-favicon.png">
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
                        <li class="tabs-title"><a href="/home/profile.jsp"><img class="tabs-icons" src="../img/profile.png"><br>Profil</a>
                        </li>
                        <li class="tabs-title"><a href="/GetOutgoingRequests"><img class="tabs-icons"
                                                                                   src="../img/borrow-icon.png"><br>Sifarişlərim</a></li>
                        <li class="tabs-title active"><a href="/AllMyCars"><img class="tabs-icons"
                                                                         src="../img/vehicle-white.png"><br>Dock</a></li>
                        <li class="tabs-title"><a href="/GetWishlist"><img class="tabs-icons" src="../img/wishlist.png"><br>Wishlist</a>
                        </li>
                        <li class="tabs-title"><a href="/home/settings.jsp"><img class="tabs-icons"
                                                                                 src="../img/tool.png"><br>Tənzimləmələr</a>
                        </li>
                    </ul>
                </div>
                <div class="col-sm-9 col-md-10">
                    <div class="row">
                        <ul class="nav nav-pills nav-justified tabs-border">
                            <li><a href="/AllMyCars">Garaj</a></li>
                            <li class="active"><a href="listed.html">Elanlar</a></li>
                        </ul>
                    </div>
                    <div class="row">
                        <c:set var="listings" value="${requestScope.listings}" />
                        <c:forEach var="listing" items="${listings}">
                            <div class="col-sm-6 col-md-4 col-lg-3">
                                <div class="borrowing-box margin-top-15">
                                    <div class="image-panel">
                                        <a href="/GetListing?id=${listing.id}">
                                            <div class="item-price">$${listing.price}/günlük</div>
                                            <div class="borrowing-list-image" style="background-image: url('/data/cars/${listing.car.photos[0]}');"></div>
                                        </a>
                                    </div>
                                    <div class="text-center">
                                        <h4>${listing.car.model.make.name} ${listing.car.model.name} ${listing.car.manufactureYear}</h4>
                                        <c:choose>
                                            <c:when test="${listing.active == true}">
                                                <span class="text-muted">Hazırki status:<span class="green-color"> Aktiv</span></span><br>
                                                <a href="/ChangeListingStatus?mod=0&lid=${listing.id}" class="btn btn-default buttons-margin">Deaktiv etmək</a>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="text-muted">Hazırki status:<span class="red-color"> Inactive</span></span><br>
                                                <a href="/ChangeListingStatus?mod=1&lid=${listing.id}" class="btn btn-default buttons-margin">Aktiv etmək</a>
                                            </c:otherwise>
                                        </c:choose>                                 
                                        <a href="/GetListing?id=${listing.id}&m=er" class="btn button-green">Elanı dəyişmək</a>
                                        <button id="delete" name="${listing.id}" class="btn button-red" data-toggle="modal" data-target="#deleteCar">Elanı silmək</button>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <div class="col-sm-6 col-md-4 col-lg-3">
                            <a href="/home/add-listing.jsp">
                                <div class=" btn btn-default borrowing-box margin-top-15">
                                    <img class="add-sign" src="/img/add-sign.png">
                                    <h4>Elan əlavə et</h4>
                                </div>
                            </a>
                        </div>
                    </div>
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
<jsp:include page="/footer.jsp" />
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