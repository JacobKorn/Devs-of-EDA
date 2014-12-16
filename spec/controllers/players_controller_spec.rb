require 'rails_helper'

RSpec.describe PlayersController, :type => :controller do

	describe 'conduct_ee_session' do
		let(:player) { Player.new(name: 'Steve', board_id: 1, fish_and_chips: 1, sleep: 1, coffee: 1, pizza: 1, haagen: 1)}
	
		it "checks that the model conducted the ee_session or not" do
			put :conduct_ee_session, {board_id: player.board_id}
			expect(response.body).to include('{"fish_and_chips":0,"coffee":0,"haagen":0,"pizza":0,"sleep":0}')
		end

		it "sends back a bad request if the model could not conduct the ee session" do
			put :conduct_ee_session, {board_id: player.board_id}
			expect(response).to be_bad_request
		end
	end

end
