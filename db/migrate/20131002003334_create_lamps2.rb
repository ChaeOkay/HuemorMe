class CreateLamps2 < ActiveRecord::Migration
  def change
    create_table :lamps do |t|
      t.string :light_identifier
      t.belongs_to :bridge
      t.boolean :on, default: false
      t.string :color
      t.string :effect
      t.string :brightness

      t.timestamps
    end
  end
end
