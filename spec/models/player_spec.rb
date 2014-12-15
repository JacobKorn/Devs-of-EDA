require 'rails_helper'

RSpec.describe Player, :type => :model do
  describe "#initialize" do
    let(:player) {Player.new({name: 'Steve'})}

    it "should create a new Player with name" do
      expect(player.name). to eq("Steve")
    end

    it "should give Player starting wood balance of 0" do
      expect(player.wood). to eq(0)
    end

    it "should give Player starting sheep balance of 0" do
      expect(player.sheep). to eq(0)
    end

    it "should give Player starting ore balance of 0" do
      expect(player.ore). to eq(0)
    end

    it "should give Player starting grain balance of 0" do
      expect(player.grain). to eq(0)
    end

    it "should give Player starting brick balance of 0" do
      expect(player.brick). to eq(0)
    end

    it "should give Player starting victory points of 0" do
      expect(player.victory_points). to eq(0)
    end

    it "should give Player starting ee_session points of 0" do
      expect(player._ee_ssesion).to eq(0)
    end
  end

  describe Player do
    subject { Player.new(name: 'Steve') }
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:board_id)}
      it { should belong_to :board}
  end


  describe '#win' do
    let(:player) {Player.new({name: 'Steve'})}

    it "should declare a winner when Player collects 5 victory_points" do
      player.victory_points = 5
      expect(player.win?). to be true
    end

    it "should not declare winner when Player has less than 5 victory_points" do
      player.victory_points = 3
      expect(player.win?). to be false
    end
  end

  # describe '#conduct_ee_session' do
  #   let(:player) { Player.new(name: 'Steve')}
  
  #   it "should should bump up your ee_session points by one"

  # end
end
