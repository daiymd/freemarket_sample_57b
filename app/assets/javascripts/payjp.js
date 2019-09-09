$(document).on('turbolinks:load', function() {
  var form = $("#charge-form");
  Payjp.setPublicKey('pk_test_94e53a2002839739764bb9bb');

  $("#token_submit").on("click",function(e){
    e.preventDefault();
    form.find("input[type=submit]").prop("disabled", true);
    var card = {
        number: parseInt($("#card_number").val()),
        cvc: parseInt($("#payment_card_cvc").val()),
        exp_month: parseInt($("#month").val()),
        exp_year: parseInt($("#year").val())
    };
    Payjp.createToken(card, function(s, response) {
      if (response.error) {
        alert('トークン作成エラー発生');
      }
      else {
        $("#card_number").removeAttr("name");
        $("#payment_card_cvc").removeAttr("name");
        $("#month").removeAttr("name");
        $("#year").removeAttr("name");

        var token = response.id;
        form.append($('<input type="hidden" name="payjpToken" />').val(token));
        form.get(0).submit();
        window.location
      }
    });
  });
});

