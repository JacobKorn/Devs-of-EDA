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
				self.view.controller.board.logClick(event);
			})
		})
	}
};