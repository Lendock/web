<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <c:choose>
            <c:when test="${!empty sessionScope.user}">
                <jsp:include page="/header.jsp" />
            </c:when>
            <c:otherwise>
                <jsp:include page="/header-no-login.jsp" />
            </c:otherwise>
        </c:choose>
        <script>
            function validate(){
                if($('#newPass2').val() !== $('#newPass').val() && $('#newPass2').val()!=''){
                        $('#newPass2').css('border-color', 'red');
                        return false;
                    }else if($('#newPass2').val() == $('#newPass').val() && $('#newPass2').val()!=''){
                        $('#newPass2').css('border-color', 'green');
                        return true;
                    }else if($('#newPass2').val()=='' && $('#newPass').val()==''){
                        $('#newPass2').css('border-color', 'red');
                        $('#newPass').css('border-color', 'red');
                        return false;
                    }
            }
            </script>
        <script>
            $(function(){
                $('#newPass2').keyup(validate);
                $('#newPass').keyup(validate);
                $('#submit').click(validate);
            });
        </script>
        <div class="container">
            <div class="row margin-top-65">
                <div class="col-sm-3 col-md-2">
                    <ul class="nav nav-pills nav-stacked dashboard-tabs" id="example-vert-tabs">
                        <li class="tabs-title"><a href="/home/profile.jsp"><img class="tabs-icons" src="../img/profile.png"><br>Profile</a>
                        </li>
                        <li class="tabs-title"><a href="/GetOutgoingRequests"><img class="tabs-icons"
                                                                                   src="../img/borrow-icon.png"><br>My
                                Borrowings</a></li>
                        <li class="tabs-title"><a href="/AllMyCars"><img class="tabs-icons"
                                                                         src="../img/vehicle.png"><br>Dock</a></li>
                        <li class="tabs-title"><a href="/GetWishlist"><img class="tabs-icons" src="../img/wishlist.png"><br>Wishlist</a>
                        </li>
                        <li class="tabs-title active"><a href="/home/settings.jsp"><img class="tabs-icons" src="../img/tool-white.png"><br>Settings</a>
                        </li>
                    </ul>
                </div>
                <div class="col-sm-9 col-md-10">
                    <div class="row">
                        <ul class="nav nav-pills nav-justified tabs-border">
                            <li><a href="/home/settings.jsp">Hesab</a></li>
                            <li class="active"><a href="/home/security.jsp">Təhlükəsizlik</a></li>
                            <li><a href="/home/verifications.jsp">Kimliyin Təstiqi</a></li>
                            <li><a href="/home/payment-method.jsp">Ödəmə üsulu</a></li>
                        </ul>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 col-md-6">
                            <h3 class="margin-bottom-20">Şifrə yenilə</h3>
                            <form action="/UpdatePassword" method="post">
                                <div class="form-group">
                                    <label for="currentPass">Hazırki şifrə</label>
                                    <input name="current-password" type="password" class="form-control" id="currentPass" placeholder="Şifrə">
                                </div>
                                <div class="form-group">
                                    <label for="newPass">Yeni şifrə</label>
                                    <input name="new-password" type="password" class="form-control" id="newPass" placeholder="yeni şifrə">
                                </div>
                                <div class="form-group">
                                    <label for="newPass2">Şifrəni təsdiqlə</label>
                                    <input type="password" class="form-control" id="newPass2" placeholder="şifrəni təsdiqlə">
                                </div>
                                <button type="submit" id="submit" class="btn btn-success">Şifrəni yenilə</button>
                            </form>
                        </div>
                        <div class="col-xs-12 col-md-6">
                            <img class="center-block dashboard-notes-img" src="../img/password13.png">
                            <span class="dashboard-notes margin-30">Keep your password safe!</span>
                            <span class="dashboard-notes">Parol ən azı 8 simvoldan ibarət olmalıdır. Hərf, rəqəm və xüsusi simvollardan istifadə edin.</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--**** Modal ****-->
        <div class="modal fade" id="deleteCar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Do you really want to delete car?</h4>
                    </div>
                    <div class="modal-body">
                        After pressing delete your car and all related <strong>listings</strong> will be removed!
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                        <button type="button" class="btn btn-danger">Delete</button>
                    </div>
                </div>
            </div>
        </div>
        <!--**** Modal ENDS ****-->
        <jsp:include page="/footer.jsp" />
    </body>
</html>