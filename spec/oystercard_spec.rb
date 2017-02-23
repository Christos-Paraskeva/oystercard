require 'oystercard'
require 'station'

describe Oystercard do
  subject(:oystercard) {described_class.new}
  let(:entry_station) { double(:station) }
  let(:exit_station) {double(:station) }

  it "has a balance of 0" do
    expect(oystercard.balance).to eq 0
  end

  it "increases the balance by a given value" do
    oystercard.top_up(20)
    expect(oystercard.balance).to eq oystercard.balance
  end

  it 'gives an error when trying to top-up beyond max value' do
    max_balance = Oystercard::MAX_VALUE
    error = "You have reached the maximum balance of £#{max_balance}"
    expect{oystercard.top_up(max_balance + 1)}.to raise_error error
  end

  it 'does not let you touch in when balance is below £1', :low => true do
    expect {subject.touch_in(entry_station)}.to raise_error 'You have insufficient funds'
  end

  it 'deducts the fare money when touching out', :deduct => true do
    oystercard.top_up(5)
    oystercard.touch_in(entry_station)
    expect {oystercard.touch_out(exit_station)}.to change{oystercard.balance}.by(-1)
  end

  it 'checks touching in adds the entry station to hash', :start => true do
    oystercard.top_up(5)
    oystercard.touch_in(entry_station)
    oystercard.touch_out(exit_station)
    expect(oystercard.station_history).to eq [{entry_station => exit_station }]
  end

  it 'minimum fare is deducted if there is an entry and exit station', :fare => true do
    card = Oystercard.new
    card.top_up(10)
    card.touch_in(:entry_station)
    card.touch_out(:exit_station)
    expect(card.touch_out(exit_station)).to eq card.balance
  end
end
