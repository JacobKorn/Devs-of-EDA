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
	updateResources: function(resources) {
		console.log("resources------",resources)
		var $fishContents = $("#fish_and_chips").contents();
		var $sleepContents = $("#sleep").contents();
		var $coffeeContents = $("#coffee").contents();
		var $haagenContents = $("#haagen").contents();
		var $pizzaContents = $("#pizza").contents();

		$sleepContents.replaceWith(resources.sleep);
		$fishContents.replaceWith(resources.fish_and_chips);
		$coffeeContents.replaceWith(resources.coffee);
		$haagenContents.replaceWith(resources.haagen);
		$pizzaContents.replaceWith(resources.pizza);
	}
};