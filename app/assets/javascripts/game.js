
$(function() {
	
	elem = document.getElementById('draw-shapes').children[0];
	params = { width: 1200, height: 900 };
	two = new Two(params).appendTo(elem);

	var game = new BoardController();
	var url = window.location.pathname;
	var board = url.split('/').pop();

	if (board == "new") {
		game.newGame();
	}	
	else {
		game.loadGame(board);
	}

});



