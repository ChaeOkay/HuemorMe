class CreateLamps < ActiveRecord::Migration
  def change
    create_table :lamps do |t|
      t.string :name
      t.boolean :on, default: false
    end
  end
end
