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
        <jsp:include page="/header.jsp" />
        <div class="container">
            <div class="row margin-top-65">
                <div class="col-sm-3 col-md-2">
                    <ul class="nav nav-pills nav-stacked dashboard-tabs" id="example-vert-tabs">
                        <li class="tabs-title"><a href="/home/profile.jsp"><img class="tabs-icons" src="../img/profile.png"><br>Profil</a>
                        </li>
                        <li class="tabs-title"><a href="/GetOutgoingRequests"><img class="tabs-icons"
                                                                                   src="../img/borrow-icon.png"><br>Sifarişlərim</a></li>
                        <li class="tabs-title"><a href="/AllMyCars"><img class="tabs-icons"
                                                                         src="../img/vehicle.png"><br>Dock</a></li>
                        <li class="tabs-title active"><a href="/GetWishlist"><img class="tabs-icons" src="../img/wishlist-white.png"><br>Wishlist</a>
                        </li>
                        <li class="tabs-title"><a href="/home/settings.jsp"><img class="tabs-icons"
                                                                                 src="../img/tool.png"><br>Tənzimləmələr</a>
                        </li>
                    </ul>
                </div>
                <div class="col-sm-9 col-md-10">
                    <div class="row">
                        <c:set var="wishlist" value="${requestScope.wishlist}"/>
                        <c:forEach var="wish" items="${wishlist}">
                            <div class="col-sm-6 col-md-4 col-lg-3">
                                <div class="borrowing-box margin-top-15">
                                    <div class="image-panel">
                                        <a href="/GetListing?id=${wish.listing.id}">
                                            <div class="borrowing-list-image" style="background-image: url('/data/cars/${wish.listing.car.photos[0]}');"></div>
                                        </a>
                                    </div>
                                    <div class="text-center">
                                        <h5>${wish.listing.car.model.make.name} ${wish.listing.car.model.name} ${wish.listing.car.manufactureYear}</h5>
                                        <span class="text-muted">Added on:</span> <div class="invoice-date">03 April 2016</div>
                                        <a class="btn button-red" id="delete-wish" name="${wish.id}" data-toggle="modal" data-target="#deleteCar">Delete</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
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
                        <h4 class="modal-title" id="myModalLabel">Do you really want to delete car?</h4>
                    </div>
                    <div class="modal-body">
                        After pressing delete your car and all related <strong>listings</strong> will be removed!
                    </div>
                    <div class="modal-footer">
                        <button type="button" onclick="return false;" class="btn btn-default" data-dismiss="modal">Cancel</button>
                        <a href="/RemoveWish?wid=" type="button" id="confirm-delete" class="btn btn-danger">Delete</a>
                    </div> 
                </div>
            </div>
        </div>
        <!--**** Modal ENDS ****-->
        <jsp:include page="/footer.jsp" />
        <script>
            $("#delete-wish").click(function(){
                $("#confirm-delete").attr("href",$("#confirm-delete").attr("href") + $(this).attr("name"));
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