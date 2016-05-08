<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Lendock</title>
    <link rel="stylesheet" href="/assets/css/foundation-flex.css"/>
</head>
<%@ include file="/header.html" %>
<body class="bg-filter">
    <c:set var="lsitings" scope="page" value="${sessionScope.listings}" />
<div class="row collapse margin-top-15">
    <div class="medium-2 columns">
        <ul class="tabs vertical dashboard-tabs" id="example-vert-tabs">
            <li class="tabs-title"><a href="/home/profile.jsp">Profile</a></li>
            <li class="tabs-title"><a href="/home/borrowings.jsp">My Borrowings</a></li>
            <li class="tabs-title is-active"><a href="/AllListings" aria-selected="true">Dock</a></li>
            <li class="tabs-title"><a href="/home/wishlist.jsp">Wishlist</a></li>
            <li class="tabs-title"><a href="/home/settings.jsp">Settings</a></li>
        </ul>
    </div>
    
    <div class="medium-10 columns">
        <div class="tabs-content vertical" data-tabs-content="example-vert-tabs">
            <div class="tabs-panel is-active">
                <div class="row dashboard-horizontal-tabs align-center">
                    <ul class="tabs tabs-no-border" id="draft-listed">
                        <li class="tabs-title"><a href="/AllListings" class="horizontal-tabs-style">Listed</a></li>
                        <li class="tabs-title is-active"><a href="draft.jsp" class="horizontal-tabs-style" aria-selected="true">Draft</a></li>
                    </ul>
                </div>
                <div class="tabs-content" data-tabs-content="draft-listed">
                    <div class="tabs-panel is-active">
                        <div class="text-center">
                            <div class="row">
                                <div class="small-4 column">
                                    Item
                                </div>
                                <div class="small-4 column">
                                    Details
                                </div>
                                <div class="small-4 column">
                                    Status
                                </div>
                            </div>
                            <c:if test="{!empty listings}">
                            <c:forEach items="${listings}" var="listing" >
                            <div class="row align-middle">
                                <div class="small-12 columns"><hr></div>
                                <div class="small-4 column right-border">
                                    ${lsiting.title}
                                    <img class="borrowing-img" src="lsiting.photo">
                                </div>
                                <div class="small-4 column right-border">
                                    <a class="button" href="#">Continue Editing</a>
                                </div>
                                <div class="small-4 column">
                                    <span class="blue-color">Draft</span>
                                </div>
                            </div>
                            </c:forEach>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</div>
<script src="/assets/js/vendor/jquery.min.js"></script>
<script src="/assets/js/vendor/what-input.min.js"></script>
<script src="/assets/js/foundation.min.js"></script>
<script src="/assets/js/app.js"></script>
</body>
</html>