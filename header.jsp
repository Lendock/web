<header>
    <link rel="icon" type="image/png" href="/img/lendock-favicon.png">
    <link rel="stylesheet" href="/css/bootstrap.css"/>
    <link rel="stylesheet" href="/css/bootstrap.offcanvas.min.css"/>
    <link rel="stylesheet" href="/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="/css/app.css"/>
    <script src="/js/vendor/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/bootstrap.offcanvas.min.js"></script>
    <link rel="stylesheet" href="/css/datepicker.css"/>
    <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script>
        function init() {
            $.getJSON("/GetAlerts", function (data) {
                console.log("Querying server for updates...");
                var uid = ${sessionScope.user.id};
                var num_messages = 0;
                var num_requests = 0;
                $.each(data, function (key, val) {
                    if (key == 'messages') {
                        $("#messagesIN").html("");
                        $.each(val, function (k, v) {
                            num_messages++;
                            if (v.senderId != uid)
                                $("#messagesIN").append("<a href='/GetAllRequests'><li class='notification-message newMessage'><div class='row'><div class='col-xs-4'><img src='/data/users/" + v.senderPhoto + "' style='height: 45px; width:45px;'class='round-photo'></div><div class='col-xs-8'><span class='notification-sender-name'>" + v.senderName + " sent you a message</span></div></li></a>");
                            else {
                                $("#messagesIN").append("<a href='/GetAllRequests'><li class='notification-message newMessage'><div class='row'><div class='col-xs-4'><img src='/data/users/" + v.senderPhoto + "' style='height: 45px; width:45px;'class='round-photo'></div><div class='col-xs-8'><span class='notification-sender-name'>" + v.senderName + " sent you a message</span></div></li></a>");
                            }
                        });
                    } else if (key == 'requests') {
                        $("#alertIN").html("");
                        $.each(val, function (k, v) {
                            num_requests++;

                            if (v.requester.id == uid && v.status == 1) {
                                $("#alertIN").append("<a href='/home/req-action.jsp?rid=" + v.rId + "'><li class='notification-message newMessage'><div class='row'><div class='col-xs-4'><img src='/data/users/" + v.listing.car.Owner.photo + "' style='height: 45px; width:45px;'class='round-photo'></div><div class='col-xs-8'><span class='notification-sender-name'>" + v.listing.car.Owner.fName + " accepted your request</span></div></li></a>");
                            }
                            if (v.requester.id == uid && v.status == 2) {
                                $("#alertIN").append("<a href='/home/req-action.jsp?rid=" + v.rId + "'><li class='notification-message newMessage'><div class='row'><div class='col-xs-4'><img src='/data/users/" + v.listing.car.Owner.photo + "' style='height: 45px; width:45px;'class='round-photo'></div><div class='col-xs-8'><span class='notification-sender-name'>" + v.listing.car.Owner.fName + " rejected your request</span></div></li></a>");
                            } else if (v.requester.id != uid) {
                                $("#alertIN").append("<a href='/GetAllRequests?request=" + v.rId + "'><li class='notification-message newMessage'><div class='row'><div class='col-xs-4'><img src='/data/users/" + v.senderPhoto + "' style='height: 45px; width:45px;'class='round-photo'></div><div class='col-xs-8'><span class='notification-sender-name'>" + v.requester.fName + " sent you a request</span></div></li></a>");
                            }

                        });
                    }
                });
                $(".badge-bar").html(num_messages + num_requests);
                $(".badge-message").html(num_messages);
                $(".badge").html(num_requests);
                $(".element").html("");
                num_requests = num_messages = 0;
                console.log(data);
            });
        }
    </script>
    <script>
        $(function () {
            init();
            setInterval(init, 4000);
        });
    </script>
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid padding0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle offcanvas-toggle" data-toggle="offcanvas" data-target="#js-bootstrap-offcanvas">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <div class="menu-logo hidden-xs">
                    <a href="/index.jsp"><img class="" src="/img/lendock-logo.png"></a>
                </div>
                <div class="menu-logo-resp visible-xs">
                    <a href="/index.jsp"><img class="" src="/img/lendock-logo.png"></a>
                </div>
            </div>
            <form action="/SearchResult" method="get">
                <div class="search-bar hidden-xs">
                    <div class="btn-group">
                        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Axtar <span class="caret"></span></button>
                        <ul class="dropdown-menu" id="header-search-form">
                            <form method="get" action="/SearchResult">
                                <div class="col-xs-6">
                                    <div class="form-group">
                                        <label for="sdate">Pick date</label>
                                        <input readonly type="text" name="date-min" class="form-control span2 no-bottom-margin" value="" id="sdateH">
                                    </div>
                                </div>
                                <div class="col-xs-6">
                                    <div class="form-group">
                                        <label for="edate">Drop date</label>
                                        <input readonly type="text" name="date-max" class="form-control span2 no-bottom-margin" value="" id="edateH">
                                    </div>
                                </div>
                                <div class="col-xs-12">
                                    <div class="form-group">
                                        <label> 
                                            <span class="azn orange-color">M</span><input readonly type="num" name="price-min" id="amount-minH" class="index-price-range" readonly style="color:#f6931f; font-weight:bold;"/>
                                            <span class="azn orange-color">M</span><input readonly type="num" name="price-max" id="amount-maxH" class="index-price-range" readonly style="color:#f6931f; font-weight:bold;"/>
                                        </label>
                                        <div id="slider-rangeH">

                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-8 col-xs-offset-2">
                                    <div class="form-group">
                                        <label></label>
                                        <input type="submit" value="Axtar" class="form-control button-submit"/>
                                    </div>
                                </div>

                            </form>
                        </ul>
                    </div>
                </div>
            </form>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <nav class="navbar navbar-default navbar-offcanvas visible-xs" role="navigation" id="js-bootstrap-offcanvas">
                <div class="slider-profile"><a href="/home/profile.jsp"><img class="round-photo" src="/data/users/${sessionScope.user.photo}"><span>${sessionScope.user.fName} ${sessionScope.user.lName}</span></a>
                </div>
                <ul>
                    <li><a href="/index.jsp">Home</a></li>
                    <li><hr></li>
                    <li><a href="/GetOutgoingRequests">Sifarişlərim</a></li>
                    <li><a href="/GetAllRequests">Mesajlar <span class="badge-message">0</span></a></li>
                    <li><a href="/GetAlerts">Bildirişlər <span class="badge">0</span></a></li>
                    <li><hr></li>
                    <li><a href="/GetWishlist">Wishlist</a></li>
                    <li><a href="/home/profile.jsp">Profil</a></li>
                    <li><a href="/home/settings.jsp">Parameterlər</a></li>
                    <li><a href="#">Yardım</a></li>
                    <li><a href="/LogoutServlet">Sistemdən çıxış</a></li>
                </ul>             
            </nav> 
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right no-margin-left" >
                    <li class="bar-section">
                        <a class="padding0" href="/GetOutgoingRequests">
                            <div class="bar-icon">
                                <img src="/img/borrow-icon.png">
                            </div>
                            <div class="navt">
                                My Borrowings
                            </div>
                        </a>
                    </li>
                    <li id="messagesDown" class="bar-section dropdown">
                        <a id="dLabel" href="#" class="dropdown-toggle padding0" data-toggle="dropdown" role="button"
                           data-target="#" aria-haspopup="true"
                           aria-expanded="false">
                            <div class="bar-icon">
                                <span class="badge-bar">0</span>
                                <img src="/img/messages.png">
                            </div>
                            <div class="navt">
                                Notifications<span class="caret"></span>
                            </div>
                        </a>
                        <ul id="notificationTabs" class="dropdown-menu" role="menu" aria-labelledby="dLabel">
                            <ul class="nav nav-tabs nav-justified">
                                <li class="notification-tab"><a href="#messages" data-toggle="tab">Messages <span class="badge-message">0</span></a></li>
                                <li class="notification-tab"><a href="#alert" data-toggle="tab">Alerts <span class="badge">0</span></a></li>
                            </ul>
                            <div class="tab-content">
                                <div id="messages" class="tab-pane fade in active">
                                    <ul class="padding0 ul-scroll" id="messagesIN">
                                        No messages

                                    </ul>
                                </div>
                                <div id="alert" class="tab-pane fade">
                                    <ul class="padding0 ul-scroll" id="alertIN">
                                        No
                                    </ul>
                                </div>
                            </div>
                        </ul>
                    </li>
                    <li class="bar-section dropdown">
                        <a href="#" class="dropdown-toggle padding0" data-toggle="dropdown" role="button"
                           aria-haspopup="true"
                           aria-expanded="false">
                            <div class="bar-icon">
                                <img src="/img/user.png">
                            </div>
                            <div class="navt">
                                Profile<span class="caret"></span>
                            </div>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="/GetWishlist">Wishlist</a></li>
                            <li><a href="/AllMyCars">Dock</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="/home/profile.jsp">Profile</a></li>
                            <li><a href="/home/settings.jsp">Settings</a></li>
                            <li><a href="#">Help</a></li>
                            <li><a href="/LogoutServlet">Sign Out</a></li>
                        </ul>
                    </li>
                    <li class="bar-section-green">
                        <a class="padding0" href="/home/add-listing.jsp">
                            <div class="bar-icon">
                                <img src="/img/add_item.png">
                            </div>
                            <div class="navtw">
                                Add Car                              
                            </div>
                        </a>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
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
            $("#sdateH").datepicker({
                dateFormat: "dd.mm.yy",
                minDate: new Date(),
                showAnim: "clip",
                hideIfNoPrevNext: true,
                duration: "fast",
                defaultDate: 0,
                onClose: function (selectedDate) {
                    $("#edateH").datepicker("option", "minDate", selectedDate);
                }
            });
            $("#edateH").datepicker({
                dateFormat: "dd.mm.yy",
                showAnim: "clip",
                hideIfNoPrevNext: true,
                duration: "fast",
                defaultDate: 0,
                minDate: new Date(),
                onClose: function (selectedDate) {
                    $("#sdateH").datepicker("option", "maxDate", selectedDate);
                }
            });
        });

    </script>
    <script>
        $(function () {
            $("#slider-rangeH").slider({
                range: true,
                min: 0,
                max: 1000,
                values: [0, 1000],
                slide: function (event, ui) {
                    $("#amount-minH").val(ui.values[0]);
                    $("#amount-maxH").val(ui.values[1]);
                }
            });
            $("#amount-minH").val($("#slider-rangeH").slider("values", 0));
            $("#amount-maxH").val($("#slider-rangeH").slider("values", 1));
        });
    </script>
</header>
<script type="text/javascript">
    (function () {
        var s = document.createElement("script");
        s.type = "text/javascript";
        s.async = true;
        s.src = '//api.usersnap.com/load/' +
                'b9479e10-4f77-4acb-b20a-cfa5c874c40d.js';
        var x = document.getElementsByTagName('script')[0];
        x.parentNode.insertBefore(s, x);
    })();
</script>