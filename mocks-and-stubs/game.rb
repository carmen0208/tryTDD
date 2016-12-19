class Character
  def initialize(strength: 1, die: Die.new, logger: Logger.new)
    @strength = strength
    @die = die
    @logger = logger
  end

  def climb(difficulty: 10)
    roll =  die.roll + strength
    logger.log("Climbing check. Difficulty: #{difficulty}. Roll: #{roll}")
    roll >= difficulty

  end

  private

  attr_reader :die, :strength, :logger
end
describe Character do
  describe 'climbing check skill' do
    let(:die) { double }
    let(:logger) {double("Logger",log: true)}
    let(:character) { Character.new(strength: 5, die: die, logger: logger)}

    # before do
    #   allow(logger).to receive(:log)
    # end

    it 'climbing successfully when roll + strength is more than difficulty' do
      #stub: that's the part the we fake the die, the die has method roll with return 11
      allow(die).to receive(:roll) { 11 }
      # allow(logger).to receive(:log)
      expect(character.climb(difficulty: 15)).to be_truthy
    end
    it 'fails climbing check when roll + strength is less than difficulty' do
      allow(die).to receive(:roll) { 5 }
      # allow(logger).to receive(:log)
      expect(character.climb(difficulty: 15)).to be_falsy
    end

    it 'commands logger to log climb skill check' do
      allow(die).to receive(:roll) { 7 }
      # mock: that means, we expect logger's log method be triggered
      expect(logger).to receive(:log).with("Climbing check. Difficulty: 10. Roll: 12")
      character.climb(difficulty: 10)
    end
  end
end

#rspec -fd -c game.rb
