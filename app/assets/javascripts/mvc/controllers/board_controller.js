var BoardController = function() {
	this.board = new Board();
	this.view = new View(this);


};

BoardController.prototype = {
	start: function() {
		this.renderBoard()
	},
	renderBoard: function(){
		this.board.getServerTiles();
		this.board.makeHexagons();
		this.view.renderBoard();
		this.view.addClickEvents(this.board.hexagons)
	}

};