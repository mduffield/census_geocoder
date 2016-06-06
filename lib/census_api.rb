require 'rest-client'
class CensusApi 

  def initialize
    @base_url = 'http://geocoding.geo.census.gov/geocoder/locations/address'
    @format = 'json'
    @benchmark = 9
  end

  def geocode_address_and_parse_lat_long(address)
    response = geocode_address(address)
    return false unless response
    parse_lat_long(response)
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
    response = RestClient.get(@base_url, params: query)
    return false if response.code != 200
    response
  end

  def parse_lat_long(response)
    parsed = JSON.parse(response)
    return {lat: false, long: false} unless parsed["result"]["addressMatches"].any?
    coords = parsed["result"]["addressMatches"].first["coordinates"]
    {lat: coords["y"], long: coords["x"]}
  end

end
