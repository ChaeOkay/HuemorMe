class AddSecretTokenColumnToUser < ActiveRecord::Migration
  def up
    add_column :users, :secret_token, :string
    User.all.each do |user|
      user.secret_token = Digest::MD5.hexdigest(user.email)
      user.save(validate: false)
    end
    remove_column :users, :username
  end

  def down
    remove_column :users, :secret_token
  end
end
