require 'rails_helper'

RSpec.describe Player, :type => :model do
  describe "#initialize" do
    let(:player) {Player.new({name: 'Steve'})}

    it "should create a new Player with name" do
      expect(player.name). to eq("Steve")
    end

    it "should give Player starting wood balance of 0" do
      expect(player.fish_and_chips). to eq(0)
    end

    it "should give Player starting sheep balance of 0" do
      expect(player.coffee). to eq(0)
    end

    it "should give Player starting ore balance of 0" do
      expect(player.haagen). to eq(0)
    end

    it "should give Player starting grain balance of 0" do
      expect(player.pizza). to eq(0)
    end

    it "should give Player starting brick balance of 0" do
      expect(player.sleep). to eq(0)
    end

    it "should give Player starting victory points of 0" do
      expect(player.victory_points). to eq(0)
    end

    it "should give Player starting ee_session points of 0" do
      expect(player.ee_session).to eq(0)
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

  describe '#conduct_ee_session' do
    let(:player) { Player.new(name: 'Steve', board_id: 5, fish_and_chips: 5, sleep: 5, coffee: 5, pizza: 5, haagen: 5)}
      
      before do
        player.conduct_ee_session
      end


    it "should bump up your ee_session points by one" do
      expect(player.ee_session).to eq(1)
    end

    it "should bump up your victory points by one" do
      expect(player.victory_points).to eq(1)
    end

    it 'checks to see if you have won the match or not' do
      # expect(player).to receive(:win?).with(no_args)
      expect(player).to receive(:increment_victory_points).with(no_args)
    end

    # it "should check to see if you have won the match or not" do
    #   player.victory_points = 4
    #   player.save
    #   player.conduct_ee_session
    #   expect(player.win?).to be true
    # end
  end

  describe '#decrement_resources' do
    let(:player) { Player.new(name: 'Steve', board_id: 1, fish_and_chips: 1, sleep: 1, coffee: 1, pizza: 1, haagen: 1)}
      
      before do
        player.decrement_resources
      end

      it 'decrements sleep by 1' do
        expect(player.sleep).to eq(0)
      end

      it 'decrements coffee by 1' do
        expect(player.coffee).to eq(0)
      end

      it 'decrements pizza by 1' do
        expect(player.pizza).to eq(0)
      end

      it 'decrements haagen by 1' do
        expect(player.haagen).to eq(0)
      end
  end

end
