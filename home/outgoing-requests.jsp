<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <link rel="icon" type="image/png" href="/img/lendock-favicon.png">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Sent Requests</title>
        <link rel="stylesheet" href="/assets/css/foundation-datepicker.min.css"/>
    </head>
    <body class="bg-filter margin-top-15">
            <jsp:include page="/header.jsp" />
        ​<c:set var="requests" scope="page" value="${requestScope.requests}" />
        <c:if test="${!empty requests}"> 
            <div class="row small-uncollapse bg-white">
                <div class="small-2 columns requests-noscroll">
                    <div class="request-1">Request</div>
                </div>
                <div class="small-6 columns messages">
                    <span class="chat-with"></span>
                    <div class="profile-link">
                        <a href="#">
                            <img src="/assets/img/avatar83.png">
                            <span>Profilə bax</span>
                        </a>
                    </div>
                </div>
                <div class="small-4 columns request-details text-center">
                    Sifariş məlumatlari
                </div>
            </div>
        </c:if>
        <div class="row">
            <script>var owners = new Array();</script>
            <div class="small-2  columns requests bg-white no-padding-lr view-80">
                <c:forEach var="request" items="${requests}" >
                    <script>owners[${request.rId}] = "${request.listing.car.owner.fName}";</script>
                    <div class="request-list" id="${request.rId}">           
                        <div class="requests-wrapper">
                            <div class="request-car-image">
                                <span class="circular-request"></span>
                            </div>
                            <div class="request-item-title">
                                ${request.listing.car.owner.fName} ${request.listing.car.owner.lName}
                            </div>
                            <c:choose>
                                <c:when test="${request.status == 0}">
                                    <div class="request-status">
                                        <font color="gray" >Qözləyir</font>
                                    </div>
                                </c:when>
                                <c:when test="${request.status == 1}">
                                    <div class="request-status">
                                        <font color="green" >Qəbul</font>
                                    </div>
                                </c:when>
                                <c:when test="${request.status == 2}">
                                    <div class="request-status">
                                        <font color="red" >İmtina</font>
                                    </div>
                                </c:when>
                            </c:choose>
                            <div class="request-date">
                                <font size="1" color="black">${request.rDate}</font>  
                            </div>
                        </div>
                    </div>  
                </c:forEach> 
            </div>
            <div class="small-6 columns bg-white view-80 message-box no-padding-lr" >
                <!-- Messaging goes here-->
                <div class="message-field" id="messages">

                </div>
                <form action="/NewMessage" method="post" name="send-message" id="send-message">
                    <div class="message-type-field">
                        <div class="row">
                            <div class="small-10 columns">
                                <input type="hidden" value="" name="rid" id="rid" >
                                <textarea id="message-text" name="message" type="text" placeholder="Get to know each other and agree on deal!" rows="2"></textarea>
                            </div>
                            <div class="small-2 columns">
                                <div class="message-send-btn">
                                    <button type="submit" class="send-btn">Göndər</button>
                                </div>
                            </div>       ​
                        </div>
                    </div>
                </form>
            </div>
            <div class="small-4 columns bg-white view-80 no-padding-lr request-details-box" id="details">
                <!-- Request details goes here-->
            </div>     
        </div>
        <script src="/assets/jquery/jquery-ui.min.js"></script>
        <script>
                        $(function () {
                            $("#send-message").hide();
                            $(".request-list").click(function () {
                                $("#rid").val($(this).attr("id"));
                                $("#details").load("/GetOutgoingRequest?rid=" + $(this).attr("id"));
                                $("#messages").load("/GetMessages?rid=" + $(this).attr("id"));
                                $(".chat-with").html("Chat with " + owners[$(this).attr("id")]);
                                $("#borrower-name").html("Chat with " + owners[$(this).attr("id")]);
                                $("#send-message").show();
                            });
                            $('form[name=send-message]').submit(function () {
                                $.post($(this).attr('action'), $(this).serialize(), function (res) {
                                    $("#messages").html(res);
                                    $("#message-text").val("");
                                    console.log(res);
                                });
                                return false;
                            });
                        });
        </script>
    </body>
</html>