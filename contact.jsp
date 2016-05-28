<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <link rel="icon" type="image/png" href="/img/lendock-favicon.png">
        <meta charset="utf-8"/>
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Lendock</title>
    </head>
    <body>
        <c:choose>
            <c:when test="${!empty sessionScope.user}">
                <jsp:include page="/header.jsp" />
            </c:when>
            <c:otherwise>
                <jsp:include page="/header-no-login.jsp" />
            </c:otherwise>
        </c:choose>
        <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jqueryui-touch-punch/0.2.3/jquery.ui.touch-punch.min.js"></script>

        <div class="jumbotron jumbotron-sm ">
            <div class="container margin-top-45">
                <div class="row">
                    <div class="col-sm-12 col-lg-12">
                        <h3 class="center white">Əlaqə qur</h3>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="well well-sm">
                        <form action="">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="name">Ad</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-user black" aria-hidden="true"></i></span> 
                                            <input type="text" class="form-control" id="name" placeholder="" required="required" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="email">Email ünvan</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-envelope black" aria-hidden="true"></i>
                                            </span>
                                            <input type="email" class="form-control" id="email" placeholder="" required="required" /></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="subject">
                                            Mövzu</label>
                                        <select id="subject" name="subject" class="form-control" required="required">
                                            <option value="na" selected="">Seçim edin:</option>
                                            <option value="service">Şikaət</option>
                                            <option value="suggestions">Təklif</option>
                                            <option value="product">Sual</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="name">
                                            Mesaj</label>
                                        <textarea name="message" id="message" class="form-control" rows="9" cols="25" required="required"
                                                  placeholder=""></textarea>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <button type="submit" class="btn btn-primary pull-right" id="btnContactUs">
                                        Göndər</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-md-4">
                    <form>
                        <legend><i class="fa fa-building black" aria-hidden="true"></i></span> Bizim ofis</legend>
                        <address>
                            <strong>"Lendock"</strong><br>
                            Nərimanov rayonu, Ə.Rəcəbli küç 153 <br>
                            Bakı, Azərbaycan AZ1075<br>
                            <abbr title="Phone">
                                </abbr>

                        </address>
                        <address>
                            <a href="mailto:#">hq@lendock.com</a>
                        </address>
                    </form>
                </div>
            </div>
        </div>
    </body>
    <jsp:include page="/footer.jsp"/>
    <script>
        $(function () {
            $("#slider-range").slider({
                range: true,
                min: 0,
                max: 1000,
                values: [0, 1000],
                slide: function (event, ui) {
                    $("#amount-min").val(ui.values[0]);
                    $("#amount-max").val(ui.values[1]);
                }
            });
            $("#amount-min").val($("#slider-range").slider("values", 0));
            $("#amount-max").val($("#slider-range").slider("values", 1));
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
</html>
