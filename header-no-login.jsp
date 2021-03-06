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
            <nav class="navbar navbar-default navbar-offcanvas visible-xs" role="navigation" id="js-bootstrap-offcanvas">
                <div class="slider-profile"><a href="/index.jsp"><img src="/img/lendock-logo-1.png"></a>
                </div>
                <ul>
                    <li><a href="/index.jsp">Ana səhifə</a></li>
                    <li><a href="/login.jsp">Giriş</a></li>
                    <li><hr></li>
                    <li><a href="#">Yardım</a></li>
                </ul>             
            </nav> 

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right no-margin-left">
                    <li class="bar-section">
                        <a class="padding0" href="/login.jsp">
                            <div class="bar-icon">
                                <img src="/img/login.png">
                            </div>
                            <div class="navt">
                                Giriş
                            </div>
                        </a>
                    </li>
                    <li class="bar-section-green">
                        <a class="padding0" href="/signup.jsp">
                            <div class="bar-icon">
                                <img src="/img/signup.png">
                            </div>
                            <div class="navtw">
                                Qeydiyyadan keç                             
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
    </script>
</header>
<script type="text/javascript">
(function() {
var s = document.createElement("script");
s.type = "text/javascript";
s.async = true;
s.src = '//api.usersnap.com/load/'+
       'b9479e10-4f77-4acb-b20a-cfa5c874c40d.js';
var x = document.getElementsByTagName('script')[0];
x.parentNode.insertBefore(s, x);
})();
</script>