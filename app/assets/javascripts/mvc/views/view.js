var View = function(controller) {
	this.controller = controller;

};


View.prototype = {
	renderBoard: function() {
		two.update();
	},
	addTileClickEvents: function() {
		var self = this
		this.board.hexagons.forEach(function(hexagon) {
			var $hex = $(hexagon.canvasHexagon._renderer.elem)
			$hex.css('cursor', 'pointer').on('click', function(event) {
				self.view.controller.logClick(event);
			})
		})
	},
	addClickEvent: function(selector, callback) {
		$(selector).on('click', function(event) {
			event.preventDefault();
			callback(event);
		})
	},
	updateResources: function(board) {
		var player1 = [ "#player-1", board.player1 ];
		var player2 = [ "#player-2", board.player2 ];
		var player3 = [ "#player-3", board.player3 ];
		var player4 = [ "#player-4", board.player4 ];
		console.log(board.player1)

		this.updatePlayerResources(player1);
		this.updatePlayerResources(player2);
		this.updatePlayerResources(player3);
		this.updatePlayerResources(player4);
	},
	updatePlayerResources: function(player) {
		console.log(player)
		var $clicksLeft = $(player[0] + " #clicks_left");
		var $name = $(player[0] + " #player_name h2");
		var $fish = $(player[0] + " #fish_and_chips");
		var $sleep = $(player[0] + " #sleep");
		var $coffee = $(player[0] + " #coffee");
		var $haagen = $(player[0] + " #haagen");
		var $pizza = $(player[0] + " #pizza");
		var $ee_session = $(player[0] + " #ee_session");
		var $victory_points = $(player[0] + " #victory_points");

		$clicksLeft.text( player[1].clicks_left );
		$name.text( player[1].player_name );
		$sleep.text( player[1].resources.sleep );
		$fish.text( player[1].resources.fish_and_chips );
		$coffee.text( player[1].resources.coffee );
		$haagen.text( player[1].resources.haagen );
		$pizza.text( player[1].resources.pizza );
		$ee_session.text( player[1].resources.ee_session );
		$victory_points.text( player[1].resources.victory_points );
	}
};
