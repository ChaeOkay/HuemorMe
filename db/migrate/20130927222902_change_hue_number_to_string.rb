class ChangeHueNumberToString < ActiveRecord::Migration
  def change
    change_column :lamps, :hue_number, :string
  end
end
