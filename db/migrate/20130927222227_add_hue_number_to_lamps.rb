class AddHueNumberToLamps < ActiveRecord::Migration
  def change
    add_column :lamps, :hue_number, :integer
  end
end
