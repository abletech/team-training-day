// use the 'k' and 'm' keys to advance the race cars along the track

$(document).ready(function() {
  $(document).on('keyup', advancePlayer);
  $("#restart").on('click', resetBoard);
});

var gameFinished = false;
var playerThatWon = "";
var positions = { player1: 1, player2: 1 };

function advancePlayer() {
  var keypress = event.which;
  if (gameFinished === false) {
    if (keypress === 75)
      updatePlayerPosition("player1", speed());
    else if (keypress === 77)
      updatePlayerPosition("player2", speed());
  };

  playerThatWon = winningPlayer();

  if (playerThatWon) {
    playerWins();
  };
};

function speed() {
  return Math.floor(Math.random()*5+1);
};

var updatePlayerPosition = function(player, position) {
  positions[player] += position;
  var playerToUpdate = "#" + player + "_strip";
  $(playerToUpdate + " .active").removeClass("active");
  $(playerToUpdate + " td:nth-child(" + positions[player] + ")").addClass("active");
};

function winningPlayer() {
  for (var key in positions) {
    if (positions[key] > 42) {
      return key;
    };
  };
};

function playerWins() {
  $("#winner").html("<p>" + playerThatWon + " has won the game!</p>");
  gameFinished = true;
  $("#" + playerThatWon + "_strip td").addClass("winner");
}

function resetBoard() {
  for (var key in positions)
    positions[key] = 1;
  updatePlayerPosition("player1", 0);
  updatePlayerPosition("player2", 0);

  $("#" + playerThatWon + "_strip td").removeClass("winner");
  $("#winner").html("")
  gameFinished = false;
};

