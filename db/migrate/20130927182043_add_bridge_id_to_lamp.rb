class AddBridgeIdToLamp < ActiveRecord::Migration
  def change
    add_column :lamps, :bridge_id, :integer
  end
end
