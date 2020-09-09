$(document).ready(function(){
  $('#game-update, .edit_player').change(function(){
    var url = '/ranks';
    var game = $('#player_game_id').val();
    $.ajax({
      url: url,
      type: 'GET',
      data: {game: game}
    });
  });
})
