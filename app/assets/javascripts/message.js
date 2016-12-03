$(function() {
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

  $('#new_message').on('submit', function(e) {
    e.preventDefault();
    var $form = $('form#new_message').get(0);
    var fd = new FormData($form);
    var url = location.href + '.json';
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
