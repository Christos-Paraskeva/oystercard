require_relative 'oystercard'
require_relative 'journey'

class JourneyLog

  def start(entry_station)
    @entry_station = entry_station
  end

  def finish(exit_station)
    @exit_station = exit_station
  end
end
