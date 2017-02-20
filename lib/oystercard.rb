class OysterCard
  attr_reader :balance

  def initialize
    @balance = 0
    @max_value = 90
  end

  def top_up(value)
    if (@balance < @max_value) && (@balance + value) <= @max_value
      @balance += value
    else
      fail 'You have reached the maximum balance of £90'
    end
  end
end
