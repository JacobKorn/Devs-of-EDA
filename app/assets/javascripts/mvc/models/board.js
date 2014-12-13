var Board = function(){
	this.serverTiles;
	this.hexagons = [];
};

Board.prototype = {
	getServerTiles: function(){
		//this will be an AJAX call
		this.serverTiles = data.board.tiles
	},
	makeHexagon: function(x, y){
		var c = 90;
	  var b = Math.sqrt(c*c - (c/2)*(c/2));
		var coords = {
			topLeft: 		 {x: x - b, y: y + c/2},
			top: 		 		 {x: x, 		y: y + c},
			topRight:    {x: x + b, y: y + c/2},
			bottomRight: {x: x + b, y: y - c/2},
			bottom: 		 {x: x, 		y: y - c},
			bottomLeft:  {x: x - b, y: y - c/2}
		};
		return coords
	},
	makeHexagonPoly: function(coords) {
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
		hexagon.fill = "#FFF";
		hexagon.stroke = "#1c75bc";
		hexagon.linewidth = 30;
		return hexagon
	},
	findHexagonCentrePoint: function(serverX, serverY, canvasCentreX, canvasCentreY) {
			var canvasXTemp;
			var canvasX;
			var canvasY;
			var canvasXOffset = 157;
			var canvasYOffset = 136;
			canvasXTemp = serverX * canvasXOffset + canvasCentreX;
			canvasY = serverY * -canvasYOffset + canvasCentreY;
			canvasX = canvasXTemp + serverY * canvasXOffset / 2;
			return [canvasX, canvasY]
	},
	makeCanvasHexagon: function(serverX, serverY) {
		var hexagonCentre = this.findHexagonCentrePoint(serverX, serverY, 500, 500);
		var hexagon = this.makeHexagon(hexagonCentre[0], hexagonCentre[1])
		var hexagonPoly = this.makeHexagonPoly(hexagon)
		var id = "[" + String(serverX) + "," + String(serverY) + "]"
		hexagonPoly.id = id
		// var hexPoly = $(hexagonPoly).data("serverCoords", {x: serverX, y: serverY});
		// console.log(hexPoly)
		return hexagonPoly
	},
	makeHexagons: function(){
		var thisBoard = this
		this.serverTiles.forEach(function(tile) {
			thisBoard.hexagons.push(thisBoard.makeCanvasHexagon(tile.serverX, tile.serverY))
		})
	},
	logClick: function(event) {
		console.log(event.target.id)
	}
};