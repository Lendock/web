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

<body class="bg-filter"><jsp:include page="/header.jsp" />
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
                <li class="tabs-title"><a href="/GetWishlist"><img class="tabs-icons" src="../img/wishlist.png"><br>Wishlist</a>
                </li>
                <li class="tabs-title active"><a href="/home/settings.jsp"><img class="tabs-icons"
                                                                           src="../img/tool-white.png"><br>Tənzimləmələr</a>
                </li>
            </ul>
        </div>
        <div class="col-sm-9 col-md-10">
            <div class="row">
                <ul class="nav nav-pills nav-justified tabs-border">
                    <li><a href="settings.html">Hesab</a></li>
                    <li><a href="/home/security.jsp">Təhlükəsizlik</a></li>
                    <li><a href="verifications.jsp">Kimliyin Təstiqi</a></li>
                    <li class="active"><a href="payment-method.jsp">Ödəmə üsulu</a></li>
                </ul>
            </div>
            <h3 class="margin-bottom-20">Payment methods</h3>
            <div class="row">
                <div class="col-xs-12 col-md-8">
                    Coming on further updates...
                    <hr>
                    <form class="form-horizontal" role="form">
                        <fieldset>
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="card-holder-name">Name on Card</label>
                                <div class="col-sm-9">
                                    <input disabled type="text" class="form-control" name="card-holder-name"
                                           id="card-holder-name" placeholder="Card Holder's Name">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="card-number">Card Number</label>
                                <div class="col-sm-9">
                                    <input disabled type="text" class="form-control" name="card-number" id="card-number"
                                           placeholder="Debit/Credit Card Number">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="expiry-month">Expiration Date</label>
                                <div class="col-sm-9">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <select disabled class="form-control col-sm-2" name="expiry-month"
                                                    id="expiry-month">
                                                <option>Month</option>
                                                <option value="01">Jan (01)</option>
                                                <option value="02">Feb (02)</option>
                                                <option value="03">Mar (03)</option>
                                                <option value="04">Apr (04)</option>
                                                <option value="05">May (05)</option>
                                                <option value="06">June (06)</option>
                                                <option value="07">July (07)</option>
                                                <option value="08">Aug (08)</option>
                                                <option value="09">Sep (09)</option>
                                                <option value="10">Oct (10)</option>
                                                <option value="11">Nov (11)</option>
                                                <option value="12">Dec (12)</option>
                                            </select>
                                        </div>
                                        <div class="col-xs-3">
                                            <select disabled class="form-control" name="expiry-year">
                                                <option value="16">2016</option>
                                                <option value="17">2017</option>
                                                <option value="18">2018</option>
                                                <option value="19">2019</option>
                                                <option value="20">2020</option>
                                                <option value="21">2021</option>
                                                <option value="22">2022</option>
                                                <option value="23">2023</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="cvv">Card CVV</label>
                                <div class="col-sm-3">
                                    <input type="text" disabled class="form-control" name="cvv" id="cvv"
                                           placeholder="Security Code">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-3 col-sm-9">
                                    <button disabled type="button" class="btn btn-success">Save now</button>
                                </div>
                            </div>
                        </fieldset>
                    </form>
                </div>
                <div class="col-xs-12 col-md-4">
                    <img class="center-block" src="../img/payment-method-dark.png">
                    <span class="dashboard-notes">Save payment methods and perform payment within few clicks</span>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/footer.jsp" />
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