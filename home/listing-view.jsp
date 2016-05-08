<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                        <li class="tabs-title"><a href="/home/settings.jsp"><img class="tabs-icons"
                                                                                 src="../img/tool.png"><br>Settings</a>
                        </li>
                    </ul>
                </div>
                <c:set var="listing" value="${requestScope.listing}" />
                <form action="/UpdateListing" method="post" > 
                <div class="col-sm-9 col-md-10">
                    <div class="menu">
                        <div class="back">
                            <a href="listed.html"><i style="color:#fff;" class="fa fa-arrow-left"></i><span> Back to Listings</span></a>
                            <!--img src="../img/ramiz.jpg" draggable="false"/-->
                        </div>
                        <!--div class="name">Ramiz Ismayilov</div>
                        <div class="last">18:09</div-->
                    </div>
                    <!---img upload-ENDS--->
                    <div class="row margin-top-15">
                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <label for="manufacter">Manufacturer <span class="faded-text"></span></label>
                                <select disabled id="manufacter" class="form-control">
                                    <option>${listing.car.model.make.name}</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="price">Update price of listing</label>
                                <div class="input-group">
                                    <div class="input-group-addon azn">M</div>
                                    <input type="text" name="price" class="form-control" id="price" placeholder="${listing.price}">
                                    <div class="input-group-addon">.00</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <label>Update description of listing<span
                                        class="faded-text"> 500 Characters Left</span></label>
                                <textarea class="form-control" rows="4" name="about" placeholder="${listing.description}"></textarea>
                            </div>
                        </div>
                    </div>


                    <!---Specification-ENDS--->


                    <div class="row"><br/>
                        <div class="col-xs-12 center">
                            <input type="hidden" name="id" value="${listing.listingId}">
                            <button type="submit" class="btn btn-success">Update</button>
                        </div>
                        <br><br/>
                    </div>
                </div>
            </div>
        </div>
    </form>
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
    <script src="../js/vendor/jquery.min.js"></script>
    <script src="../js/vendor/what-input.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/foundation.min.js"></script>
    <script src="../js/app.js"></script>
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