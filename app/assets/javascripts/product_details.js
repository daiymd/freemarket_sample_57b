$(document).on('turbolinks:load', function() {
$(function() {
// 追加されていく箱の用意
  function appendOption(category){
    var html = `
    <option value="${ category.name }" data-category="${category.id}">${ category.name }</option>
      `
    return html;
  }
  function appendChildrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml =`        
      <div class='selects' id= 'children_wrapper'>
        <select class="selection" id="category_child-id">
          <option value="--">--</option>
          ${ insertHTML }
        </select>
        <i class="fas fa-angle-down 2x down"></i>
      </div>` 
    $('.detail-box-wrapper').append(childSelectHtml);
  } 
  function appendGrandchildrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `
      <div class='selects' id= 'grandchildren_wrapper'>
        <select class="selection" name="category" id="grandchild_category">
          <option value="--">--</option>
          ${ insertHTML }
        </select>
        <i class="fas fa-angle-down 2x down"></i>
      </div>`;
    $('.detail-box-wrapper').append(grandchildSelectHtml);
  } 
 // categoryIDにchangeイベントが発火された場合の動き
  $("#category_id").on("change",function(){
    // 空の変数用意
    var categorize = document.getElementById("category_id").value;
    // 変数にcategory_Idのvalueを入れる動き
    // categorizeが--で無かった場合
    if (categorize !== "--" ){
      $.ajax({
      url: '/products/get_category_children',
      type: "GET",
      dataType: "json",
      data: { parent_name: categorize }
    })
    // データ通信成功時の動き
    .done(function(children){
      // 子要素を消す動き。親要素はあとでチェック。
      $("#children_wrapper").remove();
      $("#grandchildren_wrapper").remove();
      $("#size_wrapper").remove();
      $("#brand_wrapper").remove();
      var insertHTML = '';
      children.forEach(function(child){
        insertHTML += appendOption(child);
      });
      appendChildrenBox(insertHTML);
    })
    .fail(function(){
      alert("セレクトボックスの表示に失敗しました");
    })
  }else{
    $('#children_wrapper').remove(); 
    $('#grandchildren_wrapper').remove();
  }
  });
    
  $('.detail-box-wrapper').on("change","#category_child-id", function(){
    // 空の変数用意
    var childId = $("#category_child-id option:selected").data("category");
    if (childId !== "--" ){
      $.ajax({
      url: '/products/get_category_grandchildren',
      type: "GET",
      dataType: "json",
      data: { child_id: childId }
    })
    // データ通信成功時の動き
    .done(function(grandchildren){
      if (grandchildren.length !== 0){
        $('#grandchildren_wrapper').remove();
        $('#size_wrapper').remove();
        $('#brand_wrapper').remove();
      // 子要素を消す動き。親要素はあとでチェック。
      var insertHTML = '';
      grandchildren.forEach(function(grandchild){
        insertHTML += appendOption(grandchild);
      });
      appendGrandchildrenBox(insertHTML);
    }
    })
    .fail(function(){
      alert("セレクトボックスの表示に失敗しました");
    })
  }else{
  $("#grandchildren_wrapper").remove();
  }
    });
  });
});