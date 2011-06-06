class CreateFlights < ActiveRecord::Migration
  def self.up
    create_table :flights do |t|
      t.references :air_route
      t.date :date

      t.timestamps
    end
  end

  def self.down
    drop_table :flights
  end
end
