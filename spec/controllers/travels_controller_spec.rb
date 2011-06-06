require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe TravelsController do
  describe :create do
    describe "creates a new travel with new air route and flight" do
      post :create, :passenger_name => "John Smith", :flight_number => "CA985", :flight_date => "2011-06-29"
      new_air_route = AirRoute.find(:last)
      new_air_route.flight_number.should == "CA985"
      # new_air_route.flight_date
    end
  end
end
