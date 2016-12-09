require_relative '../lib/bowling_game'
describe BowlingGame do
  let(:game) {BowlingGame.new}
  it "score a gutter game(0)" do
   # game = BowlingGame.new
    game.pins([0] * 20)
    expect(game.score).to eq(0)
  end

  it "score a game of 1s" do
    #game = BowlingGame.new
    game.pins([1] * 20)
    expect(game.score).to eq(20)
  end

  it "score a game with spare" do 
    game.pins([4,6,5] + [0] * 17)
    expect(game.score).to eq(20)
  end

  it "score a game with stribe" do
    game.pins([10,3,5] + [0] * 17)
    expect(game.score).to eq(26)
  end

  it "score a perfect game" do 
    game.pins([10] * 12)
    expect(game.score).to eq(300)
  end
end
