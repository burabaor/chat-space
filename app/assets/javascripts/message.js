$(function() {
  $('.new-message__submit-button').on('click', function(e) {
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
    })
    .fail(function() {
    });
  });
});
