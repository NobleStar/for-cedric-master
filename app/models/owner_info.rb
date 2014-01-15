class OwnerInfo < ActiveRecord::Base
  attr_accessible :video_url, :description, :timeline, :photo, :name, :biography, :location, :website, :project_id, :owner_feedback
    
  belongs_to :project
  belongs_to :user
  
  validates :description, presence: true
  validates :name, presence: true
  
  mount_uploader :photo, AvatarUploader
  
  include AutoHtml
  
  auto_html_for :video_url do
    html_escape
    image
    youtube(:width => 550, :height => 400)
    vimeo(:width => 550, :height => 400)
    simple_format
  end
  
  
end
