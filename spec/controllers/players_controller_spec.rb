require 'rails_helper'

RSpec.describe PlayersController, :type => :controller do

	describe 'conduct_ee_session' do
	
		it "checks that the model conducted the ee_session or not" do
			player = Player.new(name: 'Steve', sleep: 1, coffee: 1, pizza: 1, haagen: 1, board_id: 1)
			player.save
			put :conduct_ee_session, {id: player.id}
			expect(response.body).to include('{"fish_and_chips":0,"coffee":0,"haagen":0,"pizza":0,"sleep":0}')
		end

		it "sends back a bad request if the model could not conduct the ee session" do
			player = Player.new(name: 'Steve', sleep: 0, coffee: 0, pizza: 0, haagen: 0, board_id: 1)
			player.save
			put :conduct_ee_session, {id: player.id}
			expect(response).to be_bad_request
		end
	end

end
