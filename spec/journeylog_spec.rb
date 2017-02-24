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
     it 'returns incomplete or complete journey' do
       subject.start(entry_station)
       subject.finish(exit_station)
       expect(subject.journeys).to eq ([{entry_station => exit_station}])
     end

      it 'marks a journey as complete when touch in twice', :touchin do
        subject.start(:Acton)
        subject.start(:Euston)
        expect(subject.journeys).to eq ([{:Acton => nil}])
      end
    end
end
