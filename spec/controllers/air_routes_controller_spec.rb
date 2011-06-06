require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe AirRoutesController do
  
  describe :query do
    it "render json results for the auto complete function" do
      AirRoute.create!(:number => "CA100")
      AirRoute.create!(:number => "CA101")
      
      get :query, :query_string => "CA"
      response.should be_success
      
      response.body.should == ["CA100", "CA101"].to_json
    end
  end

end
