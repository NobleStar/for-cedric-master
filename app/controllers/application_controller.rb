class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def login_user
    @user = current_user
  end
  
end
