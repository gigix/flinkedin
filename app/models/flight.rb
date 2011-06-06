class Flight < ActiveRecord::Base
  has_many :travels
  belongs_to :air_route
end
