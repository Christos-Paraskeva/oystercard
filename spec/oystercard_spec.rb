require 'oystercard'

describe Oystercard do
  let(:station) { double :station }
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
    subject.touch_in
    expect(subject).to be_in_journey
  end

  it 'does not let you touch in when balance is below £1', :low => true do
    expect {subject.touch_in}.to raise_error 'You have insufficient funds'
  end

  it 'deducts the fare money when touching out', :deduct => true do
    subject.top_up(5)
    expect {subject.touch_out}.to change{subject.balance}.by(-1)
  end

  # it "returns the specified value on any instance of the class" do
  #   Object.any_instance.stub(:foo).and_return(:return_value)
  #
  #   o = Object.new
  #   o.foo.should eq(:return_value)
  it 'saves the entry station on touch_in' do
    Station.new.any_instance.stub(:station).and_return(:station_instance)
    subject.top_up(5)

    expect{subject.touch_in}.to change{subject.station}.to(subject.station)
  end
end
