// インクリメンタルサーチでユーザーの候補を表示
$(function() {
  function buildHTML(user) {
    var html =
      '<div class="chat-group-user">' +
        '<span name="' + user.id + '">' +
          user.name +
        '</span>' +
        '<a class="user-search-result__btn">追加</a>' +
      '</div>';
    return html;
  }
  $('#user-search-field').on('keyup', function() {
    var textField = $('#user-search-field');
    var name = textField.val();
    $.ajax({
      type: 'GET',
      url: '/users.json',
      data: {
        input: name
      },
      dataType: 'json'
    })
    .done(function(data) {
      $('#user-search-result').empty();
      $.each(data,function(i, user){
        var html = buildHTML(user);
        $('#user-search-result').append(html);
      });
    });
  });
});

$(function() {
// hidden_fieldのuser_idsのvalueをセッティング
  function insert_user_ids() {
    var member_elements = $('#chat-group-users span');
    $('.group_user_ids').remove();
    $.each(member_elements, function(i, ele) {
      var user_id = $(ele).attr('name');
      $('#chat-group-users').append(
        '<input type="hidden" class="group_user_ids" name="group[user_ids][]" value="' + user_id + '">'
      );
    });
  }

// 候補から選択されたユーザーをチャットメンバーに表示
  function buildHTML(name, id) {
    var html =
      '<div class="chat-group-user">' +
        '<span name="' + id + '">' +
          name +
        '</span>' +
        '<a class="chat-group-user__remove-btn">削除</a>' +
      '</div>';
    return html;
  }
  $('#user-search-result').on('click', '.user-search-result__btn' ,function() {
    var brother_ele = $(this).prev();
    var name = brother_ele.text();
    var id   = brother_ele.attr('name');
    var user_html = buildHTML(name, id);
    $('#chat-group-users').append(user_html)
    $(this).parent().remove();
    insert_user_ids();
  });

// 仮のチャットメンバーからユーザーを削除
  $('#chat-group-users').on('click', '.chat-group-user__remove-btn', function() {
    user_html = $(this).parent();
    user_html.remove();
    insert_user_ids();
  })
})
