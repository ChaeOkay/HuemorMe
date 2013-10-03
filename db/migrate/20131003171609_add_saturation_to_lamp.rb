class AddSaturationToLamp < ActiveRecord::Migration
  def change
  	add_column :lamps, :saturation, :string
  end
end
