<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <meta charset="UTF-8"/>
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Lendock</title>
    </head>
    <body class="">
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <c:choose>
            <c:when test="${!empty sessionScope.user}">
                <jsp:include page="/header.jsp" />
            </c:when>
            <c:otherwise>
                <jsp:include page="/header-no-login.html" />
            </c:otherwise>
        </c:choose>
        <form action="/SearchResult" method="get">
            <div class="container filter-field margin-top-65-">
                <div class="row padding-15">
                    <div class="col-xs-12 col-sm-6">
                        <div class="form-group col-md-6">
                            <label for="date1" class="dead-text">Start Date</label>
                            <input readonly type="text" name="date-min" class="form-control span2 no-bottom-margin" value="${requestScope.datemin}" id="sdate">
                            <!--input type="text" class="form-control" id="date1" placeholder="Pickup date" value=""-->
                        </div>
                        <div class="form-group col-md-6">
                            <label for="date2" class="dead-text">End Date</label>
                            <input readonly type="text" name="date-max" class="form-control span2 no-bottom-margin" value="${requestScope.datemax}" id="edate">
                            <!--input type="email" class="form-control" id="date2" placeholder="Drop off date" value=""-->
                        </div>
                        <hr>
                        <div class="dead-text">
                            Price Range
                        </div>
                        <div class="form-horizontal col-md-12">
                            <div class="form-group">
                                <div class="col-xs-6">
                                    <div class="input-group">
                                        <div class="input-group-addon azn">M</div>
                                    <input type="text" id="amount-min" name="price-min" class="form-control"  style="color:#f6931f; font-weight:bold;">
                                    </div>
                                </div>
                                <div class="col-xs-6">
                                    <div class="input-group">
                                     <div class="input-group-addon azn">M</div><input type="text" id="amount-max" name="price-max" class="form-control"  style="color:#f6931f; font-weight:bold;">
                                </div>
                                    </div>

                            </div><div id="slider-range"></div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 car-type">
                        <div class="row">
                            <div class="col-xs-5 col-xs-offset-1 col-sm-4 col-sm-offset-2 col-md-offset-1 col-md-3">
                                <input id="type1" name="car-type" value="1" type="radio" name="type">
                                <label for="type1" class="car-type-svg">
                                    <svg version="1.1" id="Layer_5" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="47.6 310.9 500 220" enable-background="new 47.6 310.9 500 220" xml:space="preserve">
                                    <g>
                                    <path d="M207.9,399.4c-9.2,0-34.8-2.3-48.1-9.6c20.6-11,57.2-23.8,76-23.8c16.5,0,36.6,0,52.7,0c25.2,0,46.2,9.2,66.9,20.6
                                          c-3.2,3.2-5,6.4-5.5,11.4c0,0.5,0,0.9,0,1.4H207.9L207.9,399.4z"></path>
                                    <path d="M134.6,486.4c-21.1,0-45.3-12.4-46.7-12.8l-2.3-1.4v-32.1l-1.4-0.9c0.9-1.8,6-7.3,6-11.9v-29.8l17.9-4.1
                                          c24.3-11.4,90.7-34.3,134.6-34.3h54.9c12.4,0.9,22.9,3.2,32.1,5.5c17.9,5.5,58.6,30.2,65,34.3c6.4,0.9,40.3,5,67.8,11.9
                                          c33,8.2,44,21.5,45.3,27.5l2.7,47.2l-4.1-0.9c-7.8,1.8-14.2,2.7-31.1,2.7h-18.8v-9.2h13.7c12.8,0,22-0.5,27.5-1.8v-0.9v-35.7
                                          c-0.5-1.4-9.6-11.9-38-19.2c-29.8-7.8-66.9-11.9-67.3-11.9l-1.8-0.5c-0.5-0.5-45.8-28.8-64.1-34.3c-8.2-2.3-18.3-4.1-29.3-5.5h-54
                                          c-42.6,0-104.4,22.9-127.8,33.9l-4.6,1.4l-11,2.3v22c0,6.4-3.2,12.8-4.6,15.6v22.9c6,3.7,22.9,12.4,38,11.9h12.4v9.2h-12.4
                                          C132.8,486.4,135.1,486.4,134.6,486.4L134.6,486.4z M402,486.4H200.6v-9.2H402V486.4L402,486.4z"></path>
                                    <path d="M99.8,414.1c0,4.6-2.3,9.6-2.7,12.4h6.9c7.8,0,17.9-6,18.3-12.4v-6H99.4L99.8,414.1L99.8,414.1L99.8,414.1z"></path>
                                    <path d="M471.6,433.3l9.2,16.5c2.7-1.8,7.3-2.7,11-2.7l0,0l0,0l0,0l0,0l0,0l0,0c4.6,0,9.6,0,14.2,0v-0.9c-0.5-1.4-5-9.2-9.6-12.8
                                          C487.7,433.3,479.9,433.3,471.6,433.3L471.6,433.3z"></path>
                                    <polygon points="310.5,426.9 287.6,426.9 287.6,422.3 310.5,422.3 	"></polygon>
                                    <polygon points="214.3,426.9 191.4,426.9 191.4,422.3 214.3,422.3 	"></polygon>
                                    <polygon points="232.6,459.9 232.6,468.1 381.9,468.1 	"></polygon>
                                    <polygon points="502.8,468.1 493.6,468.1 493.6,463.5 502.8,463.5 	"></polygon>
                                    <path d="M494.5,463.5h-6.9c-1.8,0-3.2-0.9-3.2,0.9v4.6c0,1.8,1.4,3.2,3.2,3.2h6.9c1.8,0,3.2-1.4,3.2-3.2v-2.3
                                          C498.2,464.9,496.8,463.5,494.5,463.5L494.5,463.5z"></path>
                                    <path d="M359,396.2L359,396.2c-2.7,2.7-4.1,6-4.1,9.6c0,1.4,0.5,0.5,1.4,1.4c0.9,0.9,1.8,1.4,3.2,1.4H370c1.8,0,3.2-0.9,4.1-2.3
                                          c0.9-1.4,0.9-0.9,0-2.7c-1.8-3.2-5-6.4-10.1-8.2C362.2,394.4,360.4,394.8,359,396.2L359,396.2z"></path>
                                    <path d="M367.7,415.5c-0.9,0-1.8-0.5-2.7-1.4l-6-8.2c-0.9-1.4-0.9-3.2,0.9-4.6c1.4-0.9,3.2-0.9,4.6,0.9l6,8.2
                                          c0.9,1.4,0.9,3.2-0.9,4.6C369.1,415,368.6,415.5,367.7,415.5L367.7,415.5z"></path>
                                    <path d="M95.2,463.5v13.3h35.3l-0.5-0.9C115.4,474.5,101.2,467.2,95.2,463.5L95.2,463.5z"></path>
                                    <path d="M175.4,431L175.4,431c11,0,21.1,4.6,28.8,11.9l0,0h-1.4c7.3,7.3,11.9,17.4,11.9,28.8v11.9v2.7h-4.6h-8.7
                                          c2.7-4.6,4.1-9.6,4.1-14.7c0-16-13.3-27.5-29.3-27.5s-29.3,11-29.3,27.5c0,5.5,1.4,10.5,4.1,14.7h-10.5h-3.2v-4.6v-10.5
                                          c0-11,4.6-21.1,11.9-28.8h-1.8l0,0C153.9,435.6,163.9,431,175.4,431L175.4,431z"></path>
                                    <path d="M151.1,449.3c6.4-6.4,14.7-10.1,24.3-10.1c9.6,0,17.9,3.7,24.3,10.1l0,0c6.4,6.4,10.1,14.7,10.1,24.3
                                          c0,9.6-3.7,17.9-10.1,24.3l0,0c-6.4,6.4-14.7,10.1-24.3,10.1c-9.6,0-17.9-3.7-24.3-10.1c-6.4-6.4-10.1-14.7-10.1-24.3
                                          C141,464,144.7,455.3,151.1,449.3L151.1,449.3L151.1,449.3L151.1,449.3z M175.4,449.3c-13.3,0-23.8,10.5-23.8,23.8
                                          s10.5,23.8,23.8,23.8c13.3,0,23.8-10.5,23.8-23.8C199.2,460.3,188.7,449.3,175.4,449.3L175.4,449.3z"></path>
                                    <path d="M175.4,464.9c-5,0-8.7,4.1-8.7,8.7c0,5,3.7,8.7,8.7,8.7c4.6,0,8.7-3.7,8.7-8.7C184.1,468.6,180,464.9,175.4,464.9
                                          L175.4,464.9z"></path>
                                    <path d="M432.7,431L432.7,431c11,0,21.1,4.6,28.8,11.9l0,0h1.8c7.3,7.3,11.9,17.4,11.9,28.8v11.9v2.7h-4.6h-11.9
                                          c2.7-4.6,4.1-9.6,4.1-14.7c0-16-13.3-27.5-29.3-27.5s-29.3,11-29.3,27.5c0,5.5,1.4,10.5,4.1,14.7h-10.5h-4.6v-4.6v-10.5
                                          c0-11,4.6-21.1,11.9-28.8h-0.5l0,0C411.7,435.6,421.7,431,432.7,431L432.7,431z"></path>
                                    <path d="M408.5,449.3c6.4-6.4,14.7-10.1,24.3-10.1c9.6,0,17.9,3.7,24.3,10.1l0,0c6.4,6.4,10.1,14.7,10.1,24.3
                                          c0,9.6-3.7,17.9-10.1,24.3l0,0c-6.4,6.4-14.7,10.1-24.3,10.1c-9.6,0-17.9-3.7-24.3-10.1c-6.4-6.4-10.1-14.7-10.1-24.3
                                          C398.8,464,402.5,455.3,408.5,449.3L408.5,449.3L408.5,449.3L408.5,449.3z M432.7,449.3c-13.3,0-23.8,10.5-23.8,23.8
                                          s10.5,23.8,23.8,23.8c13.3,0,23.8-10.5,23.8-23.8C457,460.3,446,449.3,432.7,449.3L432.7,449.3z"></path>
                                    <path d="M432.7,464.9c-4.6,0-8.7,4.1-8.7,8.7c0,5,3.7,8.7,8.7,8.7c4.6,0,8.7-3.7,8.7-8.7C441.9,468.6,437.8,464.9,432.7,464.9
                                          L432.7,464.9z"></path>
                                    </g>
                                    </svg>
                                </label>
                                <h5><label for="type1">Avtomobil</label></h5>
                            </div> 
                            <div class="col-xs-5 col-sm-4 col-md-3">
                                <input id="type2" name="car-type" value="9" type="radio" name="type">
                                <label for="type2" class="car-type-svg">       
                                    <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                         viewBox="-110 50 680 308" style="enable-background:new 0 0 448 448;" xml:space="preserve">
                                    <g>
                                    <path d="M95.721,288.022c-4.418,0-8,3.582-8,8c0,4.241-3.448,7.691-7.687,7.691c-4.241,0-7.691-3.45-7.691-7.691
                                          c0-4.239,3.45-7.688,7.691-7.688c4.418,0,8-3.582,8-8c0-4.418-3.582-8-8-8c-13.063,0-23.691,10.626-23.691,23.688
                                          c0,13.063,10.628,23.691,23.691,23.691c13.061,0,23.687-10.628,23.687-23.691C103.721,291.604,100.139,288.022,95.721,288.022z"/>
                                    <path d="M384.091,288.022c-4.418,0-8,3.582-8,8c0,4.241-3.448,7.691-7.687,7.691c-4.241,0-7.691-3.45-7.691-7.691
                                          c0-4.239,3.45-7.688,7.691-7.688c4.418,0,8-3.582,8-8c0-4.418-3.582-8-8-8c-13.063,0-23.691,10.626-23.691,23.688
                                          c0,13.063,10.628,23.691,23.691,23.691c13.061,0,23.687-10.628,23.687-23.691C392.091,291.604,388.509,288.022,384.091,288.022z"/>
                                    <path d="M416,103.953H32c-17.645,0-32,14.355-32,32v130.812c0,21.896,18.541,32.275,32.479,35.886
                                          c3.241,23.354,23.327,41.397,47.558,41.397c20.739,0,38.446-13.221,45.147-31.678H323.25c6.703,18.457,24.414,31.678,45.157,31.678
                                          c20.739,0,38.446-13.221,45.147-31.678H440c4.418,0,8-3.582,8-8V135.953C448,118.308,433.645,103.953,416,103.953z M432,215.742
                                          h-31.63c-4.501,0-8.162-3.662-8.162-8.162v-63.377H432V215.742z M80.037,328.047c-17.029,0-30.992-13.361-31.967-30.15
                                          c0.075-0.311,0.137-0.626,0.175-0.952c0.112-0.963,0.039-1.903-0.176-2.794C49.042,277.362,63.006,264,80.037,264
                                          c17.653,0,32.016,14.365,32.016,32.021C112.053,313.68,97.69,328.047,80.037,328.047z M176.583,144.203h87.688v71.539h-87.688
                                          V144.203z M160.583,215.742H56.173c-4.501,0-8.162-3.662-8.162-8.162v-63.377h112.572V215.742z M352.628,144.203v63.708
                                          c0,4.318-3.513,7.831-7.831,7.831h-64.526v-71.539H352.628z M264.271,231.742v64.627h-87.688v-64.627H264.271z M368.407,328.047
                                          c-17.659,0-32.026-14.367-32.026-32.026c0-17.656,14.367-32.021,32.026-32.021c17.653,0,32.016,14.365,32.016,32.021
                                          C400.423,313.68,386.061,328.047,368.407,328.047z M416.414,296.369c0.001-0.116,0.009-0.231,0.009-0.348
                                          c0-26.479-21.54-48.021-48.016-48.021c-26.481,0-48.026,21.542-48.026,48.021c0,0.117,0.008,0.232,0.009,0.348h-40.119v-64.627
                                          h64.526c13.141,0,23.831-10.69,23.831-23.831v-71.708c0-4.418-3.582-8-8-8H40.011c-4.418,0-8,3.582-8,8v71.377
                                          c0,13.323,10.839,24.162,24.162,24.162h104.41v64.627h-32.539c0.001-0.116,0.009-0.231,0.009-0.348
                                          c0-26.479-21.54-48.021-48.016-48.021c-23.073,0-42.393,16.356-46.985,38.081C25.684,283.552,16,278.078,16,266.764V135.953
                                          c0-8.823,7.178-16,16-16h384c6.011,0,11.253,3.335,13.987,8.25h-45.779c-4.418,0-8,3.582-8,8v71.377
                                          c0,13.323,10.839,24.162,24.162,24.162H432v8.294h-7.789c-4.418,0-8,3.582-8,8s3.582,8,8,8H432v40.333H416.414z"/>
                                    </g>
                                    <g>
                                    </g>
                                    <g>
                                    </g>
                                    <g>
                                    </g>
                                    <g>
                                    </g>
                                    <g>
                                    </g>
                                    <g>
                                    </g>
                                    <g>
                                    </g>
                                    <g>
                                    </g>
                                    <g>
                                    </g>
                                    <g>
                                    </g>
                                    <g>
                                    </g>
                                    <g>
                                    </g>
                                    <g>
                                    </g>
                                    <g>
                                    </g>
                                    <g>
                                    </g>
                                    </svg>
                                </label>
                                <h5><label for="type2">Avtobus</label></h5>
                            </div>
                            <div class="col-md-2"><input class="btn btn-primary" type="submit" value="Search"/></div>
                        </div>
                        <div class="col-xs-12">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" name="for-wedding" value="true" /> Toy üçün maşın
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <div class="container-fluid bg-filter">
            <div class="row">
                <c:set var="listings" value="${requestScope.listings}" />
                <c:forEach var="listing" items="${listings}">
                    <c:set var="car" value="${listing.car}" />
                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                        <div class="item-box">
                            <a href="/GetListing?id=${listing.listingId}">
                                <div class="image-box" style="background-image: url(/data/cars/${car.photos[0]})">
                                    <div class="item-price">
                                        <span class="azn">M</span>${listing.price}/per day
                                    </div>
                                </div>
                            </a>
                            <div class="title-box">
                                <span class="item-title">
                                    ${car.model.make.name} ${car.model.name} ${car.manufactureYear}
                                </span>
                                <span class="wishlist-button">
                                    <button id="${listing.listingId}" type="button" class="no-border">
                                        <img src="img/favorite21.png">
                                    </button>
                                </span>
                            </div>
                            <div class="item-specs">
                                <div class="specs-icon">
                                    <img src="img/silhouette42.png">
                                    <span class="specs-detail">${car.seatsNumber} seats</span>
                                </div>
                                <div class="specs-icon">
                                    <img src="img/stacked9.png">
                                    <span class="specs-detail">${car.carType.name}</span>
                                </div>
                                <div class="specs-icon">
                                    <img src="img/fuel19.png">
                                    <span class="specs-detail">${car.fuelType.name}</span>
                                </div>
                                <div class="specs-icon">
                                    <img src="img/driving2.png">
                                    <span class="specs-detail">${car.transmission.name}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <div class="col-xs-12">
                    <nav class="text-center">
                        <ul class="pagination">
                            <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true"><i class="fa fa-arrow-left color-primary" aria-hidden="true"></i>
                                    </span></a>
                            </li>
                            <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#" aria-label="Next"><span aria-hidden="true"><i class="fa fa-arrow-right color-primary" aria-hidden="true"></i></span></a></li>
                        </ul>
                    </nav>
                </div>

            </div>
        </div>
    </div>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script>
        $("button").click(function () {
            $.ajax({
                url: "/NewWish?lid=" + $(this).attr("id")
            }).done(function () {
            });
        });
    </script>
    <script>
        $(function () {
            $("#slider-range").slider({
                range: true,
                min: 0,
                max: 1000,
                values: [${requestScope.pricemin}, ${requestScope.pricemax}],
                slide: function (event, ui) {
                    $("#amount-min").val(ui.values[0]);
                    $("#amount-max").val(ui.values[1]);
                }
            });
            $("#amount-min").val( $("#slider-range").slider("values", 0));
            $("#amount-max").val(
                    $("#slider-range").slider("values", 1));
        });

        $(function () {
            $("#sdate").datepicker({
                dateFormat: "dd.mm.yy",
                minDate: new Date(),
                showAnim: "clip",
                hideIfNoPrevNext: true,
                duration: "fast",
                defaultDate: 0,
                onClose: function (selectedDate) {
                    $("#edate").datepicker("option", "minDate", selectedDate);
                }
            });
            $("#edate").datepicker({
                dateFormat: "dd.mm.yy",
                showAnim: "clip",
                hideIfNoPrevNext: true,
                duration: "fast",
                defaultDate: 0,
                minDate: new Date(),
                onClose: function (selectedDate) {
                    $("#sdate").datepicker("option", "maxDate", selectedDate);
                }
            });
        });
    </script>
    <jsp:include page="/footer.html" />
</body>
</html>