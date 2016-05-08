<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Title</title>
    </head>
    <body>
       <jsp:include page="/header.jsp" />
        <div class="container">
            <div class="row margin-top-65">
                <c:set var="request" value="${sessionScope.request}" />
                <c:set var="listing" value="${request.listing}" />
                <c:set var="car" value="${listing.car}" />
                <div class="col-xs-12"><h4>Please review your request</h4></div>
                    <div class="col-xs-12 col-md-4 col-lg-4  margin-30">
                        <img class="approve-car-img" src="/data/cars/${car.photos[0]}">
                        <div class="row margin-top-15">
                            <div class=" col-xs-3 col-md-4 col-lg-3">
                                <a href="#"><img class="circular" height="50px" src="/data/users/${car.owner.photo}"></a>
                            </div>
                            <div class=" col-xs-9 col-md-8 col-lg-8">
                                <div class="lender-name">
                                    <a href="#">${car.owner.fName} ${car.owner.lName}</a>
                                </div>
                                <div class="request-borrower-rating">
                                    <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="col-xs-12 col-md-8 col-lg-8">
                        <h4>${car.model.make.name} ${car.model.name} ${car.manufactureYear}</h4>
                        <div class="row">
                            <div class="col-xs-3 ">
                                <img class="specs-approve-car" src="img/silhouette42.png">
                                <span class="listing-spec-details">${car.seatsNumber} seats</span>
                            </div>
                            <div class="col-xs-3 ">
                                <img class="specs-approve-car" src="img/stacked9.png">
                                <span class="listing-spec-details">${car.carType.name}</span>
                            </div>
                            <div class="col-xs-3 ">
                                <img class="specs-approve-car" src="img/fuel19.png">
                                <span class="listing-spec-details">${car.fuelType.name}</span>
                            </div>
                            <div class="col-xs-3 ">
                                <img class="specs-approve-car" src="img/driving2.png">
                                <span class="listing-spec-details">${car.transmission.name}</span>
                            </div>
                        </div>
                        <div class="row">
                            <table class="table-approve">
                                <tr>
                                    <td>Start Date</td>
                                    <td>End Date</td>
                                </tr>
                                <tr>
                                    <td><fmt:formatDate type="date" value="${request.sDate}" /></td>
                                    <td><fmt:formatDate type="date" value="${request.eDate}" /></td>
                                </tr>
                                <tr>
                                    <td>Price per day</td>
                                    <td>Total</td>
                                </tr>
                                <tr>
                                    <td><span class="azn">M</span>${listing.price}</td>
                                    <td><span class="azn">M</span>${request.total}</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                <div class="col-xs-12 padding-15">Please add request message to lender. Lender will review your message and request!</div>
                <form action="/NewRequest" method="post">
                    <div class="col-xs-12 col-md-9">
                        <textarea name="message" class="form-control" style="background-color: #fff" placeholder="Hi, I will be lending your car..."></textarea>
                    </div>
                    <div class="col-xs-12 col-md-3">
                        <button type="submit" class="btn btn-success">Send Request</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
</html>