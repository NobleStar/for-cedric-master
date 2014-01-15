class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :country
      t.string :image
      t.string :title
      t.string :category
      t.text :description
      t.string :location
      t.string :funding_deadline
      t.float :goal
      t.integer :user_id
      t.string :private_code
      t.boolean :is_submitted, :default => false
      t.timestamps
    end
  end
end
