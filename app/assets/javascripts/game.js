
$(function() {
	
	elem = document.getElementById('draw-shapes').children[0];
	params = { width: 1200, height: 900 };
	two = new Two(params).appendTo(elem);

	var game = new BoardController();
	game.start();

});



