class CreateAirRoutes < ActiveRecord::Migration
  def self.up
    create_table :air_routes do |t|
      t.string :number

      t.timestamps
    end
  end

  def self.down
    drop_table :air_routes
  end
end
