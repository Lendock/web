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
        <c:set var="car" value="${requestScope.car}" />
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
                <form action="/UpdateCar" method="post" enctype="multipart/form-data">
                    <div class="col-sm-9 col-md-10">
                        <div class="menu">
                            <div class="back">
                                <a href="/AllMyCars"><i style="color:#fff;" class="fa fa-arrow-left"></i><span> Back to Garage</span></a>
                                <!--img src="/img/ramiz.jpg" draggable="false"/-->
                            </div>
                            <!--div class="name">Ramiz Ismayilov</div>
                            <div class="last">18:09</div-->
                        </div>
                        <!---img upload-->
                        <div class="row padding-top-bot">
                            <div class="col-xs-12">
                                <h3>Upload photos of car</h3>
                                <div class="form-group">

                                    <label for="uploadImage">Choose photos describing car at it's best</label>
                                    <input type="hidden" name="id" value="${car.id}" />
                                    <input class="btn btn-default"  name="photo" value="Upload" type="file" multiple="true" id="uploadImage"/>

                                </div>
                            </div>
                        </div>
                        <!---img upload-ENDS--->
                        <div class="row">
                            <div class="col-xs-12 col-md-6">
                                <div class="form-group">
                                    <label for="manufacter">Manufacturer <span class="faded-text"></span></label>
                                    <select disabled id="manufacter" class="form-control">
                                        <option>${car.model.make.name}</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="model">Car model <span class="faded-text"></span></label>
                                    <select disabled id="model" class="form-control">
                                        <option>${car.model.name}</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Car make year <span class="faded-text"></span></label>
                                    <input disabled class="form-control" type="text" value="${car.manufactureYear}"/>
                                </div>
                            </div>
                            <!---Specification--->
                            <div class="row ">
                                <div class="col-xs-6 col-md-3 col-lg-3">
                                    <div class="filter-adjast">
                                        <img src="/img/stacked9.png" class="filters-icon" alt="">
                                        <div class="filters-select">${car.carType.name}</div>
                                    </div>
                                </div>
                                <div class="col-xs-6 col-md-3 col-lg-3">
                                    <div class="filter-adjast">
                                        <img src="/img/silhouette42.png" class="filters-icon" alt="">
                                        <div class="filters-select">${car.seatsNumber} seats</div>
                                    </div>
                                </div>
                                <div class="col-xs-6 col-md-3 col-lg-3">
                                    <div class="filter-adjast">
                                        <img src="/img/driving2.png" class="filters-icon" alt="">
                                        <div class="filters-select">${car.transmission.name}</div>
                                    </div>
                                </div>
                                <div class="col-xs-6 col-md-3 col-lg-3">
                                    <div class="filter-adjast">
                                        <img src="/img/fuel19.png" class="filters-icon" alt="">
                                        <div class="filters-select">${car.fuelType.name}</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!---Specification-ENDS--->

                        <!---State_Registry_number--->
                        <div class="row">
                            <div class="col-xs-12 col-md-6">
                                <div class="form-group">
                                    <label>State registry number of car<span class="faded-text"></span></label>
                                    <input disabled class="form-control" type="text" value="${car.registryNumber}" />
                                </div>
                            </div>
                        </div>

                        <div class="row"><br/>
                            <div class="col-xs-12 center">
                                <button type="submit" class="btn btn-success">Update</button>
                            </div>
                            <br><br/>
                        </div>

                    </div>
                </form>
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