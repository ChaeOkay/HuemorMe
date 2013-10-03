class AddDefaultsToLamp < ActiveRecord::Migration
  def change
  	change_column :lamps, :color, :string, :default => "10000"
  	change_column :lamps, :saturation, :string, :default => "100"
  end
end
