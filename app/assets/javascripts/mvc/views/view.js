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
		var $brickContents = $("#brick").contents();
		var $woodContents = $("#wood").contents();
		var $sheepContents = $("#sheep").contents();
		var $oreContents = $("#ore").contents();
		var $wheatContents = $("#wheat").contents();

		$brickContents.replaceWith(resources.brick);
		$woodContents.replaceWith(resources.wood);
		$sheepContents.replaceWith(resources.sheep);
		$oreContents.replaceWith(resources.ore);
		$wheatContents.replaceWith(resources.grain);
	}
};