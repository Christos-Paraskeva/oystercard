require_relative 'oystercard'
require_relative 'station_lookup'

class Station

attr_reader :zone

include StationLookup

  def initialize(name)
    @name = name
    @zone = zone_lookup(name)
  end
end
