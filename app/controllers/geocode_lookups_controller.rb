class GeocodeLookupsController < ApplicationController

  before_filter :set_api
  
  def new_lookup
  end

  def lookup
    @address = Address.new(params)
    @api.geocode_address(@address)
  end

  private

  def set_api
    @api = CensusApi.new
  end

end
