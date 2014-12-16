var View = function(controller) {
	this.controller = controller;

};


View.prototype = {
	renderBoard: function() {
		two.update();
	},
	// explore event delegation, prevent bubbling
	addClickEvents: function() {
		var self = this
		this.board.hexagons.forEach(function(hexagon) {
			var $hex = $(hexagon.canvasHexagon._renderer.elem)
			$hex.css('cursor', 'pointer').on('click', function(event) {
				self.view.controller.logClick(event);
			})
		})
	},
	addEeClickEvent: function() {
		var self = this
		$('#right').on('click', function(event) {
			self.controller.conductEeSession(event);
		})
	},
	addEndTurnClickEvents: function() {
		var self = this
		var endTurnButton = $("#right")
		endTurnButton.on('click', function(event) {
			console.log("clicked")
			self.controller.endTurn(event);
		})
	},
	updateResources: function(board) {
		var player1 = ["#player-1", board.player1];
		var player2 = ["#player-2", board.player2]
		var player3 = ["#player-3", board.player3];
		var player4 = ["#player-4", board.player4];

		console.log("VIEW BOARD----", board)

		this.updatePlayerResources(player1);
		this.updatePlayerResources(player2);
		this.updatePlayerResources(player3);
		this.updatePlayerResources(player4);
	},
	updatePlayerResources: function(player) {
		var $nameContents = $(player[0] + " #player_name").contents();
		var $fishContents = $(player[0] + " #fish_and_chips").contents();
		var $sleepContents = $(player[0] + " #sleep").contents();
		var $coffeeContents = $(player[0] + " #coffee").contents();
		var $haagenContents = $(player[0] + " #haagen").contents();
		var $pizzaContents = $(player[0] + " #pizza").contents();
		var $ee_sessionContents = $(player[0] + " #ee_session").contents();
		var $victory_pointsContents = $(player[0] + " #victory_points").contents();


		$nameContents.replaceWith(player[1].player_name);
		$sleepContents.replaceWith(player[1].resources.sleep);
		$fishContents.replaceWith(player[1].resources.fish_and_chips);
		$coffeeContents.replaceWith(player[1].resources.coffee);
		$haagenContents.replaceWith(player[1].resources.haagen);
		$pizzaContents.replaceWith(player[1].resources.pizza);
		$ee_sessionContents.replaceWith(player[1].resources.ee_session);
		$victory_pointsContents.replaceWith(player[1].resources.victory_points);
	}
};
