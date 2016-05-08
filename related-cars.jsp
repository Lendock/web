<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="row">
    <hr>
    <h3>Related Cars</h3>
    <div id="owl-demo" class="owl-carousel owl-theme">
        <c:set var="listings" value="${requestScope.listings}" />
        <c:set var="size" value="${fn:length(listings)/4}" />
        <c:forEach var="i" begin="1" end="${size}" >
        <div class="item">
            <div class="col-xs-12 col-sm-6 col-md-3">
                <div class="item-box">
                    <a href="#">
                        <div class="image-box" style="background-image: url(img/bmw1.jpg)">
                            <div class="item-price">
                                <span class="azn">M</span>120/per day
                            </div>
                        </div>
                    </a>
                    <div class="title-box">
                        <span class="item-title">
                            Mercedes S Class 2015 qwerty A A A A
                        </span>
                        <span class="wishlist-button">
                            <button type="button" class="no-border">
                                <img src="img/favorite21.png">
                            </button>
                        </span>
                    </div>
                    <div class="item-specs">
                        <div class="specs-icon">
                            <img src="img/silhouette42.png">
                            <span class="specs-detail">4 seats</span>
                        </div>
                        <div class="specs-icon">
                            <img src="img/stacked9.png">
                            <span class="specs-detail">Sedan</span>
                        </div>
                        <div class="specs-icon">
                            <img src="img/fuel19.png">
                            <span class="specs-detail">Benzine</span>
                        </div>
                        <div class="specs-icon">
                            <img src="img/driving2.png">
                            <span class="specs-detail">Tiptronic</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </c:forEach>
</div>
</div>