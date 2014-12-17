
$(function() {
	//consider finding by board ID instead
	elem = document.getElementById('draw-shapes').children[0];
	params = { width: 850, height: 800 };
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



