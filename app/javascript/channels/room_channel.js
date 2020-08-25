import consumer from './consumer'

document.addEventListener('turbolinks:load', () => {
  const current_user = $('#current_user').attr('data-user-id');
  consumer.subscriptions.create({channel: 'RoomChannel', sender: current_user}, {
    connected() {},

    disconnected() {},

    received(data) {
      $('input#messenger_message').val('');
      let html = data.mine;

      const message_container = document.getElementById('user_list_messengers');
      message_container.innerHTML = message_container.innerHTML + html;
      console.log(html);
      $('#new_msg').addClass('sent_msg');
      $('div#new_msg').removeAttr('id','none');
    }
  });
})
