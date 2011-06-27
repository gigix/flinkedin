class ChangePassengerOfTravels < ActiveRecord::Migration
  def self.up
    remove_column :travels, :passenger_name
    add_column :travels, :user_id, :integer
  end

  def self.down
    remove_column :travels, :user_id
    add_column :travels, :passenger_name, :string
  end
end
