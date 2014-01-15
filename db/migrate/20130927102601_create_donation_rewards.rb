class CreateDonationRewards < ActiveRecord::Migration
  def change
    create_table :donation_rewards do |t|
      t.string :amount
      t.string :name
      t.text :description
      t.integer :month
      t.integer :year
      t.text :shipping_info
      t.integer :limit_number
      t.integer :project_id
      t.string :no_avail_input
      t.timestamps
    end
  end
end
