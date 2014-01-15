class DonationReward < ActiveRecord::Base
  
  attr_accessible :amount, :name, :description, :shipping_info,  :month, :year, :no_avail, :limit_number, :no_avail_input
  
  belongs_to :project
  attr_accessor :no_avail
  validates :name, presence: true
  validates :no_avail_input, numericality: true, :allow_blank => true
  
end
