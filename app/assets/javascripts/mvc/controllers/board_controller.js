var BoardController = function() {
	this.board = new Board();
	this.view = new View(this);


};

BoardController.prototype = {
	start: function() {
		this.renderBoard(this.view.renderBoard)
	},
	renderBoard: function(){
		this.board.getServerTiles()
			.done(this.board.saveTiles.bind(this.board))
			.done(this.board.makeHexagons.bind(this.board))
			.done(this.view.renderBoard)
			.done(this.view.addClickEvents.bind(this))
	},
	logClick: function(event) {
		var controller = this
		this.board.logClick(event)
			.done(this.board.updateResources.bind(this.board))
			.done(this.updateResources.bind(this));
	},
	updateResources: function() {
		this.view.updateResources(this.board.resources);
	}
};