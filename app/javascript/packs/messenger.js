$( document ).ready(function() {
  $('button#msg-send-btn').click(function(event) {
    event.preventDefault();
    var messages = $('#messenger_message').val();
    var receiver = $('#receiver').val();
    var user_id =$('#current_user').attr('data-user-id');

    $('#messenger_message').val('');
    $('#user_list_messengers').append('<div class="message"><div class="sent_msg received-msg"><p>'+messages+'</p></div></div>');
    $.ajax({
      type: 'POST',
      url: '/users/' + user_id + '/messengers',
      data: {message: messages, receiver: receiver, user_id: user_id},
    });
  });
});
