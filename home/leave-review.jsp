<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Lendock</title>
    </head>
    <body class="margin-top-65">
        <jsp:include page="/header.jsp" />
        <div class="container">
            <div class="row" id="post-review-box">
                <div class="col-xs-12"><h4>Leave review to</h4></div>
                <div class="col-xs-3 col-sm-2">
                    <a href="#"><img class="circular-borrowers" src=""></a>
                </div>
                <div class="col-xs-4 col-sm-4">
                    <div class="lender-name">
                        <a href="#" id="user">Ramiz Ismayilov</a>
                    </div>
                    <div class="request-borrower-rating">
                        <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
                    </div>
                    <div class="listing-name">

                    </div>
                </div>
                <div class="col-xs-12 col-md-12">
                    <form accept-charset="UTF-8" action="/NewReview" method="post">
                        <input type="hidden" name="listing" id="listing" value="" >
                        <textarea class="form-control animated" cols="50" id="new-review" name="comment" placeholder="Enter your review here..." rows="5"></textarea>
                        <div class="text-right">
                            <div class="stars starrr" data-rating="0"></div>
                            <div><input type="text" name="rating" size="3" /></div>
                            <div class="text-muted">Your review will be publicly visible at Lender profile</div>
                            <button class="btn btn-success btn-lg" type="submit">Send Review</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
<jsp:include page="/footer.html" />
    <script src="js/owl.carousel.min.js"></script>
    <script>
        $(function(){
            $.getJSON("/GetRequest?rid=" + "${param.rid}", function (data) {
                    $(".circular-borrowers").attr("src", "/data/users/" + data.listing.car.Owner.photo);
                    $("#user").html(data.listing.car.Owner.fName + " " + data.listing.car.Owner.lName);    
                    $(".listing-name").html(data.listing.car.Model.make.name + " " + data.listing.car.Model.name);
                    $("#listing").val(data.listing.listingId);
                });
        });
    </script>
    <script>
        var __slice = [].slice;
        (function (e, t) {
            var n;
            n = function () {
                function t(t, n) {
                    var r, i, s, o = this;
                    this.options = e.extend({}, this.defaults, n);
                    this.$el = t;
                    s = this.defaults;
                    for (r in s) {
                        i = s[r];
                        if (this.$el.data(r) != null) {
                            this.options[r] = this.$el.data(r)
                        }
                    }
                    this.createStars();
                    this.syncRating();
                    this.$el.on("mouseover.starrr", "span", function (e) {
                        return o.syncRating(o.$el.find("span").index(e.currentTarget) + 1)
                    });
                    this.$el.on("mouseout.starrr", function () {
                        return o.syncRating()
                    });
                    this.$el.on("click.starrr", "span", function (e) {
                        return o.setRating(o.$el.find("span").index(e.currentTarget) + 1)
                    });
                    this.$el.on("starrr:change", this.options.change)
                }
                t.prototype.defaults = {
                    rating: void 0,
                    numStars: 5,
                    change: function (e, t) {
                        console.log(num)
                    }
                };
                t.prototype.createStars = function () {
                    var e, t, n;
                    n = [];
                    for (e = 1, t = this.options.numStars; 1 <= t ? e <= t : e >= t; 1 <= t ? e++ : e--) {
                        n.push(this.$el.append("<span class='fa .fa-star-o'></span>"))
                    }
                    return n
                };
                t.prototype.setRating = function (e) {
                    if (this.options.rating === e) {
                        e = void 0
                    }
                    this.options.rating = e;
                    this.syncRating();
                    return this.$el.trigger("starrr:change", e)
                };
                t.prototype.syncRating = function (e) {
                    var t, n, r, i;
                    e || (e = this.options.rating);
                    if (e) {
                        for (t = n = 0, i = e - 1; 0 <= i ? n <= i : n >= i; t = 0 <= i ? ++n : --n) {
                            this.$el.find("span").eq(t).removeClass("fa-star-o").addClass("fa-star")
                        }
                    }
                    if (e && e < 5) {
                        for (t = r = e; e <= 4 ? r <= 4 : r >= 4; t = e <= 4 ? ++r : --r) {
                            this.$el.find("span").eq(t).removeClass("fa-star").addClass("fa-star-o")
                        }
                    }
                    if (!e) {
                        return this.$el.find("span").removeClass("fa-star").addClass("fa-star-o")
                    }
                };
                return t
            }();
            return e.fn.extend({
                starrr: function () {
                    var t, r;
                    r = arguments[0], t = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
                    return this.each(function () {
                        var i;
                        i = e(this).data("star-rating");
                        if (!i) {
                            e(this).data("star-rating", i = new n(e(this), r))
                        }
                        if (typeof r === "string") {
                            return i[r].apply(i, t)
                        }
                    })
                }
            })
        })(window.jQuery, window);
        $(function () {
            return $(".starrr").starrr()
        })
    </script>
</body>
</html>