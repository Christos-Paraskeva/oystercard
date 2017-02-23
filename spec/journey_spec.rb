require 'journey'

describe Journey do

  let(:entry_station) {double(:station)}
  let(:exit_station) {double(:station)}
  subject(:journey) {described_class.new(entry_station)}

  describe 'initialization' do
    it "is initialized with complete = false by default " do
      expect(journey.complete?).to eq false
    end
  end

  it "records journey as complete when ending a journey" do
    journey.end_journey(exit_station)
    expect(journey.complete?).to eq true
  end

  it 'saves the entry station on touch_in', :entry => true do
    expect(journey.entry_station).to eq entry_station
  end

  it 'saves the exit station on touch_out' do
    journey.end_journey(exit_station)
    expect(journey.exit_station).to eq exit_station
  end

context 'calculate fare' do

  it 'minimum fare is deducted if there is an entry and exit station', :fare => true do
    journey = Journey.new(entry_station)
    journey.end_journey(exit_station)
    expect(journey.fare).to eq 1
  end

  it 'penalty fare is deducted if there is no entry station on exit', :penalty => true do
    journey = Journey.new(nil)
    journey.end_journey(exit_station)
    expect(journey.fare).to eq 6
  end

end
end
