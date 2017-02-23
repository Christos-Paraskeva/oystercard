require_relative 'station'
require_relative 'journey'

class Oystercard
  attr_reader :balance, :station_history, :journey

MAX_VALUE = 90
MIN_BALANCE = 1
JOURNEY_COST = 1


  def initialize
    @balance = 0
    @station_history = []
  end

  def top_up(value)
    fail "You have reached the maximum balance of £#{MAX_VALUE}" if value + balance > MAX_VALUE
    @balance += value
  end

  def touch_in(station=nil)
    fail 'You have insufficient funds' if (balance < MIN_BALANCE)
    @journey = Journey.new(station)
  end

  def touch_out(station)
    @journey.end_journey(station)
    @station_history << {@journey.entry_station => @journey.exit_station}
    @balance -= @journey.fare
  end
end
