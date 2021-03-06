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
		console.log("INITIAL BOARD---", data)
		this.serverJson = data;
		this.serverTiles = data.board.tiles;
		this.boardId = data.board.id;
		this.loadPlayers();
	},
	loadPlayers: function() {
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
		return $.ajax( {
			type: "POST",
			url: "/tiles/click.json",
			data: sending,
		})
	},

	updatePlayers: function(data) {
		console.log("PLAYERS LOG---->", data)
		this.player1 = data.players[0]
		this.player2 = data.players[1]
		this.player3 = data.players[2]
		this.player4 = data.players[3]
		this.checkWinner();
	},

	checkWinner: function() {
		if (this.player1.is_winner) {
			alert(this.player1.player_name + " is a winner")
			console.log("player 1 wins")
		}
		else if (this.player2.is_winner) {
			alert(this.player2.player_name + " is a winner")
		}
		else if (this.player3.is_winner) {
			alert(this.player3.player_name + " is a winner")
		}
		else if (this.player4.is_winner) {
			alert(this.player4.player_name + " is a winner")
		}
	},

	
	conductEeSession: function(event) {
		return $.ajax({
			type: "PUT",
			url: "/players/" + this.boardId + "/conduct_ee_session.json"
		})
	},

	endTurn: function(event) {
		return $.ajax({
			type: "PUT",
			url: "/turns/" + this.boardId + "/end_turn"
		})
	}
};