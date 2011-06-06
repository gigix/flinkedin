class AirRoutesController < ApplicationController
  def query
    query_string = params[:query_string] + "%"
    results = AirRoute.find(:all, :conditions => ["number LIKE ?", query_string])
    json = results.map{ |r| r.number }.to_json
    
    self.content_type ||= Mime::JSON
    self.response_body = json
  end
end
