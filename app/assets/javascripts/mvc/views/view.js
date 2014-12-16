var View = function(controller) {
	this.controller = controller;
	
};


View.prototype = {
	renderBoard: function() {
		two.update();
	},
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
		console.log("ee click event ---", this)
		var self = this
		console.log($('#ee_session')[0])
		$('#scoreboard').on('click', $('#ee_session'), function(event) {
			console.log("CLICKED ---", self)
			self.controller.conductEeSession(event);
		})
	},
	updateResources: function(resources) {
		var $fishContents = $("#fish_and_chips").contents();
		var $sleepContents = $("#sleep").contents();
		var $coffeeContents = $("#coffee").contents();
		var $haagenContents = $("#haagen").contents();
		var $pizzaContents = $("#pizza").contents();
		var $ee_sessionContents = $("#ee_session").contents();

		$sleepContents.replaceWith(resources.sleep);
		$fishContents.replaceWith(resources.fish_and_chips);
		$coffeeContents.replaceWith(resources.coffee);
		$haagenContents.replaceWith(resources.haagen);
		$pizzaContents.replaceWith(resources.pizza);
		$ee_sessionContents.replaceWith(resources.ee_session);
	}
};