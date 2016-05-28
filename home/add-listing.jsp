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
    <body class="f8-bg">
        <jsp:include page="/header.jsp" />
        <script src="/assets/jquery/jquery-ui.min.js"></script>
                <script>
            $(function () {
                $.get("/MyCars", function (data) {
                    $("#cars").html(data);
                });
            });
        </script>
        <form action="/NewListing" method="post">
            <div class="container margin-top-65">
                <h2 class="center">Elan əlavə et</h1>
                <h5 class="center">NV icarə etməklə sizin pul qazanma imkanınız olacaq. NV daxil edin, və icarəyə verməyə başlayın. Sosial Mediada paylaşsaz, onda sifarişləri daha tez əldə edə bilərsiniz.</h2>
                <!---Title--->

                <div class="row padding-top-bot">
                    <div class="col-xs-12 col-md-6">
                        <div class="form-group">
                            <label for="manufacter">NV seçin <span class="faded-text"></span></label>
                            <select id="cars" name="cars" class="form-control">
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-md-6">
                        <label>Qiymət (günlük)<span class="faded-text"></span></label>
                        <div class="form-group">
                            <label class="sr-only" for="exampleInputAmount">Amount (in dollars)</label>
                            <div class="input-group">
                                <div class="input-group-addon azn">M</div>
                                <input name="price" type="text" class="form-control" id="exampleInputAmount" placeholder="Amount">
                                <div class="input-group-addon">.00</div>
                            </div>
                        </div>
                    </div>
                </div>
                <!---Title-ENDS--->
                
                <div class="row padding-top-bot">
                    <div class="col-xs-12 col-md-6">
                        <div class="form-group">
                            <label>Məlumat<span class="faded-text"> 500 Characters Left</span></label>
                            <textarea name="about" class="form-control" rows="3"></textarea>
                            <p class="faded-text">Elan haqda məlumat verin. ƏLAQƏ MƏLUMATLARINI BURADA QEYD ETMƏK OLMAZ</p>
                        </div>
                    </div>
                
                    <div class="col-xs-12 col-md-6">
                        <div class="form-group">
                            <label>Əlavə</label><br>
                            <label><input type="checkbox" name="for-wedding" value="true" class=""/> Toy üçün</label>
                        </div>
                    </div>
                </div>
                <div class="row"><br/>
                    <div class="medium-offset-2 medium-7 column center medium-centered">
                        
                    </div>
                    <div class="col-xs-3">
                        
                    </div>
                    <div class="col-xs-4">
                        <button class="btn btn-success add-item-submit">Əlavə et</button>
                    </div>
                    <br><br><br><br><br>
                    <p class="text-muted">NV platformanın qaydalarına uyğun olmadığı halda Lendock elanı deaktiv etmək hüququna malikdir. Ətraflı</p>
                </div>
            </div>
<jsp:include page="/footer.jsp" />
    </body>
</html>