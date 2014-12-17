var BoardController = function() {
	this.board = new Board();
	this.view = new View(this);
	this.initializeClickEvents();
};

BoardController.prototype = {
	newGame: function() {
		this.board.getServerTiles()
			.done(this.board.saveTiles.bind(this.board))
			.done(this.board.makeHexagons.bind(this.board))
			.done(this.view.renderBoard)
			.done(this.view.addTileClickEvents.bind(this))
			.done(this.updateResources.bind(this));
	},
	loadGame: function(board) {
		this.board.loadServerTiles(board)
			.done(this.board.saveTiles.bind(this.board))
			.done(this.board.makeHexagons.bind(this.board))
			.done(this.view.renderBoard)
			.done(this.view.addTileClickEvents.bind(this))
			.done(this.updateResources.bind(this))
	},
	initializeClickEvents: function() {

		var eeSelector = '#ee_session';
		var eeCallback = this.conductEeSession.bind(this);
		this.view.addClickEvent( eeSelector, eeCallback );

		var endTurnSelector = '#end-turn';
		var endTurnCallback = this.endTurn.bind(this);
		this.view.addClickEvent( endTurnSelector, endTurnCallback );

	},


	triggerResourceAction: function(action, event) {
		this.board.action(event)
			.done(this.board.updatePlayers.bind(this.board))
			.done(this.updateResources.bind(this));
	},

	logClick: function(event) {
		this.board.logClick(event)
			.done(this.board.updatePlayers.bind(this.board))
			.done(this.updateResources.bind(this));
	},
	endTurn: function(event) {
		this.board.endTurn(event)
			.done(this.board.updatePlayers.bind(this.board))
			.done(this.updateResources.bind(this));
	},
	conductEeSession: function(event) {
		this.board.conductEeSession(event)
			.done(this.board.updatePlayers.bind(this.board))
			.done(this.updateResources.bind(this));
	},

	updateResources: function() {
		this.view.updateResources(this.board);
	},
};
