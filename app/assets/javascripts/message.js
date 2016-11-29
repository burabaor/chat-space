$(function() {
  function buildHTML(message) {
    var html = [
      '<div class="message">',
        '<div class="message__detail">',
          '<span class="message__user-name">',
            message.user_name,
          '</span>',
          '<span class="message__sended-date">',
            message.created_at,
          '</span>',
        '</div>',
        '<span class="message_content">',
          message.body,
        '</span>',
      '</div>'
    ].join("");
    return html;
  }

  $('#new_message').on('submit', function(e) {
    e.preventDefault();
    var textField = $('.new-message__input-form');
    var message = textField.val();
    var url = $('.new-message').attr('action') + '.json'
    $.ajax({
      type: 'POST',
      url: url,
      data: {
        message: {
          body: message
        }
      },
      dataType: 'json'
    })
    .done(function(data) {
      var html = buildHTML(data);
      $('.chat-body').append(html);
      textField.val('');
    })
    .fail(function() {
      alert('error');
    });
  });
});
