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
				self.view.changeColor(hexagon.canvasHexagon);
				self.view.controller.board.logClick(event);
			})
		})
	},
	changeColor: function(hexagon) {
		hexagon.fill = this.getRandomColor();
		two.update();
	},
	getRandomColor: function() {
    return 'rgb('
      + Math.floor(Math.random() * 255) + ','
      + Math.floor(Math.random() * 255) + ','
      + Math.floor(Math.random() * 255) + ')';
  }
};