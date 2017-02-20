require 'oystercard'

describe OysterCard do
  it "has a balance of 0" do
    expect(subject.balance).to eq 0
  end

  it "increases the balance by a given value" do
    subject.top_up(20)
    expect(subject.balance).to eq subject.balance
  end

  it 'gives an error when trying to top-up beyond max value' do
    max_balance = OysterCard::MAX_VALUE
    error = "You have reached the maximum balance of £#{max_balance}"
    expect{subject.top_up(max_balance + 1)}.to raise_error error
  end
end
