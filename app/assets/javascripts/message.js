$(function() {
  var url = location.href + ".json";

  // メッセージのhtmlテンプレート
  function buildHTML(message) {
    if (!message.image.url) message.image.url = "";
    var html =
      '<div class="message">' +
        '<div class="message__detail">' +
          '<span class="message__user-name">' +
            message.user_name +
          '</span>' +
          '<span class="message__sended-date">' +
            message.created_at +
          '</span>' +
        '</div>' +
        '<span class="message_content">' +
          message.body +
        '</span>' +
        '<img src="' + message.image.url + '">' +
      '</div>';
    return html;
  }

  // 自動更新のセッティング
  if(location.href.match(/messages/))
    setInterval(function() {
      $.ajax({ url: url })
      .done(function(data) {
        $('.chat-body').empty();
        $(data).each(function(i, message) {
          var html = buildHTML(message);
          $('.chat-body').append(html);
        });
      });
    } ,10000);

  // メッセージ作成の非同期通信処理
  $('#new_message').on('submit', function(e) {
    e.preventDefault();
    var $form = $('form#new_message').get(0);
    var fd = new FormData($form);
    $.ajax({
      type: 'POST',
      url: url,
      data: fd,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data) {
      var html = buildHTML(data);
      $('.chat-body').append(html);
      $('#message_body').val('');
      $('#message_image').val();
    })
    .fail(function() {
      alert('error');
    });
  });
});
