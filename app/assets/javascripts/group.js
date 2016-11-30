$(function() {
  function buildHTML(user) {
    var html =
      '<div class="chat-group-user">' +
        '<span>' +
          user.name +
        '</span>' +
        '<a>追加</a>' +
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
    })
  });
});
