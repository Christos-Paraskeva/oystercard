require 'station_lookup'

class ZoneChecker
end

describe StationLookup do
  before :each do
    @zone_checker = ZoneChecker.new
    @zone_checker.extend(StationLookup)
  end

  it 'checks to see if the station name returns the correct zone', :zone => true do
    expect(@zone_checker.zone_lookup('Euston')).to eq 1
    expect(@zone_checker.zone_lookup('Acton')).to eq 3
  end
end
