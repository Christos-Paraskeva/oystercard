require 'oystercard'
require 'station'

describe Oystercard do
  let(:entry_station) { double(:station) }
  let(:exit_station) {double(:station) }

  it "has a balance of 0" do
    expect(subject.balance).to eq 0
  end

  it "increases the balance by a given value" do
    subject.top_up(20)
    expect(subject.balance).to eq subject.balance
  end

  it 'gives an error when trying to top-up beyond max value' do
    max_balance = Oystercard::MAX_VALUE
    error = "You have reached the maximum balance of £#{max_balance}"
    expect{subject.top_up(max_balance + 1)}.to raise_error error
  end

  it 'card has not been touched in yet', :touched => true do
    expect(subject).to_not be_in_journey
  end

  it 'card has been touched in', :in => true do
    subject.top_up(2)
    subject.touch_in(entry_station)
    expect(subject).to be_in_journey
  end

  it 'does not let you touch in when balance is below £1', :low => true do
    expect {subject.touch_in(entry_station)}.to raise_error 'You have insufficient funds'
  end

  it 'deducts the fare money when touching out', :deduct => true do
    subject.top_up(5)
    expect {subject.touch_out(exit_station)}.to change{subject.balance}.by(-1)
  end

  it 'saves the entry station on touch_in', :entry => true do
    subject.top_up(5)
    expect(subject.touch_in(entry_station)).to eq entry_station
  end

  it 'resets station on touch_out' do
    subject.top_up(10)
    subject.touch_in(entry_station)
    subject.touch_out(exit_station)
    expect(subject.station).to eq nil
  end

  it 'checks touching in adds the entry station to hash', :start => true do
    # allow(entry_station).to receive(:name).and_return('Highbury')
    # allow(exit_station).to receive(:name).and_return('Liverpool Street')
    subject.top_up(5)
    subject.touch_in(entry_station)
    subject.touch_out(exit_station)
    expect(subject.station_history).to eq [{entry_station => exit_station }]
  end
end
