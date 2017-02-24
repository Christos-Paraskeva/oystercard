require 'journeylog'
require 'oystercard'

describe JourneyLog do
  #subject(:oystercard) {described_class.new}
  let(:entry_station) {double(:station)}
  let(:exit_station) {double(:station)}

  context 'it logs the journey' do
    it 'starts a journey and initializes with a start station', :logger do
      oystercard = Oystercard.new
      oystercard.top_up(10)
      oystercard.touch_in
      expect(subject.start(:Acton)).to eq (:Acton)
    end

    it 'finishes journey and adds an end station', :logger2 do
      oystercard = Oystercard.new
      oystercard.top_up(10)
      oystercard.touch_in
      oystercard.touch_out
      expect(subject.finish(:Euston)).to eq (:Euston)
    end
  end
end
