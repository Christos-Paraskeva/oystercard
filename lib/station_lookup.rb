module StationLookup
  ZONES = {
    :Euston => 1,
    :Tottenham_Hale => 2,
    :Acton => 3,
  }

  def zone_lookup(name)
    ZONES[name.to_sym]
  end
end
