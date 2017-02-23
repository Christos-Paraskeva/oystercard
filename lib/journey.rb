class Journey

  attr_reader :entry_station, :exit_station, :station

  JOURNEY_COST = 1

  def initialize(station)
    @entry_station = station
    @exit_station = nil
  end

  def complete?
    @exit_station ? true : false
  end

  def end_journey(station)
    @exit_station = station
  end

  def fare
    if (@entry_station == nil) then 6 else 1 end
  end
end
