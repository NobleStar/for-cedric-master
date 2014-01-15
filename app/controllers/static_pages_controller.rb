class StaticPagesController < ApplicationController
  
  before_filter :login_user
  

  
  def getting_started
    render :layout => "application"
  end

  def start_project
  	
  end
  def start_preview
	    render :layout => "application_alt"
  end
  
  def home_page
  end
  
  def browse

  end

  def profile_page

  end

  def profile_settings
  end

  def login
    
  end

  def owner_info
    render :layout => "application_alt"
  end

  def project_profile
    render :layout => "application_alt"
  end

  def verify_account
    @project = Project.first
    @account_verify = AccountVerify.new
  end

  def checklist
    render :layout => "application_alt"
  end

  def about

  end

  def dashboard
  end

  def projects
  end

  def donations
  end
end
