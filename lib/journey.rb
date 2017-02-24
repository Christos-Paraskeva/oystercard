class Journey

  attr_reader :entry_station, :exit_station, :station, :fare

  JOURNEY_COST = 1

  def initialize(station=:Acton)
    @entry_station = station
    @exit_station = nil
  end

  def complete?
    @exit_station ? true : false
  end

  # def end_journey(station)
  #   @exit_station = station
  # end

  def fare
    (@entry_station == nil || @exit_station == nil) ? 6 : 1
  end
end
