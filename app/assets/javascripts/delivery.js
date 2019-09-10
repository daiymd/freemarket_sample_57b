$(document).on('turbolinks:load', function() {

  var array1 = `
                  <option value="未定">未定</option>
                  <option value="らくらくメルカリ便">らくらくメルカリ便</option>
                  <option value="ゆうメール">ゆうメール</option>
                  <option value="レターパック">レターパック</option>
                  <option value="普通郵便(定形、定形外)">普通郵便(定形、定形外)</option>
                  <option value="クロネコヤマト">クロネコヤマト</option>
                  <option value="ゆうパック">ゆうパック</option>
                  <option value="クリックポスト">クリックポスト</option>
                  <option value="ゆうパケット">ゆうパケット</option>
                  `

  var array2 = `
                  <option value="未定">未定</option>
                  <option value="クロネコヤマト">クロネコヤマト</option>
                  <option value="ゆうパック">ゆうパック</option>
                  <option value="ゆうメール">ゆうメール</option>
                  `


  $(document).on('change', '#delivery_charge', function() {
    $('.right-box').show();
    var text = $('#delivery_charge option:selected').text();
    $("#delivery_way").empty();
    if(text == '送料込み(出品者負担)') {
      $('#delivery_way').append(array1);
    } 
    else if(text == '着払い(購入者負担)') {
      $('#delivery_way').append(array2);
      
    }  
    else
    $('.right-box').hide();
  })

})