class FlightsController < ApplicationController
  def show
      @flight = Flight.find(params[:id])
  end
end
