class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :tagline, :text
    add_column :users, :location, :string
    add_column :users, :url, :string
    add_column :users, :image, :string

  end
end
