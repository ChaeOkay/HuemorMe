class UpdateLamps < ActiveRecord::Migration
  def change
  	change_column :lamps, :brightness, :string, :default => "0"
  end
end
