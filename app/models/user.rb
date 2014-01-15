class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  devise :omniauthable, :omniauth_providers => [:facebook]
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :newsletter
  # attr_accessible :title, :body
  attr_accessible :provider, :uid, :name, :tagline, :location, :url, :image

  mount_uploader :image, AvatarUploader
  
  has_many :projects
  has_many :owner_infos

  def get_location
    if self.location.blank? then
      'No Location'
    else
      self.location
    end
  end



  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
	user = User.where(:provider => auth.provider, :uid => auth.uid).first
	unless user
		user = User.create(name:auth.extra.raw_info.name,
	                     provider:auth.provider,
	                     uid:auth.uid,
	                     email:auth.info.email,
	                     password:Devise.friendly_token[0,20]
	                     )
	end
	user
  end

end
