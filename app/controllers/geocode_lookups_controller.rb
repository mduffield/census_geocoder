class GeocodeLookupsController < ApplicationController

  before_filter :set_api
  
  def index
  end

  def lookup
    @address = Address.new(params)
    resp = @api.geocode_address(@address)
    @latitude, @longitude = @api.parse_lat_long(resp)
  end

  private

  def set_api
    @api = CensusApi.new
  end

end
