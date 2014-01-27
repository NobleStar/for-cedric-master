class AddAmountDecimalTodonationRewards < ActiveRecord::Migration
  def change
    remove_column :donation_rewards, :amount
    add_column :donation_rewards, :amount, :decimal
  end
end
