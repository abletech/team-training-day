$(function(){
  function Track(player_count){
    this.player_count = player_count;
    this.distance = 50;
    this.positions = [0, 0];

    this.setupBoard = function(){
      $('body').append("<table id='board' class='racer_table'></table>");
      for (var i = 0; i < this.player_count; i++) {
        var row = "<tr>";
        for (var j = 0; j < this.distance; j++) {
          if (j == 0){
            row += "<td class='active cell_" + j + "'></td>";
          } else {
            row += "<td class='cell_" + j + "'></td>";
          }
        }
        row += "</tr>";
        $('#board').append(row);
      }
    }

    this.setupKeyboard = function(){
      var obj = this;
      $('body').keypress(function(e){
        if(e.keyCode == 113){ //113 q
          obj.advance(0);
        }else if (e.keyCode == 112) { //112 p
          obj.advance(1);
        }
      })
    }

    this.setup = function(){
      this.setupBoard();
      this.setupKeyboard();
    }

    this.advance = function(player){
      var currentPosition = this.positions[player];
      this.positions[player] += 1;
      $('.racer_table tr:nth-child(' + (player + 1) + ') td:nth-child(' + (currentPosition+1) + ')').removeClass('active');
      $('.racer_table tr:nth-child(' + (player + 1) + ') td:nth-child(' + (currentPosition+2) + ')').addClass('active');
    }
  }
  var track = new Track(2);
  track.setup();
});
