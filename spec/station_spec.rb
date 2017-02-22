require 'station'

describe Station do
  it 'adds the name of the zone when initializing a new station', :zone2 => true do
    station = Station.new('Euston')
    expect(station.zone).to eq 1
  end
end
