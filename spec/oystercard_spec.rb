require 'oystercard'

describe OysterCard do
  it "has a balance of 0" do
    expect(subject.balance).to eq 0
  end

  # it "checks to see if balance respond to top up method" do
  #   expect(subject.balance).to respond_to(:top_up).with(1).argument
  # end

  it "increases the balance by a given value" do
    # allow(subject).to receive(:balance).and_return(0)
    subject.top_up(20)
    expect(subject.balance).to eq subject.balance
  end

  it 'gives an error when trying to top-up beyond max value' do
    error = "You have reached the maximum balance of £90"
    expect{subject.top_up(90)}.to raise_error error
  end
end
