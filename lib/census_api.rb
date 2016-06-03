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
    RestClient.get(@base_url, params: query)
  end

end
