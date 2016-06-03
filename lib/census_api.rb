require 'rest-client'
class CensusApi 

  def initialize
    @base_url = 'http://geocoding.geo.census.gov/geocoder/locations/address'
    @format = 'json'
    @benchmark = 9
  end

  def geocode_address(address)
    query = { 
      street: address.street, 
      city: address.city, 
      state: address.state,
      zip: address.zip,
      format: @format,
      benchmark: @benchmark
    }
    puts @base_url
    resp = RestClient.get(@base_url, params: query)
    return false if resp.code != 200
    resp
  end

  def parse_lat_long(resp)
    parsed = JSON.parse(resp)
    coords = parsed["result"]["addressMatches"].first["coordinates"]
    [coords["x"], coords["y"]]
  end

end
