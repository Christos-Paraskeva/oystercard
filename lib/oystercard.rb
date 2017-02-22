require_relative 'station'

class Oystercard
  attr_reader :balance, :in_journey, :station, :station_history

MAX_VALUE = 90
MIN_BALANCE = 1
JOURNEY_COST = 1


  def initialize
    @balance = 0
    @station = nil
    @station_history = []
  end

  def top_up(value)
    fail "You have reached the maximum balance of £#{MAX_VALUE}" if value + balance > MAX_VALUE
    @balance += value
  end

  def in_journey?
    true if @station
  end

  def touch_in(station)
    fail 'You have insufficient funds' if (balance < MIN_BALANCE)
    @station = station

  end

  def touch_out(station)
    deduct
    @station_history << {@station => station}
    @station = nil
  end

  private

  def deduct(cost=JOURNEY_COST)
    @balance -= JOURNEY_COST
  end
end
