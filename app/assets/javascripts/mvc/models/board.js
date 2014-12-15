var Board = function(){
	this.serverTiles;
	this.hexagons = [];
	this.boardId;

};

Board.prototype = {
	saveTiles: function(data) {
		this.serverTiles = data.board.tiles;
		this.boardId = data.board.id;
	},
	getServerTiles: function(){
		return $.ajax({
			type: "POST",
			url: "/board.json",
		})
	},

	makeHexagons: function(){
		var thisBoard = this;
		this.serverTiles.forEach(function(tile) {
			thisBoard.hexagons.push(new Tile(tile.board_id, tile.chit_number, tile.tile_type, tile.id, tile.serverX, tile.serverY))
		})
	},
	logClick: function(event) {
		var sending = {
			tileClicked: {
				tileId: event.target.id,
				boardId: this.boardId
			}
		}
		$.ajax( {
			type: "POST",
			url: "/tiles/click.json",
			data: sending,
			success: function(data) {
				console.log("DATA-----", data)
			} 
		})
	}
};