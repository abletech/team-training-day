window.onload = function(){

  window.onkeypress = function(event) {
    players = document.getElementsByClassName('player');
    for (i=0; i < players.length; i++) {
      player = players[i];
      if (player.getAttribute('data-key').charCodeAt(0) == event.which) {
        position = 20 + Number(player.style.left.substring(0, player.style.left.length-2))
        player.style.left = position
        if (position > 500) {
          for (j=0; j < document.getElementsByClassName('player').length; j++) {
            player = players[j];
            player.style.left = 0;
          }
          alert("Player " + player.getAttribute('data-key') + " Wins");
        }
      }
    }
  }
}
