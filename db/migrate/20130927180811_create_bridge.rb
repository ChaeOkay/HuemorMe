class CreateBridge < ActiveRecord::Migration
  def change
    create_table :bridges do |t|
      t.string :ip
      t.belongs_to :user

      t.timestamps
    end
  end
end
