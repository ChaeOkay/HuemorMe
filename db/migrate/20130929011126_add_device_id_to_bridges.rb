class AddDeviceIdToBridges < ActiveRecord::Migration
  def change
  	add_column :bridges, :device_id, :string
  end
end
