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
<jsp:include page="/header.jsp" />
<body class="bg-filter">
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
                    <li><a href="/home/settings.jsp">Hesab</a></li>
                    <li><a href="/home/security.jsp">Təhlükəsizlik</a></li>
                    <li class="active"><a href="/home/verifications.jsp">Kimliyin Təstiqi</a></li>
                    <li><a href="/home/payment-method.jsp">Ödəmə üsulu</a></li>
                </ul>
            </div>
            <h3 class="margin-bottom-20">Verify your identity</h3>
            <div class="row">
                <div class="col-xs-12 col-md-6">
                    Coming on further updates...
                    <hr>
                </div>

                <div class="col-xs-12 col-md-6">
                    <img style="height:80px;" class="center-block" src="../img/checkmark21-2.png">
                    <!--span class="dashboard-notes">Users with verifications are the most trusted and reliable</span-->
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