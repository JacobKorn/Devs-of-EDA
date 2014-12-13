var View = function(controller) {
	this.controller = controller;
};


View.prototype = {
	renderBoard: function() {
		two.update();
	},
	addClickEvents: function(hexagons) {
		var thisView = this
		hexagons.forEach(function(hexagon) {
			var $hex = $(hexagon._renderer.elem)
			$hex.css('cursor', 'pointer').on('click', function(event) {
				thisView.changeColor(hexagon);
				thisView.controller.board.logClick(event);
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