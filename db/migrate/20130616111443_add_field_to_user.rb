class AddFieldToUser < ActiveRecord::Migration
  def change
    add_column :users, :newsletter, :boolean
    add_column :users, :name, :string
  end
end
