class OysterCard
  attr_reader :balance

MAX_VALUE = 90

  def initialize
    @balance = 0
  end

  def top_up(value)
    if (@balance < MAX_VALUE) && (@balance + value) <= MAX_VALUE then @balance += value
    else  fail "You have reached the maximum balance of £#{MAX_VALUE}"
    end
  end
end
