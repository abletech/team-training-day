$(function() {
  function reset_game() {
    $('.active').removeClass('active');
    $('tr#player1_strip td').first().addClass('active');
    $('tr#player2_strip td').first().addClass('active');
  }

  function update_player_position(id, speed) {
    activeCell = $('tr#' + id + '_strip td.active');

    activeCell.next().addClass('active');
    activeCell.removeClass('active');

    if ($('tr#' + id + '_strip td').last().hasClass('active')) {
      alert(id + ' won the game!');
      reset_game();
    }
  }

  $(document).on('keyup', function(event) {
    if (event.which == 39)
      update_player_position('player1', 1);
    if (event.which == 68)
      update_player_position('player2', 1);
  });
});
