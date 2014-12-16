var BoardController = function() {
	this.board = new Board();
	this.view = new View(this);

	//move this to a function and call when initialized
	this.view.addEndTurnClickEvents();
	this.view.addEeClickEvent();
};

BoardController.prototype = {
	//pull out similar calls into new function
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
			.done(this.board.updateResourcesLogClick.bind(this.board))
			.done(this.updateResources.bind(this));
	},
	endTurn: function(event) {
		this.board.endTurn()
			.done(this.board.updateResourcesTurns.bind(this.board));
		console.log("ENDTURN-----", this.board);
		this.view.updateResources(this.board);
	},
	conductEeSession: function(event) {
		this.board.conductEeSession(event)
			.done(this.board.updateResourcesEeSession.bind(this.board))
			.done(this.updateResources.bind(this))
	},
	updateResources: function() {
		this.view.updateResources(this.board);
	},
};
