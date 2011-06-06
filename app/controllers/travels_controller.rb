class TravelsController < ApplicationController
  def create
    flight_number = params[:flight_number]
    air_route = AirRoute.find_by_number(flight_number) || AirRoute.create!(:number => flight_number)
    
    flight_date = params[:flight_date]
    flight = air_route.flights.find_by_date(Date.parse(flight_date)) || air_route.flights.create!(:date => flight_date)
    
    flight.travels.create!(:passenger_name => params[:passenger_name])
    
    redirect_to :action => :index
  end
  
  def index
    @travels = Travel.find(:all)
  end
end
