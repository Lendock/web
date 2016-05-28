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
    </head>
    <body class="bg-filter">
        <jsp:include page="/header.jsp" />
        <script type="text/javascript" src="/js/jalendar.min.js"></script>
        <link rel="stylesheet" type="text/css" href="/css/jalendar.css">
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
                <c:set var="listing" value="${requestScope.listing}" />
                <form action="/UpdateListing" method="post" > 
                    <div class="col-sm-9 col-md-10">
                        <div class="menu">
                            <div class="back">
                                <a href="/AllListings"><i style="color:#fff;" class="fa fa-arrow-left"></i><span> Elanlara qayıt</span></a>
                                <!--img src="../img/ramiz.jpg" draggable="false"/-->
                            </div>
                            <!--div class="name">Ramiz Ismayilov</div>
                            <div class="last">18:09</div-->
                        </div>
                        <!---img upload-ENDS--->
                        <div class="row margin-top-15">
                            <div class="col-xs-12 col-md-6">
                                <div class="form-group">
                                    <label for="manufacter">İstehsalçı <span class="faded-text"></span></label>
                                    <select disabled id="manufacter" class="form-control">
                                        <option>${listing.car.model.make.name}</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="price">Qiyməti yenilə</label>
                                    <div class="input-group">
                                        <div class="input-group-addon azn">M</div>
                                        <input type="text" name="price" class="form-control" id="price" placeholder="${listing.price}">
                                        <div class="input-group-addon">.00</div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-md-6">
                                <div class="form-group">
                                    <label>Məlumat yenilə<span
                                            class="faded-text"> 500 Characters Left</span></label>
                                    <textarea class="form-control" rows="4" name="about" placeholder="${listing.description}"></textarea>
                                </div>
                            </div>
                        </div>
                                <hr>
                        <div class="row">
                            <div class="col-xs-12 col-sm-6">
                                <h4>NV-in saytda aktiv tarixləri</h4>
                                <div id="yourId4" class="jalendar"></div>
                                <div class="jalendar-input">
                                    
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6">
                                <div class="form-group">
                                    <label for="happy" class="col-xs-12 control-label">Elanı bu tarixlərdə deaktiv etmək?</label>
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <input type="text" class="form-control" readonly placeholder="dates from calendar"/><br>
                                            <div id="radioBtn" class="btn-group">
                                                <a class="btn btn-primary btn-sm active" data-toggle="happy" data-title="Y">Bəli</a>
                                                <a class="btn btn-primary btn-sm notActive" data-toggle="happy" data-title="N">Xeyr</a>
                                            </div>
                                            <input type="hidden" name="happy" id="happy">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!---Specification-ENDS--->


                        <div class="row"><br/>
                            <div class="col-xs-12 center">
                                <input type="hidden" name="id" value="${listing.id}">
                                <button type="submit" class="btn btn-success">Yenilə</button>
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
                    <h4 class="modal-title" id="myModalLabel">Elanı silmək istəyirsiniz</h4>
                </div>
                <div class="modal-body">
                    Sil basdıqdan sonra <strong>elan</strong> silinəcəq!
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">İmtina</button>
                    <button type="button" class="btn btn-danger">Sil</button>
                </div>
            </div>
        </div>
    </div>
    <!--**** Modal ENDS ****-->
    <jsp:include page="/footer.jsp" />
    <script>
        $('#yourId4').jalendar({
            color: '#37C4A7',
            type: 'range',
            lang: 'EN'
                    //done: function () {
                    //    alert($('#yourId4 input.data1').val() + ' / ' + $('#yourId4 input.data2').val())

        });
    </script>
    <script>
        $('#radioBtn a').on('click', function () {
            var sel = $(this).data('title');
            var tog = $(this).data('toggle');
            $('#' + tog).prop('value', sel);

            $('a[data-toggle="' + tog + '"]').not('[data-title="' + sel + '"]').removeClass('active').addClass('notActive');
            $('a[data-toggle="' + tog + '"][data-title="' + sel + '"]').removeClass('notActive').addClass('active');
        })
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