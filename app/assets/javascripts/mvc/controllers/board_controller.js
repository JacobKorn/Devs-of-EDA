var BoardController = function() {
	this.board = new Board();
	this.view = new View(this);
	this.initializeClickEvents();
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
	initializeClickEvents: function() {
		// this.view.addEndTurnClickEvents();
		// this.view.addEeClickEvent();
		var eeSelector = '#ee_session';
		var eeCallback = this.conductEeSession.bind(this);
		this.view.addClickEvent( eeSelector, eeCallback );

		var endTurnSelector = '#end-turn';
		var endTurnCallback = this.endTurn.bind(this);
		this.view.addClickEvent( endTurnSelector, endTurnCallback );
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
