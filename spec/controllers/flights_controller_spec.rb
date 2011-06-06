require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe FlightsController do
  describe :show do
    it "shows all travels within a flight" do
      air_route = AirRoute.create!(:number => "CA985")
      flight = air_route.flights.create!(:date => "2011-06-29")
      10.times do |i|
        flight.travels.create!(:passenger_name => "TestPassenger#{i}")
      end
      
      get :show, :id => flight.id
      # /flights/1
      response.should be_success
      assigns(:flight).should == flight
    end
  end
end
