// インクリメンタルサーチでユーザーの候補を表示
$(function() {
  function buildHTML(user) {
    var html =
      '<div class="chat-group-user">' +
        '<span>' +
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

// 候補から選択されたユーザーをチャットメンバーに表示
$(function() {
  function buildHTML(user) {
    var html =
      '<div class="chat-group-user">' +
        '<span>' +
          user.name +
        '</span>' +
        '<a class="chat-group-user__remove-btn">削除</a>' +
      '</div>';
    return html;
  }
  $('#user-search-result').on('click', '.user-search-result__btn' ,function() {
    user = $(this).prev().text();
    var user_html = buildHTML(user);
    $('#chat-group-users').append(user_html)
  });
});

// 仮のチャットメンバーからユーザーを削除
$(function() {
  $('#chat-group-users').on('click', '.chat-group-user__remove-btn', function() {
    user_html = $(this).parent();
    user_html.remove();
  })
})
