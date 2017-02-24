require_relative 'station'
require_relative 'journey'
require_relative 'journeylog'

class Oystercard
  attr_reader :balance, :journey_logs, :journey, :journeylog

  MAX_VALUE = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    @journey_history = []
    @journeylog = JourneyLog.new
  end

  def top_up(value)
    fail "You have reached the maximum balance of £#{MAX_VALUE}" if value + balance > MAX_VALUE
    @balance += value
  end

  def touch_in(station=:Acton)
    fail 'You have insufficient funds' if (balance < MIN_BALANCE)
    @journeylog.start(station)
  end

  def touch_out(station=:Euston)
    @journeylog.finish(station)
    # @journey_history << {@journey.entry_station => @journey.exit_station}
    # @balance -= (@journey.fare)
  end
end
