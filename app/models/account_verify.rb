require 'active_model/validations'

class AccountVerify
  attr_accessor :first_name, :last_name, :month, :day, :year, :address1, :address2, :city, :state,:zip, :phone, :email, :error
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end
  
  # for validations
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  # Validations
  validates :first_name, :presence => true #, :on => :create
  validates :last_name, :presence => true #, :on => :create
  validates :phone, :presence => true #, :on => :create
  validates :email, :presence => true #, :on => :create
  validates :month, :presence => true #, :on => :create
  validates :day, :presence => true #, :on => :create
  validates :year, :presence => true #, :on => :create
  validates :address1, :presence => true #, :on => :create
  validates :city, :presence => true #, :on => :create
  validates :state, :presence => true #, :on => :create
  validates :zip, :presence => true #, :on => :create
  
end