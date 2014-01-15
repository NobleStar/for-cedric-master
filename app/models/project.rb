class Project < ActiveRecord::Base
  
  validates :title, presence: true
  validates :goal, presence: true
  validates :goal, numericality: true
  
  attr_accessor :select_funding, :no_avail
  
  attr_accessible :image, :title, :category, :description, :location, :funding_deadline, :select_funding, :goal, :donation_rewards_attributes
  
  
  belongs_to :user
  has_one :owner_info, :dependent =>  :destroy
  has_many :donation_rewards, :dependent =>  :destroy
  
  accepts_nested_attributes_for :donation_rewards, allow_destroy: true

  
  mount_uploader :image, ImageUploader
  
end
