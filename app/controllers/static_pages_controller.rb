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

    # Get total amount of current user's projects donations
    @mysum = 0
    user_projects = @user.projects.where(is_submitted: true)

    if user_projects.length > 0
      @mysum = DonationReward.where("project_id IN (?)", user_projects.select(:id)).sum(:amount)
      @user_projects_donations    = DonationReward.where("project_id IN (?)", user_projects.select(:id))
    end

    # Get total amount of the other's projects donations
    @othersum = 0
    other_projects = Project.where("user_id <> '?' AND is_submitted = ?", @user.id, true)    

    if other_projects.length > 0
      @othersum = DonationReward.where("project_id IN (?)", other_projects.select(:id)).sum(:amount)
      @person_projects_donations  = DonationReward.where("project_id IN (?)", other_projects.select(:id))
    end

    @private_campaigns  = @user.projects.where("private_code IS NOT NULL").order(:created_at)
    @public_campaigns   = @user.projects.where("private_code IS NULL").order(:created_at)

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
