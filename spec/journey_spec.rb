require 'journey'
require 'oystercard'
require 'journeylog'

describe Journey do

  let(:entry_station) {double(:station)}
  let(:exit_station) {double(:station)}
  #subject(:journey) {described_class.new}

  # describe 'initialization' do
  # it "is initialized with complete = false by default " do
  #     expect(journey.complete?).to eq false
  #   end
  # end


  # it 'saves the entry station on touch_in', :entry => true do
  #   expect(journey.entry_station).to eq entry_station
  # end

  it 'saves the exit station on touch_out' do
    journey.end_journey(exit_station)
    expect(journey.exit_station).to eq exit_station
  end

end
