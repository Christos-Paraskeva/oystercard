require_relative 'oystercard'
require_relative 'journey'

class JourneyLog
  attr_reader :journey_history, :entry_station, :exit_station

  def initialize
    @journey_history = []
  end

  def start(entry_station)
    current_journey
    @entry_station = entry_station

  end

  def finish(exit_station)
    @exit_station = exit_station
    current_journey

  end

  def journeys
   @journey_history
  end

  private
# maybe create new method called finished
# journey which then it gets sent to
# which deals with this
  def current_journey
    if !(@entry_station == nil)
      @journey_history << {@entry_station => @exit_station}
      # @entry_station = nil
    end
      if !(@exit_station == nil)
        @journey_history << {@entry_station => @exit_station}
        # @entry_station = nil
      end
  end
end
