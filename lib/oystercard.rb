require_relative 'station'

class Oystercard
  attr_accessor :balance, :in_journey, :station

MAX_VALUE = 90
MIN_BALANCE = 1
JOURNEY_COST = 1


  def initialize
    @balance = 0
    @in_journey = false
    @station = nil
  end

  def top_up(value)
    fail "You have reached the maximum balance of £#{MAX_VALUE}" if value + balance > MAX_VALUE
    @balance += value
  end

  def in_journey?
    true if @in_journey
  end

  def touch_in
    fail 'You have insufficient funds' if (balance < MIN_BALANCE)
    @in_journey = true
    @station = Station.new
  end

  def touch_out
    @in_journey = false
    deduct
  end

  private

  def deduct(cost=JOURNEY_COST)
    @balance -= JOURNEY_COST
  end
end
