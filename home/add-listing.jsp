<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
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
                <h1 class="center">Create Your Listing</h1>
                <h2 class="center">Lendock provides opportunity for everyone to earn money. Just list your vehicle and wait for requests. The more you share your listing on Social Media, the faster you get the requests.</h2>
                <!---Title--->

                <div class="row padding-top-bot">
                    <div class="col-xs-12 col-md-6">
                        <div class="form-group">
                            <label for="manufacter">Select vehicle from Garage <span class="faded-text"></span></label>
                            <select id="cars" name="cars" class="form-control">
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-md-6">
                        <label>Set price for listing<span class="faded-text"></span></label>
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
                <!---Description--->
                <div class="row padding-top-bot">
                    <div class="col-xs-12 col-md-6">
                        <div class="form-group">
                            <label>Description<span class="faded-text"> 500 Characters Left</span></label>
                            <textarea name="about" class="form-control" rows="3"></textarea>
                            <p class="faded-text">Add information about your listing. The more info you provide about it, the bigger chances to attract clients. DO NOT WRITE YOUR CONTACT INFO HERE</p>
                        </div>
                    </div>

                
                <!---Description-ENDS--->
                
                    <div class="col-xs-12 col-md-6">
                        <div class="form-group">
                            <label>Check only if this is car is suitable for wedding</label><br>
                            <label><input type="checkbox" name="for-wedding" value="true" class=""/> For wedding</label>
                        </div>
                    </div>
                </div>
                <div class="row"><br/>
                    <div class="medium-offset-2 medium-7 column center medium-centered">
                        <h5>Press Submit to make your listing online.</h5>
                    </div>
                    <div class="col-xs-offset-2 col-xs-4">
                        
                    </div>
                    <div class="col-xs-4">
                        <button class="btn btn-success add-item-submit">Submit</button>
                    </div>
                    <br><br/>
                    <p class="text-muted">Lendock has right to deactivate your listing if it doesn't follow the website rules. More info</p>
                </div>
            </div>
<jsp:include page="/footer.html" />
    </body>
</html>