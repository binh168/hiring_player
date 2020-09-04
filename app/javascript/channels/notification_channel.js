import consumer from './consumer'

consumer.subscriptions.create('NotificationChannel', {
  connected() {},

  disconnected() {},

  received(data) {
    if(data.type == 'Comment') {
      $('textarea#comment_comment').val('');

      const comment_container = document.getElementById('media-list');
      comment_container.insertAdjacentHTML('afterbegin', data.comment_view);
    }

    var $counter = document.getElementById(`counter_${data.receiver}`);
    var val = parseInt($counter.innerHTML);
    val++;
    $counter.innerHTML = val;
  }
});
