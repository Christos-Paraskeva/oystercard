require_relative 'oystercard'
require_relative 'journey'

class JourneyLog
  attr_reader :journey_history #:entry_station, :exit_station

  def initialize
    @journey_history = []
  end

  def start(entry_station)
    @entry_station = entry_station
  end

  def finish(exit_station)
    @exit_station = exit_station

  end

  def journeys
   @journey_history
  end

  private
  def current_journey
    if !(@entry_station == nil)
    @journey_history << {@entry_station => @exit_station}
  end
end
