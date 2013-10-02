class DropAllTablesExceptUsers < ActiveRecord::Migration
  def change
    drop_table :lamps
    drop_table :bridges
    drop_table :groups
  end
end
