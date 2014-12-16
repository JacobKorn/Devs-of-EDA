var BoardController = function() {
	this.board = new Board();
	this.view = new View(this);

	this.view.addEndTurnClickEvents();
};

BoardController.prototype = {
	newGame: function() {
		this.board.getServerTiles()
			.done(this.board.saveTiles.bind(this.board))
			.done(this.board.makeHexagons.bind(this.board))
			.done(this.view.renderBoard)
			.done(this.view.addClickEvents.bind(this))
	},
	loadGame: function(board) {
		this.board.loadServerTiles(board)
			.done(this.board.saveTiles.bind(this.board))
			.done(this.board.makeHexagons.bind(this.board))
			.done(this.view.renderBoard)
			.done(this.view.addClickEvents.bind(this))
			.done(this.board.updateResourcesOnLoad.bind(this.board))			
			.done(this.updateResources.bind(this))
	},
	logClick: function(event) {
		var controller = this
		this.board.logClick(event)
			.done(this.board.updateResources.bind(this.board))
			.done(this.updateResources.bind(this));
	},
	updateResources: function() {
		this.view.updateResources(this.board);
	},
	endTurn: function(event) {
		this.board.endTurn();		
	}
};