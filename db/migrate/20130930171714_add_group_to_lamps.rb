class AddGroupToLamps < ActiveRecord::Migration
  def change
    add_column :lamps, :group_id, :integer
    add_index :lamps, :group_id
  end
end
