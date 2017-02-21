require 'journey'

describe Journey do
  it 'card has not been touched in yet', :out => true do
    expect(subject).to_not be_in_journey
  end

  it 'card has been touched in', :in => true do
    subject.card.top_up(2)
    subject.touch_in
    expect(subject).to be_in_journey
  end

  it 'does not let you touch in when balance is below £1', :low => true do
    expect { subject.touch_in }.to raise_error 'You have insufficient funds'
  end
end
