var Tile = function(boardId, chitNumber, tileType, tileId, serverX, serverY) {
	this.boardId = boardId;
	this.tileId = tileId;
	this.chitNumber = chitNumber;
	this.tileType = tileType;
	this.serverX = serverX;
	this.serverY = serverY;
	this.canvasHexagon;
	this.canvasCentreX = 500;
	this.canvasCentreY = 450;
	this.hexagonCentreX;
	this.hexagonCentreY;
	this.hexagonCoords;
	this.canvasChit;

	this.findHexagonCentrePoint();
	this.makeCanvasHexagon();
	this.makeCanvasChit();
	this.assignColor();
};

Tile.prototype = {
	makeCanvasHexagon: function() {
		this.makeHexagon();
		var hexagonPoly = this.makeHexagonPoly()
		var id = "[" + String(this.serverX) + "," + String(this.serverY) + "]"
		hexagonPoly.id = id
		hexagonPoly.fill = "#FFF";
		hexagonPoly.stroke = "#1c75bc";
		hexagonPoly.opacity = 0.75;
		hexagonPoly.linewidth = 30;
		this.canvasHexagon = hexagonPoly
	},

	makeCanvasChit: function() {
			var circle = two.makeCircle(this.canvasCentreX, this.canvasCentreY, 35);
			circle.fill = '#211809';
			this.canvasChit = circle;
	},

	findHexagonCentrePoint: function() {
		var canvasXTemp;
		var canvasX;
		var canvasY;
		var canvasXOffset = 157;
		var canvasYOffset = 136;
		canvasXTemp = this.serverX * canvasXOffset + this.canvasCentreX;
		canvasY = this.serverY * -canvasYOffset + this.canvasCentreY;
		canvasX = canvasXTemp + this.serverY * canvasXOffset / 2;
		this.canvasCentreX = canvasX;
		this.canvasCentreY = canvasY;
	},


	makeHexagonPoly: function() {
		var coords = this.hexagonCoords
		var x1 = coords.topLeft.x
		var y1 = coords.topLeft.y
		var x2 = coords.top.x
		var y2 = coords.top.y
		var x3 = coords.topRight.x
		var y3 = coords.topRight.y
		var x4 = coords.bottomRight.x
		var y4 = coords.bottomRight.y
		var x5 = coords.bottom.x
		var y5 = coords.bottom.y
		var x6 = coords.bottomLeft.x
		var y6 = coords.bottomLeft.y
		var hexagon = two.makePolygon(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, x6, y6, true, false)
		return hexagon
	},

	assignColor: function() {
		switch (this.tileType) {
			case "fish_and_chip_shop":
				this.canvasHexagon.fill = "#1D652E";
				break;
			case "coffee_shop":
				this.canvasHexagon.fill = "#34C805"
				break;
			case "liquor_shop":
				this.canvasHexagon.fill = "#727576";
				break;
			case "pizza_shop":
				this.canvasHexagon.fill = "#F8D425";
				break;
			case "bed":
				this.canvasHexagon.fill = "#CC4117";
				break;
			case "undefined":
				this.canvasHexagon.fill = "#DFB97A"
				break;
			default:
		}
	},

	makeHexagon: function(){
		var x = this.canvasCentreX;
		var y = this.canvasCentreY;
		var c = 90;
	  var b = Math.sqrt(c*c - (c/2)*(c/2));
		var coords = {
			topLeft: 		 { x: x - b, y: y + c/2 },
			top: 		 		 { x: x, 		 y: y + c   },
			topRight:    { x: x + b, y: y + c/2 },
			bottomRight: { x: x + b, y: y - c/2 },
			bottom: 		 { x: x, 		 y: y - c   },
			bottomLeft:  { x: x - b, y: y - c/2 }
		};
		this.hexagonCoords = coords
	},
}
