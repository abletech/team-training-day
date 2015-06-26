$(document).ready(function() {

  $(document).keyup(function(event) {
    if(gameFinished){
      declareWinner();
      return;
    }
    if(event.which == 65){
      updatePlayerPosition(1);
    }else if(event.which == 76){
      updatePlayerPosition(2);
    }
  });

});


var player1Postion = 1;
var player2Postion = 1;

var gameFinished = false;

function updatePlayerPosition(player_num) {
  if( player1Postion == 24 || player2Postion == 24){
    gameFinished = true;
  }
  if(player_num == 1){
    $("#player1_strip td:nth-child("+player1Postion+")").removeClass("active");
    $("#player1_strip td:nth-child("+(++player1Postion)+")").addClass("active");
  }else{
    $("#player2_strip td:nth-child("+player2Postion+")").removeClass("active");
    $("#player2_strip td:nth-child("+(++player2Postion)+")").addClass("active");
  }

}

function declareWinner(){
  if( player1Postion == 24 ){
    $("#player1_strip").addClass("winner");
  } else {
    $("#player2_strip").addClass("winner");
  }
}
