var Board = function(){
	this.serverJson;
	this.serverTiles;
	this.hexagons = [];
	this.boardId;
	this.player1;
	this.player2;
	this.player3;
	this.player4;
};

Board.prototype = {


	saveTiles: function(data) {
		this.serverJson = data;
		this.serverTiles = data.board.tiles;
		this.boardId = data.board.id;
	},
	updateResourcesOnLoad: function() {
		this.player1 = this.serverJson.board.players[0]
		this.player2 = this.serverJson.board.players[1]
		this.player3 = this.serverJson.board.players[2]
		this.player4 = this.serverJson.board.players[3]
	},
	getServerTiles: function(){
		return $.ajax({
			type: "POST",
			url: "/boards.json",
		})
	},
	loadServerTiles: function(board){
		return $.ajax({
			type: "GET",
			url: "/boards/"+ board +".json",
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
		return $.ajax({
			type: "POST",
			url: "/tiles/click.json",
			data: sending
		})
	},
	updateResources: function(data) {
		console.log("RESOURCE DATA----->>>", data)
		this.player1 = data.tiles[0]
		this.player2 = data.tiles[1]
		this.player3 = data.tiles[2]
		this.player4 = data.tiles[3]
	},



	endTurn: function(event) {
		return $.ajax({
			type: "PUT",
			url: "/turns/" + this.boardId + "/end_turn"
		})
	}
};