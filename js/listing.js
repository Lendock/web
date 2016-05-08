/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


Date.prototype.addDays = function(days) {
    var dat = new Date(this.valueOf())
    dat.setDate(dat.getDate() + days);
    return dat;
}
function getDates(startDate, stopDate) {
    var dateArray = new Array();
    var currentDate = startDate;
    while (currentDate <= stopDate) {
        dateArray.push(currentDate.toString());
        currentDate = currentDate.addDays(1);
    }
    return dateArray;
}
currencySign = "$";
function calculateDays() {
    if (
        $("#to").datepicker("getDate") === null || $("#from").datepicker("getDate") === null
    ) {

    } else {
        var startDate = $("#from").datepicker("getDate");
        var endDate = $("#to").datepicker("getDate");
        var oneDay = 24 * 60 * 60 * 1000; // hours*minutes*seconds*milliseconds
        var diffDays = Math.round(Math.abs((startDate.getTime() - endDate.getTime()) / (oneDay))) + 1;
        $("#days").html(diffDays);
        $("#total-price").html(diffDays * listing_price + currencySign);
    }
}
var disableddates = new Array();
var dateArray = getDates(new Date().addDays(2), new Date().addDays(7));
for (i = 0; i < dateArray.length; i++) {
    var tmpDate = new Date(dateArray[i]);
    disableddates.push(jQuery.datepicker.formatDate('dd-mm-yy', tmpDate));
}

function DisableSpecificDates(date) {
    var string = jQuery.datepicker.formatDate('dd-mm-yy', date);
    return [disableddates.indexOf(string) == -1];
}
