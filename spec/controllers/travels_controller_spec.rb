require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe TravelsController do
  integrate_views
  
  describe :create do
    it "creates a new travel with new air route and flight" do
      post :create, :passenger_name => "John Smith", :flight_number => "CA985", :flight_date => "2011-06-29"
      response.should redirect_to(travels_path)
      
      new_air_route = AirRoute.find(:last)
      new_air_route.number.should == "CA985"
      new_air_route.flights.first.date.should == Date.parse("2011-06-29")
    end
    
    it "does not create new air route or flight if already exist in database" do
      post :create, :passenger_name => "John Smith", :flight_number => "CA985", :flight_date => "2011-06-29"
      post :create, :passenger_name => "Clark Kent", :flight_number => "CA985", :flight_date => "2011-06-29"
      
      response.should redirect_to(travels_path)
      
      air_routes = AirRoute.find_all_by_number("CA985")
      air_routes.count.should == 1
      
      air_routes.first.flights.count.should == 1
    end
  end
  
  describe :index do
    it "renders" do
      get :index
      response.should be_success
    end
  end
  
end
