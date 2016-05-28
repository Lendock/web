<!DOCTYPE html>
<html lang="en">
    <%@page contentType="text/html"  pageEncoding="UTF-8"%>
    <head>
        <meta charset="utf-8"/>
        <link rel="icon" type="image/png" href="/img/lendock-favicon.png">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Lendock</title>
    </head>
    <jsp:include page="/header.jsp" />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <body class="f8-bg">
        <!---Title--->
        <div class="container margin-top-65">
            <form action="/NewCar" method="post" enctype="multipart/form-data">
                <h3 class="center">NV Lendock qarajına əlavə et</h3>
                <h3 class="center">NV icarə etməklə pul qazana bilərsiniz</h3>
                <div class="row padding-top-bot">
                    <div class="col-xs-12 col-md-6">
                        <div class="form-group">
                            <label for="manufacter">İstehsalçı <span class="faded-text"></span></label>
                            <select id="make" class="form-control">
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="model">Model <span class="faded-text"></span></label>
                            <select id="model" name="model" class="form-control">
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Modelin istehsal ili <span class="faded-text"></span></label>
                            <select class="form-control" type="text" name="myear" id="man-year">
                            </select>
                        </div>
                    </div>
                    <!---Specification--->
                    <div class="padding-top-bot">
                        <div class="col-xs-4 col-md-3 col-lg-3">
                            <div class="filter-adjast ">
                                <img src="/img/stacked9.png" class="filters-icon-small" alt="">
                                <select name="car-type-id" class="filters-select-small">
                                    <option value="4">Convertible</option>
                                    <option value="2">Coupe</option>
                                    <option value="1">Sedan</option>
                                    <option value="5">Hatchback</option>
                                    <option value="3">SUV / Crossover</option>
                                    <option value="6">Pickup / Truck</option>
                                    <option value="7">Van</option>
                                    <option value="8">Wagon</option>
                                    <option value="9">Bus</option>                         
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-4 col-md-3 col-lg-3">
                            <div class="filter-adjast">
                                <img src="/img/silhouette42.png" class="filters-icon-small" alt="">
                                <select name="seats-number" class="filters-select-small">
                                    <option value='2'>2 Seats</option>
                                    <option value='3'>3 Seats</option>
                                    <option value='4'>4 Seats</option>
                                    <option value='5'>5 Seats</option>
                                    <option value='6'>6 Seats</option>
                                    <option value='7'>7 Seats</option>
                                    <option value='8'>8 Seats</option>
                                    <option value='9'>9 Seats</option>
                                    <option value='10'>10 Seats</option>
                                    <option value='11'>11 Seats</option>
                                    <option value='12'>12 Seats</option>
                                    <option value='13'>13 Seats</option>
                                    <option value='14'>14 Seats</option>
                                    <option value='15'>15 Seats</option>
                                    <option value='16'>16 Seats</option>
                                    <option value='17'>17 Seats</option>
                                    <option value='18'>18 Seats</option>
                                    <option value='19'>19 Seats</option>
                                    <option value='20'>20 Seats</option>
                                    <option value='21'>21 Seats</option>
                                    <option value='22'>22 Seats</option>
                                    <option value='23'>23 Seats</option>
                                    <option value='24'>24 Seats</option>
                                    <option value='25'>25 Seats</option>
                                    <option value='26'>26 Seats</option>
                                    <option value='27'>27 Seats</option>
                                    <option value='28'>28 Seats</option>
                                    <option value='29'>29 Seats</option>
                                    <option value='30'>30 Seats</option>
                                    <option value='31'>31 Seats</option>
                                    <option value='32'>32 Seats</option>
                                    <option value='33'>33 Seats</option>
                                    <option value='34'>34 Seats</option>
                                    <option value='35'>35 Seats</option>
                                    <option value='36'>36 Seats</option>
                                    <option value='37'>37 Seats</option>
                                    <option value='38'>38 Seats</option>
                                    <option value='39'>39 Seats</option>
                                    <option value='40'>40 Seats</option>
                                    <option value='41'>41 Seats</option>
                                    <option value='42'>42 Seats</option>
                                    <option value='43'>43 Seats</option>
                                    <option value='44'>44 Seats</option>
                                    <option value='45'>45 Seats</option>
                                    <option value='46'>46 Seats</option>
                                    <option value='47'>47 Seats</option>
                                    <option value='48'>48 Seats</option>
                                    <option value='49'>49 Seats</option>
                                    <option value='50'>50 Seats</option>
                                    <option value='51'>51 Seats</option>
                                    <option value='52'>52 Seats</option>
                                    <option value='53'>53 Seats</option>
                                    <option value='54'>54 Seats</option>
                                    <option value='55'>55 Seats</option>
                                    <option value='56'>56 Seats</option>
                                    <option value='57'>57 Seats</option>
                                    <option value='58'>58 Seats</option>
                                    <option value='59'>59 Seats</option>
                                    <option value='60'>60 Seats</option>
                                    <option value='61'>61 Seats</option>
                                    <option value='62'>62 Seats</option>
                                    <option value='63'>63 Seats</option>
                                    <option value='64'>64 Seats</option>
                                    <option value='65'>65 Seats</option>
                                    <option value='66'>66 Seats</option>
                                    <option value='67'>67 Seats</option>
                                    <option value='68'>68 Seats</option>
                                    <option value='69'>69 Seats</option>
                                    <option value='70'>70 Seats</option>
                                    <option value='71'>71 Seats</option>
                                    <option value='72'>72 Seats</option>
                                    <option value='73'>73 Seats</option>
                                    <option value='74'>74 Seats</option>
                                    <option value='75'>75 Seats</option>
                                    <option value='76'>76 Seats</option>
                                    <option value='77'>77 Seats</option>
                                    <option value='78'>78 Seats</option>
                                    <option value='79'>79 Seats</option>
                                    <option value='80'>80 Seats</option>
                                    <option value='81'>81 Seats</option>
                                    <option value='82'>82 Seats</option>
                                    <option value='83'>83 Seats</option>
                                    <option value='84'>84 Seats</option>
                                    <option value='85'>85 Seats</option>
                                    <option value='86'>86 Seats</option>
                                    <option value='87'>87 Seats</option>
                                    <option value='88'>88 Seats</option>
                                    <option value='89'>89 Seats</option>
                                    <option value='90'>90 Seats</option>
                                    <option value='91'>91 Seats</option>
                                    <option value='92'>92 Seats</option>
                                    <option value='93'>93 Seats</option>
                                    <option value='94'>94 Seats</option>
                                    <option value='95'>95 Seats</option>
                                    <option value='96'>96 Seats</option>
                                    <option value='97'>97 Seats</option>
                                    <option value='98'>98 Seats</option>
                                    <option value='99'>99 Seats</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-4 col-md-3 col-lg-3">
                            <div class="filter-adjast">
                                <img src="/img/driving2.png" class="filters-icon-small" alt="">
                                <select name="transmission-type-id" class="filters-select-small">
                                    <option value="1">Automatic</option>
                                    <option value="2">Manual</option>
                                    <option value="3">Tiptronic</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-4 col-md-3 col-lg-3">
                            <div class="filter-adjast">
                                <img src="/img/fuel19.png" class="filters-icon-small" alt="">
                                <select  name="fuel-type-id" class="filters-select-small">
                                    <option value="1">Benzene</option>
                                    <option value="4">Gas</option>
                                    <option value="2">Diesel</option>
                                    <option value="5">Hybrid</option>
                                    <option value="3">Electric</option>
                                </select>
                            </div>
                        </div>
                    </div>

                </div>
                <!---Specification-ENDS--->
                <!---img upload-->
                <div class="row padding-top-bot">
                    <div class="col-xs-12">
                        <h3>Şəkil yüklə</h3>
                        <div class="form-group">
                            <label for="uploadImage">6 istiqamətdən çəkilməlidir: Qabaq, Arxa, Sol tərəf, Sag tərəf, Alətlər paneli və Arxa oturacaqlar</label>
                            <input class="btn btn-default"  type="file" name="photo" multiple="multiple" >
                        </div>
                    </div>
                </div>
                <!---img upload-ENDS--->

                <!---State_Registry_number--->
                <div class="row">
                    <div class="col-xs-12 col-md-6">
                        <div class="form-group">
                            <label>Dövlət Qeydiyyət Nişanı Nömrəsi (məsələn 10-XX-123)<span class="faded-text"></span></label>
                            <input class="form-control" name="rnum" type="text"/>
                        </div>
                    </div>
                </div>

                <div class="row"><br/>
                    <div class="col-xs-12 center margin-bottom-20">
                        <h4>Buradan siz elan yerləşdirmə səhifəsinə keçəcəksiz</h4>
                    </div>
                    <div class="col-xs-offset-2 col-xs-4">

                    </div>
                    <div class="col-xs-4">
                        <input class="btn btn-success add-item-submit" type="submit" value="Əlavə et">
                    </div>
                    <br><br/>
                </div>
            </form>
        </div>
        <jsp:include page="/footer.jsp" />
        <script src="/js/bootstrap.fd.js"></script>

        <script>
            $(function () {
                $.get("/AllMakes", function (data) {
                    $("#make").html(data);
                });

                $("#make").selectmenu({
                    select: function (event, data) {
                        $("#model").html("");
                        $.getJSON("/AllModels?mid=" + data.item.value, function (res) {
                            var content;
                            $.each(res, function (key, val) {
                                content += "<option value=" + val.id + ">" + val.name + "</option>";
                            });
                            $("#model").html(content);
                        });
                    }
                });
                for (i = 2016; i > 1950; i--) {
                    $("#man-year").append("<option value='" + i + "'>" + i + "</option>");
                }
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
    </div>
</body>
</html>