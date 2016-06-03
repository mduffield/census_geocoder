class GeocodeLookupsController < ApplicationController

  before_filter :set_api
  
  def index
  end

  def lookup
    @address = Address.new(params)
    geo_response = @api.geocode_address_and_parse_lat_long(@address)
    @error = "Unable to find location or temporary API error" unless geo_response 
    @latitude = geo_response[:lat]
    @longitude = geo_response[:long]
  end

  private

  def set_api
    @api = CensusApi.new
  end

end
