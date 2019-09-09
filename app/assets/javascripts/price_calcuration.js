$(function() {
  $('.input_price').on("keyup",function(){
    var inputPrice = $(this).val();
    console.log(inputPrice)
    if (inputPrice >= 300 && inputPrice <= 9999999) {
      var commission =  Math.floor(inputPrice * 0.1);
      var calculated_commission =  Math.floor(inputPrice * 0.1).toLocaleString();
      var profit = Math.floor(inputPrice - commission);
      var calculated_profit = profit.toLocaleString();
      $('#sales_charge').text("¥ "+calculated_commission);
      $('#profit').text("¥"+calculated_profit);
    }
    else {
      $('#sales_charge').text("-");
      $('#profit').text("-");
    } 
  })
});