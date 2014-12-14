var BoardController = function() {
	this.board = new Board();
	this.view = new View(this);


};

BoardController.prototype = {
	start: function() {
		this.renderBoard(this.view.renderBoard)
	},
	renderBoard: function(callback){
		// this.board.getServerTiles();
		// console.log("from controller render board---", this.board.serverTiles)
		this.board.getServerTiles()
			.done(this.board.saveTiles.bind(this.board))
			.done(this.board.makeHexagons.bind(this.board))
			.done(this.view.renderBoard)
			.done(this.view.addClickEvents.bind(this.view))
		// this.board.makeHexagons();

		
		// this.view.addClickEvents(this.board.hexagons);
	}

};