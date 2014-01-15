class AddIdentityToUsers < ActiveRecord::Migration
  def change
    add_column :users, :identity_verified, :boolean, :default => false
  end
end
