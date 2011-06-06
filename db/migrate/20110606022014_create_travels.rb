class CreateTravels < ActiveRecord::Migration
  def self.up
    create_table :travels do |t|
      t.string :passenger_name
      t.references :flight

      t.timestamps
    end
  end

  def self.down
    drop_table :travels
  end
end
